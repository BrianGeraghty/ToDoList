<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CompletedTasks.aspx.cs" Inherits="CompletedTasks" StylesheetTheme="SkinFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:GridView ID="gvCompletedTasks" runat="server" SkinID="gridviewSkin">
        <EmptyDataTemplate>
            You have no completed tasks
        </EmptyDataTemplate>
    </asp:GridView>
    <br />
</asp:Content>

