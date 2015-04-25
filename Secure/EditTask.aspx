<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditTask.aspx.cs" Inherits="EditTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />

    <script>
        function pageLoad(sender, args) {
            $(function () {
                $("#tbStartDate").datepicker({
                    showOtherMonths: true,
                    selectOtherMonths: true
                });

                $("#tbDueDate").datepicker({
                    showOtherMonths: true,
                    selectOtherMonths: true
                });
            });
        }
    </script>

    <style type="text/css">
        div.ui-datepicker {
            font-size: 62.5%;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <p>
                    <td colspan="2">
                        <div style="float: left; width: 80px">
                            <asp:Label ID="lblTaskName" runat="server" Text="Task Name:"></asp:Label>
                        </div>

                        <div style="float: left; width: 100px">
                            <asp:TextBox ID="tbName" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div style="clear: both"></div>
                        <br />
                    </td>
                </p>
                <p>
                    <td colspan="2">
                        <div style="float: left; width: 80px">
                            <asp:Label ID="lblCat" runat="server" Text="Category:"></asp:Label>
                        </div>

                        <div style="float: left; width: 100px">
                            <asp:DropDownList ID="ddlCategory" runat="server" DataTextField="Name"
                                DataValueField="CategoryId" AppendDataBoundItems="true">
                                <Items>
                                    <asp:ListItem Text="Select" Value="" />
                                </Items>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCategory"
                                Display="Dynamic" ErrorMessage="You must select a category" ForeColor="Red">*</asp:RequiredFieldValidator>

                        </div>
                        <div style="clear: both"></div>
                        <br />

                    </td>
                </p>
                <p>
                    <td colspan="2">
                        <div style="float: left; width: 80px">
                            <asp:Label ID="lblStartDate" runat="server" Text="Start Date:"></asp:Label>
                        </div>

                        <div style="float: left; width: 100px">
                            <asp:TextBox runat="server" ID="tbStartDate" ClientIDMode="Static"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                                ErrorMessage="You must select a start date" ForeColor="Red" ControlToValidate="tbStartDate">*</asp:RequiredFieldValidator>
                        </div>
                        <div style="clear: both"></div>
                        <br />
                    </td>
                </p>
                <p>
                    <td colspan="2">
                        <div style="float: left; width: 80px">
                            <asp:Label ID="lblDueDate" runat="server" Text="Due Date:"></asp:Label>
                        </div>

                        <div style="float: left; width: 100px">
                    
                            <asp:TextBox runat="server" ID="tbDueDate" ClientIDMode="Static"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                                ErrorMessage="You must select a due date" ForeColor="Red" ControlToValidate="tbDueDate">*</asp:RequiredFieldValidator>
                            </div>
                        <div style="clear: both"></div>
                    <br />
                    </td>
                </p>
                <p>
                    <asp:CheckBox ID="cbCompleted" runat="server" Text="Completed" AutoPostBack="True" OnCheckedChanged="cbCompleted_CheckedChanged" />
                    <br />
                    <br />
                </p>
                <p>
                    <td colspan="2">
                        <div style="float: left; width: 80px">
                            <asp:Label ID="lblPriority" runat="server" Text="Priority:"></asp:Label>
                        </div>

                        <div style="float: left; width: 100px">              
                            <asp:DropDownList ID="ddlPriority" runat="server" AppendDataBoundItems="true" DataValueField="">
                            <Items>
                                 <asp:ListItem Text="Select" Value="" />
                            </Items>
                           </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlPriority"
                            Display="Dynamic" ErrorMessage="You must select a priority level" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                        <div style="clear: both"></div>
                    <br />
                    </td>
                </p>
                <p>
                           <td colspan="2">
                        <div style="float: left; width: 80px">
                            <asp:Label ID="lblPercentComplete" runat="server" Text="Percentage Complete:"></asp:Label>
                        </div>

                        <div style="float: left; width: 100px">    
                            <asp:DropDownList ID="ddlPercentComplete" runat="server" AppendDataBoundItems="true" DataTextField="Value" DataValueField="Key">
                    <Items>
                        <asp:ListItem Text="Select" Value="" />
                    </Items>
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlPercentComplete"
                        Display="Dynamic" ErrorMessage="Percentage Complete is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </div>
                    <div style="clear: both"></div>
                        <br />
                    </td>
                </p>
                <p>
                    <asp:Button ID="btnSaveChanges" runat="server" Text="Save Changes" OnClick="btnSaveChanges_Click" />
                    &nbsp; &nbsp;<asp:HyperLink ID="hlBack" runat="server" NavigateUrl="~/Secure/PendingTasks.aspx">Go Back</asp:HyperLink>
                    &nbsp;&nbsp;
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label>
                    <asp:BulletedList ID="blValidationErrors" runat="server" EnableViewState="False" ForeColor="Red">
                    </asp:BulletedList>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Height="82px" />
                </p>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

