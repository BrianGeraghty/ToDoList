using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secure_Admin_ManageUserRoles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = String.Empty;

        if (!IsPostBack)
        {
            // Bind roles to ListBox.
            string[] rolesArray = Roles.GetAllRoles();
            ddlRoles.DataSource = rolesArray;
            ddlRoles.DataBind();

            // Bind users to ListBox.
            MembershipUserCollection users = Membership.GetAllUsers();
            ddlUsers.DataSource = users;
            ddlUsers.DataBind();
        }

        if (ddlRoles.SelectedIndex != 0)
        {
            // Show users in role. Bind user list to GridView.
            string[] usersInRole = Roles.GetUsersInRole(ddlRoles.SelectedItem.Value);
            gvUsersInRole.DataSource = usersInRole;           
            gvUsersInRole.DataBind();
        }
    }
    protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlRoles.SelectedIndex != 0)
        {
            // Show users in role. Bind user list to GridView.
            string[] usersInRole = Roles.GetUsersInRole(ddlRoles.SelectedItem.Value);
            gvUsersInRole.DataSource = usersInRole;
            gvUsersInRole.DataBind();
        }
    }
  
    protected void GvUsersInRole_RemoveFromRole(object sender, GridViewCommandEventArgs args)
    {
        int index = Convert.ToInt32(args.CommandArgument);
        string username = ((DataBoundLiteralControl)gvUsersInRole.Rows[index].Cells[0].Controls[0]).Text;

        // Remove the user from the selected role.
        try
        {
            Roles.RemoveUserFromRole(username, ddlRoles.SelectedItem.Value);
        }
        catch (Exception e)
        {
            lblMsg.Text = "An exception of type " + e.GetType().ToString() +
                       " was encountered removing the user from the role.";
        }


        // Re-bind users in role to GridView.
        string[] usersInRole = Roles.GetUsersInRole(ddlRoles.SelectedItem.Value);
        gvUsersInRole.DataSource = usersInRole;
        gvUsersInRole.DataBind();
    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        if (ddlRoles.SelectedIndex == 0)
        {
            lblMsg.Text = "Please select a role.";
            return;
        }

        // Verify that at least one user is selected.
        if (ddlUsers.SelectedIndex == 0)
        {
            lblMsg.Text = "Please select a user.";
            return;
        }

        string newuser = ddlUsers.SelectedItem.Text; 

        // Add the user to the selected role.
        try
        {
            Roles.AddUserToRole(newuser, ddlRoles.SelectedItem.Value);

            // Re-bind users in role to GridView.
            string[] usersInRole = Roles.GetUsersInRole(ddlRoles.SelectedItem.Value);
            gvUsersInRole.DataSource = usersInRole;
            gvUsersInRole.DataBind();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
