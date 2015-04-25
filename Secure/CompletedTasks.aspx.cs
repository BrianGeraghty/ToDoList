using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompletedTasks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var rep = new TaskRepository();

            MembershipUser user = Membership.GetUser();
            var completedTasks = rep.GetCompletedTasksByOwner(user.UserName);

            var categories = rep.GetCategoriesList();

            var query = from t in completedTasks
                        join c in categories on t.CategoryId equals c.CategoryId
                        select new
                        {
                            t.Name,
                            CategoryName = c.Name,
                            StartDate = t.StartDate.ToString("MMMM dd, yyyy"),
                            DueDate = t.DueDate.ToString("MMMM dd, yyyy"),
                            t.Priority,
                            PercentComplete = t.PercentComplete + "%",
                            t.Completed,
                        };

            gvCompletedTasks.DataSource = query;
            gvCompletedTasks.DataBind();
        }
    }
}