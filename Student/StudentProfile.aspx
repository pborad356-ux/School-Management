<%@ Page Title="Student Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentProfile.aspx.cs" Inherits="SchoolManagement.StudentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .student-nav {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 25px;
            padding: 12px 18px;
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
        }
        .student-nav-item {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            border-radius: 10px;
            font-size: 13.5px;
            font-weight: 600;
            color: var(--text-muted);
            text-decoration: none;
            transition: all 0.2s ease;
        }
        .student-nav-item:hover {
            color: #0284c7;
            background: rgba(14, 165, 233, 0.08);
        }
        .student-nav-item.active {
            color: #ffffff;
            background: linear-gradient(135deg, #0284c7 0%, #0ea5e9 100%);
            box-shadow: 0 4px 12px rgba(14, 165, 233, 0.25);
        }

        .alert-box {
            padding: 14px 18px;
            margin-bottom: 22px;
            border-radius: 14px;
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .alert-success { background: #f0fdf4; color: #15803d; border: 1px solid #bbf7d0; }

        .profile-container {
            display: grid;
            grid-template-columns: 320px 1fr;
            gap: 25px;
        }
        @media (max-width: 850px) {
            .profile-container { grid-template-columns: 1fr; }
        }

        .card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            margin-bottom: 25px;
        }
        .card-header {
            padding: 18px 24px;
            border-bottom: 1px solid var(--border-color);
            font-weight: 700;
            font-size: 16px;
            color: var(--text-main);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .card-body {
            padding: 24px;
        }

        .avatar-box {
            text-align: center;
            padding: 20px 0;
        }
        .avatar-circle {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0284c7 0%, #0ea5e9 100%);
            color: #ffffff;
            font-size: 40px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            box-shadow: 0 8px 20px rgba(14, 165, 233, 0.3);
        }
        .avatar-name {
            font-size: 18px;
            font-weight: 700;
            color: var(--text-main);
            margin: 0 0 4px 0;
        }
        .avatar-role {
            font-size: 13px;
            color: var(--text-muted);
            font-weight: 600;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }
        @media (max-width: 600px) {
            .form-grid { grid-template-columns: 1fr; }
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-label {
            font-size: 13px;
            font-weight: 600;
            color: var(--text-muted);
            margin-bottom: 6px;
        }
        .form-control {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid var(--border-color);
            border-radius: 10px;
            font-family: inherit;
            font-size: 14px;
            outline: none;
            transition: all 0.2s ease;
        }
        .form-control:focus {
            border-color: #0284c7;
            box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.15);
        }
        .form-control:read-only {
            background: #f8fafc;
            color: #64748b;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 22px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: all 0.2s ease;
        }
        .btn-primary { background: #0284c7; color: #ffffff; }
        .btn-primary:hover { background: #0369a1; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Student Panel Navigation Sub-bar -->
    <div class="student-nav">
        <a href="StudentDashboard.aspx" class="student-nav-item">
            <i class="fa-solid fa-chart-pie"></i> Dashboard
        </a>
        <a href="StudentProfile.aspx" class="student-nav-item active">
            <i class="fa-solid fa-user-graduate"></i> My Profile
        </a>
        <a href="StudentAttendance.aspx" class="student-nav-item">
            <i class="fa-solid fa-calendar-check"></i> Attendance
        </a>
        <a href="StudentResults.aspx" class="student-nav-item">
            <i class="fa-solid fa-chart-column"></i> Results & Marks
        </a>
        <a href="StudentFees.aspx" class="student-nav-item">
            <i class="fa-solid fa-wallet"></i> Fee Status
        </a>
        <a href="StudentTimetable.aspx" class="student-nav-item">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
    </div>

    <!-- Alert Message Banner -->
    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert-box alert-success" Visible="false">
        <i class="fa-solid fa-circle-check" style="font-size: 18px;"></i>
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
    </asp:Panel>

    <div class="profile-container">
        <!-- Left Info Card -->
        <div class="card">
            <div class="card-body">
                <div class="avatar-box">
                    <div class="avatar-circle">
                        <i class="fa-solid fa-user-graduate"></i>
                    </div>
                    <h2 class="avatar-name"><asp:Label ID="lblAvatarName" runat="server" Text="Aarav Patel"></asp:Label></h2>
                    <span class="avatar-role">Student &bull; <asp:Label ID="lblAvatarClass" runat="server" Text="Class 10"></asp:Label></span>
                </div>
                <hr style="border: 0; border-top: 1px solid var(--border-color); margin: 20px 0;" />
                <div style="font-size: 13.5px; color: var(--text-muted); line-height: 1.8;">
                    <p style="margin: 0;"><strong style="color: var(--text-main);">Roll No:</strong> <asp:Label ID="lblSideRoll" runat="server" Text="R-101"></asp:Label></p>
                    <p style="margin: 0;"><strong style="color: var(--text-main);">Academic Year:</strong> 2026-2027</p>
                    <p style="margin: 0;"><strong style="color: var(--text-main);">Status:</strong> <span style="color: #10b981; font-weight: 700;">Enrolled & Active</span></p>
                </div>
            </div>
        </div>

        <!-- Right Edit Form Card -->
        <div class="card">
            <div class="card-header">
                <span><i class="fa-solid fa-id-card" style="color: #0284c7; margin-right: 8px;"></i> Student Personal Details</span>
            </div>
            <div class="card-body">
                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label">Roll Number</label>
                        <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Class</label>
                        <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Student Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Gender</label>
                        <asp:TextBox ID="txtGender" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Date of Birth</label>
                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Contact Email *</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div style="margin-top: 25px;">
                    <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile Info" CssClass="btn btn-primary" OnClick="btnUpdateProfile_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
