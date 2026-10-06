<%--<%@ Page Title="Teachers Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs" Inherits="SchoolManagement.Teachers" %>--%>
<%@ Page Title="Teachers Management"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Teachers.aspx.cs"
    Inherits="SchoolManagement.Teachers"
    UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Alert Message Banner -->
    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert-box alert-success" Visible="false">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Teacher Input Form -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-user-plus"></i> <asp:Label ID="lblFormTitle" runat="server" Text="Add New Teacher"></asp:Label></span>
        </div>
        <div class="card-body">
            <!-- Hidden field for TeacherId during edit -->
            <asp:HiddenField ID="hfTeacherId" runat="server" />

            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">Full Name *</label>
<%--                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="e.g. Dr. Amit Mehta" OnTextChanged="txtFullName_TextChanged"></asp:TextBox>--%>
             <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="e.g. Dr. Amit Mehta"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Name is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="TeacherVal"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="e.g. amit@example.com"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email address" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="TeacherVal"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Mobile Number</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="e.g. 9876543210"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Specialization / Subject</label>
                    <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control" placeholder="e.g. ASP.NET & C#"></asp:TextBox>
                </div>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnSave" runat="server" Text="Save Teacher" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="TeacherVal" />
                <asp:Button ID="btnClear" runat="server" Text="Clear Form" CssClass="btn btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
            </div>
        </div>
    </div>

    <!-- Teacher List Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-list"></i> Teacher Registry</span>
            <!-- Search Control -->
            <div class="search-container" style="margin-bottom:0; max-width:250px;">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
            </div>
        </div>
        <div class="card-body">
            <div class="table-container">
                <asp:GridView ID="gvTeachers" runat="server" AutoGenerateColumns="False" CssClass="grid-view" 
                    DataKeyNames="TeacherId" OnRowCommand="gvTeachers_RowCommand" OnRowDeleting="gvTeachers_RowDeleting" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvTeachers_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Teacher Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email Address" NullDisplayText="N/A" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile Number" NullDisplayText="N/A" />
                        <asp:BoundField DataField="Specialization" HeaderText="Subject / Specialization" NullDisplayText="N/A" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditTeacher" CommandArgument='<%# Eval("TeacherId") %>' Text="<i class='fa-solid fa-pen-to-square'></i> Edit" CausesValidation="false"></asp:LinkButton>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="<i class='fa-solid fa-trash'></i> Delete" OnClientClick="return confirm('Are you sure you want to delete this teacher?');" CausesValidation="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle CssClass="pager" />
                    <EmptyDataTemplate>
                        <div style="padding: 20px; text-align: center; color: var(--text-muted);">
                            No teacher records found.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
