<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUserRoles.aspx.cs" Inherits="Secure_Admin_ManageUserRoles" StylesheetTheme="SkinFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <br />
    Roles:
    <asp:DropDownList ID="ddlRoles" runat="server" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
        <Items>
            <asp:ListItem Text="Select" Value="" />
        </Items>
    </asp:DropDownList>
    &nbsp;&nbsp; Users:&nbsp;
    <asp:DropDownList ID="ddlUsers" runat="server" AppendDataBoundItems="true">
        <Items>
            <asp:ListItem Text="Select" Value="" />
        </Items>
    </asp:DropDownList>
    &nbsp;
    <asp:Button ID="btnAddUser" runat="server" Text="Add User to Role" OnClick="btnAddUser_Click" />
    <br />
    <br />
    Users in Role:&nbsp;
    <asp:GridView ID="gvUsersInRole" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowCommand="GvUsersInRole_RemoveFromRole" SkinID="gridviewSkin">
        <Columns>
            <asp:TemplateField HeaderText="User Name">
                <ItemTemplate>
                    <%# Container.DataItem.ToString() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField Text="Remove From Role" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="~/Secure/Admin/ManageUsers.aspx">Go Back</asp:HyperLink>
    <br />
    &nbsp; 
</asp:Content>

