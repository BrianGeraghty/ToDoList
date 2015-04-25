using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var rep = new TaskRepository();
            blCategories.DataSource = rep.GetCategoriesList();
            blCategories.DataBind();
        }
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            var rep = new TaskRepository();

            try
            {
                rep.AddCategory(tbCategoryName.Text);
                blCategories.DataSource = rep.GetCategoriesList();
                blCategories.DataBind();
                tbCategoryName.Text = String.Empty;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Error creating task: " + ex.ToString();
            }
        }
    }
}