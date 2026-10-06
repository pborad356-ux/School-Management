<%--<%@ Page Title="Students Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="SchoolManagement.Students" %>--%>
<%@ Page Title="Students Management"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Students.aspx.cs"
    Inherits="SchoolManagement.Students"
    UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Alert Message Banner -->
    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert-box alert-success" Visible="false">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Split view for Form (Left or Top) and Grid (Right or Bottom) -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-user-plus"></i> <asp:Label ID="lblFormTitle" runat="server" Text="Add New Student"></asp:Label></span>
        </div>
        <div class="card-body">
            <!-- Hidden field to store StudentId during edits -->
            <asp:HiddenField ID="hfStudentId" runat="server" />

            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">Roll Number *</label>
                    <asp:TextBox ID="txtRollNum" runat="server" CssClass="form-control" placeholder="e.g. BCA001"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRollNum" runat="server" ControlToValidate="txtRollNum" ErrorMessage="Roll number is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="StudentVal"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Full Name *</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="e.g. Raj Patel"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Name is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="StudentVal"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="e.g. raj@example.com"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email address" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="StudentVal"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Gender *</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">-- Select Gender --</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" InitialValue="" ErrorMessage="Gender is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="StudentVal"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Date of Birth *</label>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" ErrorMessage="DOB is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="StudentVal"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Assign Class *</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="ddlClass" InitialValue="" ErrorMessage="Class assignment is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="StudentVal"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnSave" runat="server" Text="Save Student" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="StudentVal" />
                <asp:Button ID="btnClear" runat="server" Text="Clear Form" CssClass="btn btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
            </div>
        </div>
    </div>

    <!-- Student List Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-list"></i> Enrolled Students</span>
            <!-- Search Control -->
            <div class="search-container" style="margin-bottom:0; max-width:250px;">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name or roll..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
            </div>
        </div>
        <div class="card-body">
            <div class="table-container">
                <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" CssClass="grid-view" 
                    DataKeyNames="StudentId" OnRowCommand="gvStudents_RowCommand" OnRowDeleting="gvStudents_RowDeleting" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvStudents_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email Address" NullDisplayText="N/A" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:BoundField DataField="DOB" HeaderText="Date of Birth" DataFormatString="{0:dd-MMM-yyyy}" />
                        <asp:BoundField DataField="ClassName" HeaderText="Class Assigned" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditStudent" CommandArgument='<%# Eval("StudentId") %>' Text="<i class='fa-solid fa-pen-to-square'></i> Edit" CausesValidation="false"></asp:LinkButton>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="<i class='fa-solid fa-trash'></i> Delete" OnClientClick="return confirm('Are you sure you want to delete this student?');" CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="pager" />
                    <EmptyDataTemplate>
                        <div style="padding: 20px; text-align: center; color: var(--text-muted);">
                            No student records found.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
