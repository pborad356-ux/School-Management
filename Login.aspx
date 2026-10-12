<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolManagement.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - School Management System</title>
    
    <!-- Google Fonts & FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
<style>

    /* =========================================
       SCHOOL MANAGEMENT - LOGIN 6D UI
       ========================================= */

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 0;
        font-family: "Segoe UI", Arial, sans-serif;
    }

    /* ---------- MAIN BACKGROUND ---------- */

    .login-body {
        min-height: 100vh;

        display: flex;
        align-items: center;
        justify-content: center;

        padding: 30px 20px;

        position: relative;
        overflow: hidden;

        background:
            radial-gradient(
                circle at 15% 20%,
                rgba(99, 102, 241, 0.25),
                transparent 30%
            ),
            radial-gradient(
                circle at 85% 80%,
                rgba(14, 165, 233, 0.24),
                transparent 30%
            ),
            linear-gradient(
                135deg,
                #eef2ff 0%,
                #f8fafc 45%,
                #e0f2fe 100%
            );
    }


    /* ---------- DECORATIVE 6D CIRCLES ---------- */

    .login-body::before {
        content: "";

        position: absolute;

        width: 350px;
        height: 350px;

        top: -150px;
        left: -130px;

        border-radius: 50%;

        background: rgba(99, 102, 241, 0.12);

        box-shadow:
            0 0 80px rgba(99, 102, 241, 0.15);

        filter: blur(2px);
    }

    .login-body::after {
        content: "";

        position: absolute;

        width: 320px;
        height: 320px;

        bottom: -150px;
        right: -120px;

        border-radius: 50%;

        background: rgba(14, 165, 233, 0.12);

        box-shadow:
            0 0 80px rgba(14, 165, 233, 0.15);

        filter: blur(2px);
    }


    /* ---------- LOGIN CARD ---------- */

    .login-card {
        width: 100%;
        max-width: 450px;

        position: relative;
        z-index: 5;

        padding: 42px 42px 38px;

        background: rgba(255, 255, 255, 0.78);

        backdrop-filter: blur(22px);
        -webkit-backdrop-filter: blur(22px);

        border: 1px solid rgba(255, 255, 255, 0.9);

        border-radius: 28px;

        box-shadow:
            0 35px 80px rgba(15, 23, 42, 0.18),
            0 15px 30px rgba(79, 70, 229, 0.10),
            inset 0 1px 0 rgba(255, 255, 255, 0.95),
            inset 0 -1px 0 rgba(148, 163, 184, 0.10);

        transition: all 0.35s ease;
    }


    /* ---------- CARD HOVER 6D EFFECT ---------- */

    .login-card:hover {
        transform: translateY(-6px);

        box-shadow:
            0 45px 90px rgba(15, 23, 42, 0.22),
            0 18px 40px rgba(79, 70, 229, 0.14),
            inset 0 1px 0 rgba(255, 255, 255, 1);
    }


    /* ---------- LOGO ---------- */

    .login-logo {
        text-align: center;

        font-size: 32px;

        font-weight: 800;

        letter-spacing: -1px;

        color: #312e81;

        text-shadow:
            0 2px 0 #ffffff,
            0 5px 12px rgba(79, 70, 229, 0.20);
    }


    .login-logo i {
        margin-right: 8px;

        font-size: 34px;

        color: #4f46e5;

        filter:
            drop-shadow(
                0 5px 6px rgba(79, 70, 229, 0.28)
            );
    }


    .login-logo span {
        color: #0ea5e9;
    }


    /* ---------- SUBTITLE ---------- */

    .login-subtitle {
        margin: 9px 0 32px;

        text-align: center;

        color: #64748b;

        font-size: 14px;

        font-weight: 500;

        letter-spacing: 0.2px;
    }


    /* ---------- FORM GROUP ---------- */

    .form-group {
        margin-bottom: 21px;

        position: relative;
    }


    /* ---------- LABEL ---------- */

    .form-label {
        display: block;

        margin-bottom: 8px;

        color: #334155;

        font-size: 14px;

        font-weight: 700;

        letter-spacing: 0.2px;
    }


    /* ---------- TEXTBOX ---------- */

    .form-control {
        width: 100%;

        height: 52px;

        padding: 0 17px;

        border: 1px solid #dbe3f0;

        border-radius: 14px;

        background: rgba(248, 250, 252, 0.92);

        color: #1e293b;

        font-family: "Segoe UI", Arial, sans-serif;

        font-size: 14px;

        outline: none;

        box-shadow:
            inset 3px 3px 7px rgba(148, 163, 184, 0.12),
            inset -3px -3px 7px rgba(255, 255, 255, 0.95),
            0 2px 6px rgba(15, 23, 42, 0.04);

        transition: all 0.3s ease;
    }


    .form-control::placeholder {
        color: #94a3b8;
    }


    /* ---------- INPUT HOVER ---------- */

    .form-control:hover {
        border-color: #c7d2fe;

        box-shadow:
            inset 2px 2px 6px rgba(148, 163, 184, 0.10),
            inset -2px -2px 6px rgba(255, 255, 255, 1),
            0 6px 16px rgba(79, 70, 229, 0.07);
    }


    /* ---------- INPUT FOCUS ---------- */

    .form-control:focus {
        border-color: #6366f1;

        background: #ffffff;

        transform: translateY(-1px);

        box-shadow:
            0 0 0 4px rgba(99, 102, 241, 0.10),
            0 9px 22px rgba(79, 70, 229, 0.11),
            inset 0 1px 2px rgba(255, 255, 255, 1);
    }


    /* ---------- LOGIN BUTTON ---------- */

    .login-btn {
        width: 100%;

        height: 53px;

        margin-top: 7px;

        border: none;

        border-radius: 15px;

        background:
            linear-gradient(
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
            0 11px 22px rgba(79, 70, 229, 0.27),
            0 5px 0 rgba(49, 46, 129, 0.35),
            inset 0 1px 0 rgba(255, 255, 255, 0.35);

        transition: all 0.2s ease;
    }


    /* ---------- BUTTON HOVER ---------- */

    .login-btn:hover {
        transform: translateY(-3px);

        background:
            linear-gradient(
                135deg,
                #4338ca 0%,
                #4f46e5 45%,
                #0284c7 100%
            );

        box-shadow:
            0 16px 30px rgba(79, 70, 229, 0.34),
            0 6px 0 rgba(49, 46, 129, 0.30),
            inset 0 1px 0 rgba(255, 255, 255, 0.40);
    }


    /* ---------- BUTTON CLICK ---------- */

    .login-btn:active {
        transform: translateY(2px);

        box-shadow:
            0 5px 12px rgba(79, 70, 229, 0.20),
            0 1px 0 rgba(49, 46, 129, 0.30);
    }


    /* ---------- ERROR MESSAGE ---------- */

    .login-error {
        display: block;

        margin-top: 15px;
        padding: 10px 12px;

        border-radius: 10px;

        background: #fff1f2;

        border: 1px solid #fecdd3;

        color: #e11d48;

        font-size: 13px;

        font-weight: 600;

        text-align: center;

        box-shadow:
            0 4px 12px rgba(225, 29, 72, 0.08);
    }


    /* ---------- REGISTER LINK ---------- */

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


    /* ---------- RESPONSIVE ---------- */

    @media (max-width: 600px) {

        .login-body {
            padding: 20px 14px;
        }

        .login-card {
            max-width: 100%;

            padding: 32px 23px;

            border-radius: 23px;
        }

        .login-logo {
            font-size: 27px;
        }

        .login-logo i {
            font-size: 29px;
        }

        .login-subtitle {
            margin-bottom: 27px;
        }

        .form-control {
            height: 49px;
        }

        .login-btn {
            height: 50px;
        }
    }

</style>


<%--    <link href="~/css/style.css" rel="stylesheet" type="text/css" />--%>
</head>
<body class="login-body">
    <form id="form1" runat="server">
        <div class="login-card">
            <div class="login-logo">
                <i class="fa-solid fa-graduation-cap"></i> School<span>Management</span>
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
