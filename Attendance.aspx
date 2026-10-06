<%--<%@ Page Title="Mark Student Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="SchoolManagement.Attendance" %>--%>
<%@ Page Title="Mark Student Attendance"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Attendance.aspx.cs"
    Inherits="SchoolManagement.Attendance"
    UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Alert Message Banner -->
    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert-box alert-success" Visible="false">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Selection Controls Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-calendar-days"></i> Select Class & Date</span>
        </div>
        <div class="card-body">
            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">Select Class *</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="ddlClass" InitialValue="" ErrorMessage="Please select a class" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="AttendanceLoad"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Attendance Date *</label>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" AutoPostBack="true" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please select a date" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="AttendanceLoad"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="btn-group">
                <asp:Button ID="btnLoad" runat="server" Text="Load Class Students" CssClass="btn btn-primary" OnClick="btnLoad_Click" ValidationGroup="AttendanceLoad" />
            </div>
        </div>
    </div>

    <!-- Attendance Grid Card -->
    <asp:Panel ID="pnlAttendanceGrid" runat="server" CssClass="card" Visible="false">
        <div class="card-header">
            <span><i class="fa-solid fa-check-double"></i> Mark Attendance Sheet</span>
            <asp:Label ID="lblSheetInfo" runat="server" CssClass="header-date" Style="font-weight: 500; color: var(--primary-color);"></asp:Label>
        </div>
        <div class="card-body">
            <div class="table-container">
                <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" CssClass="grid-view" DataKeyNames="StudentId" OnRowDataBound="gvAttendance_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" HeaderStyle-Width="150px" />
                        <asp:BoundField DataField="FullName" HeaderText="Student Name" />
                        <asp:TemplateField HeaderText="Attendance Status" HeaderStyle-Width="300px">
                            <ItemTemplate>
                                <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" CssClass="attendance-radio">
                                    <asp:ListItem Value="Present">Present</asp:ListItem>
                                    <asp:ListItem Value="Absent">Absent</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:HiddenField ID="hfPrevStatus" runat="server" Value='<%# Eval("Status") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="padding: 20px; text-align: center; color: var(--text-muted);">
                            No students registered in this class.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <div class="btn-group" style="margin-top: 20px;">
                <asp:Button ID="btnSaveAttendance" runat="server" Text="Save Attendance Sheet" CssClass="btn btn-primary" OnClick="btnSaveAttendance_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
