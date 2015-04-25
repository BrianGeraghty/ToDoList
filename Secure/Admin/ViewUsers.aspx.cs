using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Secure_Admin_ViewUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var users = Membership.GetAllUsers().OfType<MembershipUser>().ToList();

        var query = from u in users
                    select new
                    {
                        u.UserName,
                        u.Email,
                        u.CreationDate,
                        u.LastLoginDate
                    };
        
        gvUsers.DataSource = query.ToList();
        gvUsers.DataBind();
    }
}