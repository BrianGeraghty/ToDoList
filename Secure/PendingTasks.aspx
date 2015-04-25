<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PendingTasks.aspx.cs" Inherits="PendingTasks" StylesheetTheme="SkinFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:GridView ID="gvPendingTasks" runat="server" AutoGenerateSelectButton ="True" 
        SkinID="gridviewSkin" OnSelectedIndexChanged="gvPendingTasks_SelectedIndexChanged" >

        <EmptyDataTemplate>
            You have no pending tasks
        </EmptyDataTemplate>

    </asp:GridView>
    <br />
</asp:Content>



