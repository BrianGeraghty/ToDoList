<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TasksByCategory.aspx.cs" Inherits="TasksByCategory" StylesheetTheme="SkinFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            Select a category:
            <asp:DropDownList ID="ddlCategories" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged"
                DataValue="CategoryId" DataTextField="Name" AutoPostBack="True">
                <Items>
                    <asp:ListItem Text="Select" Value="" />
                </Items>
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="gvTasks" runat="server" SkinID="gridviewSkin">
                <EmptyDataTemplate>
                    You have no tasks in this category
                </EmptyDataTemplate>
            </asp:GridView>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

