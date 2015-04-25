using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secure_Admin_DeleteUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var users = Membership.GetAllUsers();
            ddlUsers.DataSource = users;
            ddlUsers.DataBind();
        }
    }
    protected void btnDeleteUser_Click(object sender, EventArgs e)
    {
        if (ddlUsers.SelectedIndex != 0)
        {
            Membership.DeleteUser(ddlUsers.SelectedValue);
            lblMsg.Text = ddlUsers.SelectedValue + " has been deleted";

            ddlUsers.Items.Clear();
            var users = Membership.GetAllUsers();
            ddlUsers.DataSource = users;
            ddlUsers.DataBind();
            ddlUsers.SelectedIndex = -1;
        }
        else
        {
            lblMsg.Text = "You must select a user";
        }
    }
}