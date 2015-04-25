<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                &nbsp;<asp:Label ID="lblCategoryHeading" runat="server" Font-Bold="True" ForeColor="#003D5C" Text="The current categories are: "></asp:Label>
           
            <asp:BulletedList ID="blCategories" runat="server" DataTextField="Name" DataValueField="CategoryId">
            </asp:BulletedList>
                <p>
                </p>
                <br />
                New Category Name:
                <asp:TextBox ID="tbCategoryName" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbCategoryName" Display="Dynamic" ErrorMessage="You must enter a category name" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp;&nbsp;
                <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create Category" />
                <br />
                <br />
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                <br />
             </p>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

