<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagement.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagement.Register" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register - School Management System</title>

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <link href="~/css/style.css" rel="stylesheet" type="text/css" />
</head>



<body class="login-body">

    <form id="form1" runat="server">

        <div class="login-card">

            <div class="login-logo">
                <i class="fa-solid fa-graduation-cap"></i>
                School<span>Management</span>
            </div>

            <p class="login-subtitle">
                Create your School Management account
            </p>

            <!-- Full Name -->
            <div class="form-group">
                <label class="form-label">Full Name</label>

                <asp:TextBox ID="txtFullName"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter full name">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvFullName"
                    runat="server"
                    ControlToValidate="txtFullName"
                    ErrorMessage="Full name is required"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Username -->
            <div class="form-group">
                <label class="form-label">Username</label>

                <asp:TextBox ID="txtUsername"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter username">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvUsername"
                    runat="server"
                    ControlToValidate="txtUsername"
                    ErrorMessage="Username is required"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label class="form-label">Password</label>

                <asp:TextBox ID="txtPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Enter password">
                </asp:TextBox>

                <asp:RequiredFieldValidator
                    ID="rfvPassword"
                    runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage="Password is required"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RequiredFieldValidator>
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label class="form-label">Confirm Password</label>

                <asp:TextBox ID="txtConfirmPassword"
                    runat="server"
                    TextMode="Password"
                    CssClass="form-control"
                    placeholder="Confirm password">
                </asp:TextBox>

                <asp:CompareValidator
                    ID="cvPassword"
                    runat="server"
                    ControlToValidate="txtConfirmPassword"
                    ControlToCompare="txtPassword"
                    ErrorMessage="Passwords do not match"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:CompareValidator>
            </div>

            <!-- Role -->
            <div class="form-group">
                <label class="form-label">Role</label>

                <asp:DropDownList
                    ID="ddlRole"
                    runat="server"
                    CssClass="form-control">

                    <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                    <asp:ListItem Text="Teacher" Value="Teacher"></asp:ListItem>

                </asp:DropDownList>
            </div>

            <!-- Register Button -->
            <asp:Button
                ID="btnRegister"
                runat="server"
                Text="Save"
                CssClass="login-btn"
                OnClick="btnRegister_Click" />

            <br />

            <asp:Label
                ID="lblMessage"
                runat="server"
                Visible="false">
            </asp:Label>

            <br />

            <div style="text-align: center; margin-top: 15px;">
                <span>Already have an account?</span>
                <a href="Login.aspx">Login</a>
            </div>

        </div>


        <!-- GridView MUST be inside form -->

            <asp:GridView
                ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered"
                OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">

                <Columns>

                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label
                                ID="Label7"
                                runat="server"
                                Text='<%# Eval("Id") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Full Name">
                        <ItemTemplate>
                            <asp:Label
                                ID="Label1"
                                runat="server"
                                Text='<%# Eval("Full Name") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Username">
                        <ItemTemplate>
                            <asp:Label
                                ID="Label2"
                                runat="server"
                                Text='<%# Eval("Username") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label
                                ID="Label3"
                                runat="server"
                                Text='<%# Eval("Password") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Confirm Password">
                        <ItemTemplate>
                            <asp:Label
                                ID="Label4"
                                runat="server"
                                Text='<%# Eval("Confirm Password") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label
                                ID="Label5"
                                runat="server"
                                Text='<%# Eval("Role") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--  <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton
                    ID="LinkButton1"
                    runat="server"
                    CommandArgument='<%# Eval("Id") %>'
                    CommandName="cmd_edt">
                    Edit
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton
                    ID="LinkButton2"
                    runat="server"
                    CommandArgument='<%# Eval("Id") %>'
                    CommandName="cmd_del">
                    Delete
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_del">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
    </form>

</body>
</html>
