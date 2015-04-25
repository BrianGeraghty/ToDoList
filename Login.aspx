<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:Login ID="Login1" runat="server">
    </asp:Login>
<asp:HyperLink ID="hlCreateNewUser" runat="server" NavigateUrl="~/CreateNewUser.aspx">Create New Account</asp:HyperLink>
</asp:Content>

