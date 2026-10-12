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
    
<style>
    /* ================================
       SCHOOL MANAGEMENT - 6D REGISTER UI
       ================================ */

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
    }

    /* ---------- BACKGROUND ---------- */

    .login-body {
        min-height: 100vh;
        padding: 50px 20px;
        background:
            radial-gradient(circle at 10% 20%, rgba(99, 102, 241, 0.25), transparent 30%),
            radial-gradient(circle at 90% 80%, rgba(14, 165, 233, 0.25), transparent 30%),
            linear-gradient(135deg, #eef2ff 0%, #f8fafc 45%, #e0f2fe 100%);
        position: relative;
        overflow-x: hidden;
    }

    .login-body::before {
        content: "";
        position: fixed;
        width: 320px;
        height: 320px;
        border-radius: 50%;
        background: rgba(99, 102, 241, 0.12);
        filter: blur(10px);
        top: -100px;
        left: -100px;
        z-index: 0;
    }

    .login-body::after {
        content: "";
        position: fixed;
        width: 300px;
        height: 300px;
        border-radius: 50%;
        background: rgba(14, 165, 233, 0.13);
        filter: blur(10px);
        bottom: -100px;
        right: -80px;
        z-index: 0;
    }

    /* ---------- REGISTER CARD ---------- */

    .login-card {
        width: 100%;
        max-width: 520px;
        margin: 0 auto;
        padding: 38px 42px;

        position: relative;
        z-index: 2;

        background: rgba(255, 255, 255, 0.78);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);

        border: 1px solid rgba(255, 255, 255, 0.85);
        border-radius: 28px;

        box-shadow:
            0 30px 70px rgba(15, 23, 42, 0.16),
            0 12px 25px rgba(79, 70, 229, 0.10),
            inset 0 1px 0 rgba(255, 255, 255, 0.95),
            inset 0 -1px 0 rgba(148, 163, 184, 0.10);

        transform: translateY(0);
        transition: all 0.35s ease;
    }

    .login-card:hover {
        transform: translateY(-5px);
        box-shadow:
            0 38px 85px rgba(15, 23, 42, 0.20),
            0 15px 35px rgba(79, 70, 229, 0.13),
            inset 0 1px 0 rgba(255, 255, 255, 1);
    }

    /* ---------- LOGO ---------- */

    .login-logo {
        text-align: center;
        font-size: 30px;
        font-weight: 800;
        letter-spacing: -1px;

        color: #312e81;

        text-shadow:
            0 2px 0 #ffffff,
            0 5px 12px rgba(79, 70, 229, 0.20);
    }

    .login-logo i {
        margin-right: 9px;
        font-size: 32px;
        color: #4f46e5;

        filter:
            drop-shadow(0 4px 5px rgba(79, 70, 229, 0.25));
    }

    .login-logo span {
        color: #0ea5e9;
    }

    /* ---------- SUBTITLE ---------- */

    .login-subtitle {
        margin: 8px 0 30px;
        text-align: center;

        color: #64748b;
        font-size: 14px;
        font-weight: 500;
        letter-spacing: 0.2px;
    }

    /* ---------- FORM GROUP ---------- */

    .form-group {
        margin-bottom: 20px;
        position: relative;
    }

    .form-label {
        display: block;
        margin-bottom: 8px;

        color: #334155;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 0.2px;
    }

    /* ---------- INPUTS ---------- */

    .form-control {
        width: 100%;
        height: 50px;

        padding: 0 16px;

        border: 1px solid #dbe3f0;
        border-radius: 14px;

        background: rgba(248, 250, 252, 0.90);

        color: #1e293b;
        font-size: 14px;
        font-family: inherit;

        outline: none;

        box-shadow:
            inset 3px 3px 7px rgba(148, 163, 184, 0.12),
            inset -3px -3px 7px rgba(255, 255, 255, 0.95),
            0 2px 5px rgba(15, 23, 42, 0.04);

        transition: all 0.3s ease;
    }

    .form-control::placeholder {
        color: #94a3b8;
    }

    .form-control:hover {
        border-color: #c7d2fe;

        box-shadow:
            inset 2px 2px 6px rgba(148, 163, 184, 0.10),
            inset -2px -2px 6px rgba(255, 255, 255, 1),
            0 5px 15px rgba(79, 70, 229, 0.06);
    }

    .form-control:focus {
        border-color: #6366f1;
        background: #ffffff;

        transform: translateY(-1px);

        box-shadow:
            0 0 0 4px rgba(99, 102, 241, 0.10),
            0 8px 20px rgba(79, 70, 229, 0.10),
            inset 0 1px 2px rgba(255, 255, 255, 1);
    }

    /* ---------- DROPDOWN ---------- */

    select.form-control {
        cursor: pointer;
        appearance: auto;
    }

    /* ---------- VALIDATION ---------- */

    .form-group span {
        font-size: 12px;
        font-weight: 600;
    }

    /* ---------- REGISTER BUTTON ---------- */

    .login-btn {
        width: 100%;
        height: 52px;

        margin-top: 8px;

        border: none;
        border-radius: 15px;

        background: linear-gradient(
            135deg,
            #4f46e5 0%,
            #6366f1 45%,
            #0ea5e9 100%
        );

        color: #ffffff;

        font-size: 15px;
        font-weight: 700;
        letter-spacing: 0.5px;

        cursor: pointer;

        box-shadow:
            0 10px 20px rgba(79, 70, 229, 0.25),
            0 5px 0 rgba(49, 46, 129, 0.35),
            inset 0 1px 0 rgba(255, 255, 255, 0.35);

        transition: all 0.2s ease;
    }

    .login-btn:hover {
        transform: translateY(-3px);

        background: linear-gradient(
            135deg,
            #4338ca 0%,
            #4f46e5 45%,
            #0284c7 100%
        );

        box-shadow:
            0 15px 28px rgba(79, 70, 229, 0.32),
            0 6px 0 rgba(49, 46, 129, 0.30),
            inset 0 1px 0 rgba(255, 255, 255, 0.40);
    }

    .login-btn:active {
        transform: translateY(2px);

        box-shadow:
            0 5px 12px rgba(79, 70, 229, 0.20),
            0 1px 0 rgba(49, 46, 129, 0.30);
    }

    /* ---------- LOGIN LINK ---------- */

    .login-card a {
        color: #4f46e5;
        font-weight: 700;
        text-decoration: none;
        margin-left: 5px;

        transition: all 0.25s ease;
    }

    .login-card a:hover {
        color: #0284c7;
        text-decoration: underline;
    }

    /* ---------- GRIDVIEW ---------- */

    #GridView1 {
        width: 100%;
        max-width: 1200px;
        margin: 40px auto 0;

        position: relative;
        z-index: 2;

        border-collapse: separate;
        border-spacing: 0;

        overflow: hidden;

        background: rgba(255, 255, 255, 0.88);

        border: 1px solid rgba(255, 255, 255, 0.9);
        border-radius: 18px;

        box-shadow:
            0 20px 45px rgba(15, 23, 42, 0.12),
            0 5px 15px rgba(79, 70, 229, 0.08);
    }

    #GridView1 th {
        padding: 15px 12px;

        background: linear-gradient(
            135deg,
            #312e81,
            #4f46e5,
            #0284c7
        );

        color: white;

        font-size: 13px;
        font-weight: 700;
        text-align: center;

        border: none;
    }

    #GridView1 td {
        padding: 13px 12px;

        background: rgba(255, 255, 255, 0.88);

        color: #334155;

        font-size: 13px;
        text-align: center;

        border-bottom: 1px solid #e2e8f0;
    }

    #GridView1 tr {
        transition: all 0.25s ease;
    }

    #GridView1 tr:hover td {
        background: #eef2ff;
        transform: scale(1.002);
    }

    #GridView1 td a {
        display: inline-block;

        padding: 6px 12px;

        margin: 2px;

        border-radius: 8px;

        font-size: 12px;
        font-weight: 700;

        text-decoration: none;
    }

    /* Edit */

    #GridView1 td a:first-child {
        background: #eef2ff;
        color: #4f46e5;

        box-shadow:
            0 3px 8px rgba(79, 70, 229, 0.12);
    }

    #GridView1 td a:first-child:hover {
        background: #4f46e5;
        color: white;
        transform: translateY(-2px);
    }

    /* Delete */

    #GridView1 td a:last-child {
        background: #fff1f2;
        color: #e11d48;

        box-shadow:
            0 3px 8px rgba(225, 29, 72, 0.10);
    }

    #GridView1 td a:last-child:hover {
        background: #e11d48;
        color: white;
        transform: translateY(-2px);
    }

    /* ---------- RESPONSIVE ---------- */

    @media (max-width: 600px) {

        .login-body {
            padding: 25px 12px;
        }

        .login-card {
            padding: 30px 22px;
            border-radius: 22px;
        }

        .login-logo {
            font-size: 25px;
        }

        .login-logo i {
            font-size: 27px;
        }

        .login-subtitle {
            margin-bottom: 25px;
        }

        .form-control {
            height: 48px;
        }

        .login-btn {
            height: 50px;
        }

        #GridView1 {
            display: block;
            overflow-x: auto;
            white-space: nowrap;
            border-radius: 14px;
        }
    }
</style>


<%--    <link href="~/css/style.css" rel="stylesheet" type="text/css" />--%>
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
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_edt"  CausesValidation="false">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_del"  CausesValidation="false">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
    </form>

</body>
</html>
