using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TaskRepository rep = new TaskRepository();

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
        }
    }
    protected void btnAddTask_Click(object sender, EventArgs e)
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
                    rep.AddTask(myTask);
                    lblMessage.Text = "The task has been saved, please enter another one";

                    tbName.Text = String.Empty;
                    ddlCategory.SelectedIndex = -1;
                    tbStartDate.Text = String.Empty;
                    tbDueDate.Text = String.Empty;
                    cbCompleted.Checked = false;
                    ddlPriority.SelectedIndex = -1;
                    ddlPercentComplete.SelectedIndex = -1;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error adding new task: " + ex.Message;
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
        myTask.Name = tbName.Text;
        myTask.StartDate = DateTime.ParseExact(tbStartDate.Text, @"MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        myTask.DueDate = DateTime.ParseExact(tbDueDate.Text, @"MM/dd/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        myTask.Completed = cbCompleted.Checked;
        myTask.Priority = ddlPriority.SelectedIndex;
        myTask.PercentComplete = Int32.Parse(ddlPercentComplete.SelectedValue);
        myTask.CategoryId = Int32.Parse(ddlCategory.SelectedValue);
        MembershipUser user = Membership.GetUser();
        myTask.UserName = user.UserName;

        return myTask;
    }
}