using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditTask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string queryString = Request.QueryString["TaskId"];

            if (string.IsNullOrEmpty(queryString))
            {
                Response.Redirect("~/Secure/PendingTasks.aspx");
            }

            var rep = new TaskRepository();

            ddlCategory.DataSource = rep.GetCategoriesList();
            ddlCategory.DataBind();

            var priorities = new List<String>();
            priorities.Add("Low");
            priorities.Add("Medium");
            priorities.Add("High");
            ddlPriority.DataSource = priorities;
            ddlPriority.DataBind();

            var percentages = new Dictionary<int, string>();
            percentages.Add(0, "0%");
            percentages.Add(25, "25%");
            percentages.Add(50, "50%");
            percentages.Add(75, "75%");
            percentages.Add(100, "100%");
            ddlPercentComplete.DataSource = percentages;
            ddlPercentComplete.DataBind();

            int taskId = 0;
            Int32.TryParse(queryString, out taskId);
            
            var task = rep.GetTask(taskId);
            PopulateFields(task);
        }
    }

    protected void PopulateFields(Task task)
    {
        tbName.Text = task.Name;

        var rep = new TaskRepository();
        var categories = rep.GetCategoriesList();

        ddlCategory.SelectedValue = task.CategoryId.ToString();
        tbStartDate.Text = task.StartDate.ToString("MM/dd/yyyy");
        tbDueDate.Text = task.DueDate.ToString("MM/dd/yyyy");
        cbCompleted.Checked = task.Completed;
        ddlPriority.SelectedIndex = task.Priority;
        ddlPercentComplete.SelectedValue = task.PercentComplete.ToString();
    }

    protected void btnSaveChanges_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Task myTask = GetTaskData();
            TaskValidator validator = new TaskValidator();
            TaskRepository rep = new TaskRepository();

            if (validator.ValididateTask(myTask))
            {
                try
                {
                    rep.UpdateTask(myTask);
                    lblMessage.Text = "The changes have been saved";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error updating task: " + ex.Message;
                }
            }
            else
            {
                blValidationErrors.DataSource = validator.ErrorMessages;
                blValidationErrors.DataBind();
            }
        }
    }

    protected Task GetTaskData()
    {
        Task myTask = new Task();
        myTask.TaskId = Convert.ToInt32(Request.QueryString["TaskId"]);
        myTask.Name = tbName.Text;
        myTask.StartDate = DateTime.ParseExact(tbStartDate.Text, @"MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        myTask.DueDate = DateTime.ParseExact(tbDueDate.Text, @"MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        myTask.Completed = cbCompleted.Checked;
        myTask.Priority = ddlPriority.SelectedIndex;
        myTask.PercentComplete = Int32.Parse(ddlPercentComplete.SelectedValue);
        myTask.CategoryId = Int32.Parse(ddlCategory.SelectedValue);

        return myTask;
    }
    protected void cbCompleted_CheckedChanged(object sender, EventArgs e)
    {
        if (cbCompleted.Checked == true)
        {
            ddlPercentComplete.SelectedValue = "100";
            ddlPercentComplete.Enabled = false;
        }
        else
        {
            ddlPercentComplete.Enabled = true;
        }
    }
}