<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DisplayTasks.aspx.cs" Inherits="DisplayTasks" StylesheetTheme="SkinFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ListView ID="lvTasks" runat="server">
        <LayoutTemplate>
            <table>
                <thead>
                    <tr>
                        <th>Task Name</th>
                        <th>Category</th>
                        <th>Start Date</th>
                        <th>Due Date</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Percentage Complete</th>
                    </tr>
                </thead>

                <tbody>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                </tbody>
            </table>
        </LayoutTemplate>

        <ItemTemplate>
            <tr>
                <td align="center"><%# Eval("Name") %></td>
                <td align="center"><%# Eval("CategoryName") %></td>
                <td align="center"><%# Eval("StartDate") %></td>
                <td align="center"><%# Eval("DueDate") %></td>
                <td align="center"><%# Eval("Priority") %></td>
                <td align="center"><%# Eval("Completed")%></td>
                <td align="center"><%# Eval("PercentComplete") %></td>
            </tr>
        </ItemTemplate>

        <EmptyDataTemplate>
            You have no tasks 
        </EmptyDataTemplate>

    </asp:ListView>
    </asp:Content>

