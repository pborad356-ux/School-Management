<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolManagement.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - School Management System</title>
    
    <!-- Google Fonts & FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link href="~/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="login-body">
    <form id="form1" runat="server">
        <div class="login-card">
            <div class="login-logo">
                <i class="fa-solid fa-graduation-cap"></i> School<span>Man</span>
            </div>
            <p class="login-subtitle">Sign in to manage your school database</p>
            
            <div class="form-group">
                <label for="txtUsername" class="form-label">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username" Required="true"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label for="txtPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" Required="true" OnTextChanged="txtPassword_TextChanged"></asp:TextBox>
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="login-btn" OnClick="btnLogin_Click" />
            
            <asp:Label ID="lblError" runat="server" CssClass="login-error" Visible="false"></asp:Label>
            <div style="text-align:center; margin-top:20px;">
    <span>Don't have an account?</span>
    <a href="Register.aspx">Register Now</a>
</div>
        </div>
    </form>
</body>
</html>
