<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:BulletedList ID="blManageUsersLinks" runat="server" DisplayMode="HyperLink">
        <asp:ListItem Text="View all Users" Value="~/Secure/Admin/ViewUsers.aspx"></asp:ListItem>
        <asp:ListItem Text="Manage User Roles" Value="~/Secure/Admin/ManageUserRoles.aspx"></asp:ListItem>
        <asp:ListItem Text="Delete Users" Value="~/Secure/Admin/DeleteUsers.aspx"></asp:ListItem>
    </asp:BulletedList>
</asp:Content>