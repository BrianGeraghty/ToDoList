using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblTime.Text = DateTime.Now.ToShortTimeString();
    }

    public string Time
    {
        get { return lblTime.Text; }
        set{ lblTime.Text = value; }
    }

    public string UserName
    {
        get { return loginName.ToString(); }
    }

}