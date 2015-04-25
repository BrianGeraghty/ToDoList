<%@ Application Language="C#" %>

<script RunAt="server">

    static string ADMINISTRATORS = "Administrators";
    static string USERS = "Users";
    
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        if (!Roles.RoleExists(ADMINISTRATORS))
        {
            Roles.CreateRole(ADMINISTRATORS);
        }
        
        if(!Roles.RoleExists(USERS))
        {
            Roles.CreateRole(USERS);
        }
        
        if (Membership.GetUser("instructor") == null)
        {
            Membership.CreateUser("instructor", "abc!123", "instructor@me.com");
            Roles.AddUserToRole("instructor", ADMINISTRATORS);
        }
    }

    void Application_End(object sender, EventArgs e)
    {
        // Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
