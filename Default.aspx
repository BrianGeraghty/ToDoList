<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div id="bodyRightPan">
        <p>
            This is a simple website that keeps track of tasks for multiple users.
            There are two accounts created already and you can sign up for a new account by 
            clicking on the login link and selecting create a new account.
            <br />
            <br />
            There are two different roles, Administrators and Users. When you sign 
            up for a new account you will set up as a user by default. 
            <br />
            <br />
            A User can create new tasks, view their own tasks and edit their pending tasks.
            <br />
            <br />
            An Administrator can create their new tasks, view their own tasks, edit their
            pending tasks, add/remove users from groups and delete users. They cannot
            see or edit other users tasks.
            <br />
            <br />
            The accounts already created are:
            <br />
            Administrator Role <br />
            UserName: instructor <br />
            Password: abc!123 <br /> <br />
            User Role <br />
            UserName: jdoe <br />
            Password: abc!123 <br />
        </p>
    </div>
</asp:Content>
