using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TasksByCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var rep = new TaskRepository();
            ddlCategories.DataSource = rep.GetCategoriesList();
            ddlCategories.DataBind();
        }
    }

    protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        var rep = new TaskRepository();

        MembershipUser user = Membership.GetUser();
        
        var categories = rep.GetCategoriesList();

        var selectedCategory = (from c in categories
                               where c.Name == ddlCategories.SelectedValue
                                select c).SingleOrDefault<Category>();

        var tasks = rep.GetUserTasksByCategory(user.UserName, selectedCategory.CategoryId);

        var query = from t in tasks
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

        gvTasks.DataSource = query;
        gvTasks.DataBind();
    }
}