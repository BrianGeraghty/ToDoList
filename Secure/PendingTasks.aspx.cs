using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PendingTasks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var rep = new TaskRepository();
            MembershipUser user = Membership.GetUser();
            var pendingTasks = rep.GetPendingTasksByOwner(user.UserName);
            var categories = rep.GetCategoriesList();

            var query = from t in pendingTasks
                        join c in categories on t.CategoryId equals c.CategoryId
                        select new
                        {
                            t.TaskId,
                            t.Name,
                            CategoryName = c.Name,
                            StartDate = t.StartDate.ToString("MMMM dd, yyyy"),
                            DueDate = t.DueDate.ToString("MMMM dd, yyyy"),
                            t.Priority,
                            PercentComplete = t.PercentComplete + "%",
                            t.Completed
                        };

            gvPendingTasks.DataSource = query;
            gvPendingTasks.DataBind();
        } 
    }

    protected void gvPendingTasks_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gvPendingTasks.SelectedRow;
        Response.Redirect("EditTask.aspx?TaskId=" + row.Cells[1].Text);
    }
}