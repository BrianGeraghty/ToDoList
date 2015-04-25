<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewUsers.aspx.cs" Inherits="Secure_Admin_ViewUsers" StylesheetTheme="SkinFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:GridView ID="gvUsers" runat="server" SkinID="gridviewSkin">
    </asp:GridView>
    <br />
    <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="~/Secure/Admin/ManageUsers.aspx">Go Back</asp:HyperLink>
</asp:Content>

