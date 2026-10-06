<%--<%@ Page Title="Classes Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="SchoolManagement.Classes" %>--%>
<%@ Page Title="Classes Management"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Classes.aspx.cs"
    Inherits="SchoolManagement.Classes"
    UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Alert Message Banner -->
    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert-box alert-success" Visible="false">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
    </asp:Panel>

    <div style="display: flex; flex-direction: column; gap: 30px;">
        <!-- Add Class Form -->
        <div class="card" style="max-width: 500px;">
            <div class="card-header">
                <span><i class="fa-solid fa-school"></i> <asp:Label ID="lblFormTitle" runat="server" Text="Add New Class"></asp:Label></span>
            </div>
            <div class="card-body">
                <!-- Hidden field for ClassId -->
                <asp:HiddenField ID="hfClassId" runat="server" />

                <div class="form-group">
                    <label class="form-label">Class Name *</label>
                    <asp:TextBox ID="txtClassName" runat="server" CssClass="form-control" placeholder="e.g. BCA Sem 5 or Class 10-A"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvClassName" runat="server" ControlToValidate="txtClassName" ErrorMessage="Class name is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="ClassVal"></asp:RequiredFieldValidator>
                </div>

                <div class="btn-group">
                    <asp:Button ID="btnSave" runat="server" Text="Save Class" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="ClassVal" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
                </div>
            </div>
        </div>

        <!-- Class List Grid -->
        <div class="card" style="max-width: 600px;">
            <div class="card-header">
                <span><i class="fa-solid fa-list"></i> Available Classes</span>
            </div>
            <div class="card-body">
                <div class="table-container">
                    <asp:GridView ID="gvClasses" runat="server" AutoGenerateColumns="False" CssClass="grid-view" 
                        DataKeyNames="ClassId" OnRowCommand="gvClasses_RowCommand" OnRowDeleting="gvClasses_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="ClassName" HeaderText="Class Name" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditClass" CommandArgument='<%# Eval("ClassId") %>' Text="<i class='fa-solid fa-pen-to-square'></i> Edit" CausesValidation="false"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="<i class='fa-solid fa-trash'></i> Delete" OnClientClick="return confirm('Deleting this class will also delete all associated students and attendance data. Proceed?');" CausesValidation="false"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding: 20px; text-align: center; color: var(--text-muted);">
                                No classes have been registered yet.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
