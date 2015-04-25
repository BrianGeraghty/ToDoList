<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteUsers.aspx.cs" Inherits="Secure_Admin_DeleteUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <p>
        Select a user to delete:&nbsp;
        <asp:DropDownList ID="ddlUsers" runat="server" AppendDataBoundItems="true">
            <Items>
                <asp:ListItem Text="Select" Value="" />
            </Items>

        </asp:DropDownList>
    </p>
    <br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <p>
        <asp:Button ID="btnDeleteUser" runat="server" OnClick="btnDeleteUser_Click" Text="Delete User" />
    <br />
    <br />
    </p>
    <p>
        <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="~/Secure/Admin/ManageUsers.aspx">Go Back</asp:HyperLink>
    
    </p>
</asp:Content>

