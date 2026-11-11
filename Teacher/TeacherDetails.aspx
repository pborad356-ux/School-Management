<%@ Page Title="Teacher Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeacherDetails.aspx.cs" Inherits="SchoolManagement.TeacherDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Teacher Navigation Bar */
        .teacher-nav {
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
        .teacher-nav-item {
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
        .teacher-nav-item:hover {
            color: var(--primary-color);
            background: rgba(79, 70, 229, 0.08);
        }
        .teacher-nav-item.active {
            color: #ffffff;
            background: linear-gradient(135deg, #4f46e5 0%, #6366f1 100%);
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.25);
        }

        /* Profile Hero Card */
        .profile-hero {
            background: linear-gradient(135deg, #4338ca 0%, #6366f1 60%, #0284c7 100%);
            border-radius: 24px;
            padding: 32px 35px;
            color: #ffffff;
            margin-bottom: 28px;
            display: flex;
            align-items: center;
            gap: 24px;
            box-shadow: 0 20px 45px rgba(79, 70, 229, 0.25);
        }
        @media (max-width: 768px) {
            .profile-hero { flex-direction: column; text-align: center; }
        }
        .profile-avatar-box {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.20);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            color: #ffffff;
            border: 3px solid rgba(255, 255, 255, 0.40);
            flex-shrink: 0;
        }
        .profile-hero-content h1 {
            font-size: 26px;
            font-weight: 800;
            margin: 0 0 8px 0;
        }
        .profile-hero-content p {
            margin: 0 0 12px 0;
            color: rgba(255, 255, 255, 0.90);
            font-size: 14px;
        }
        .hero-tags {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        .hero-tag {
            background: rgba(255, 255, 255, 0.20);
            padding: 5px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            backdrop-filter: blur(4px);
        }

        /* Info Grid */
        .detail-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            box-shadow: var(--shadow-sm);
            margin-bottom: 25px;
            overflow: hidden;
        }
        .detail-card-header {
            padding: 18px 24px;
            border-bottom: 1px solid var(--border-color);
            font-weight: 700;
            font-size: 16px;
            color: var(--text-main);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .detail-card-body {
            padding: 24px;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }
        @media (max-width: 640px) {
            .info-grid { grid-template-columns: 1fr; }
        }
        .info-item {
            background: #f8fafc;
            border: 1px solid var(--border-color);
            border-radius: 14px;
            padding: 16px 20px;
        }
        .info-label {
            font-size: 12px;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: .5px;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .info-value {
            font-size: 16px;
            font-weight: 700;
            color: var(--text-main);
            word-break: break-word;
        }

        /* Search Section */
        .selector-box {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 22px 26px;
            margin-bottom: 25px;
            display: flex;
            flex-wrap: wrap;
            align-items: flex-end;
            gap: 16px;
            box-shadow: var(--shadow-sm);
        }
        .selector-group {
            flex: 1;
            min-width: 220px;
        }
        .selector-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: var(--text-main);
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
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.15);
        }

        /* Buttons */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            border: none;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        .btn-primary {
            background: var(--primary-color);
            color: #ffffff;
        }
        .btn-primary:hover {
            background: var(--primary-hover);
        }
        .btn-secondary {
            background: #f1f5f9;
            color: var(--text-main);
            border: 1px solid var(--border-color);
        }
        .btn-secondary:hover {
            background: #e2e8f0;
        }
        .btn-group {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 24px;
        }

        .badge-success {
            background: #dcfce7;
            color: #15803d;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
        }

        .empty-alert {
            padding: 30px;
            text-align: center;
            color: var(--text-muted);
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Teacher Panel Navigation Sub-bar -->
    <div class="teacher-nav">
        <a href="TeacherDashboard.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-chart-pie"></i> Dashboard
        </a>
        <a href="Teachers.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-chalkboard-teacher"></i> Teachers
        </a>
        <a href="TeacherDetails.aspx" class="teacher-nav-item active">
            <i class="fa-solid fa-id-card"></i> Teacher Details
        </a>
        <a href="TeacherAttendance.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-calendar-check"></i> Attendance
        </a>
        <a href="TeacherTimetable.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
        <a href="TeacherProfile.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-user-circle"></i> Profile
        </a>
    </div>

    <!-- Search Teacher Section -->
    <div class="selector-box">
        <div class="selector-group" style="flex: 1;">
            <label><i class="fa-solid fa-magnifying-glass"></i> Search Teacher By Name or ID</label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Enter Teacher Name or ID..."></asp:TextBox>
        </div>
        <div style="display: flex; gap: 8px;">
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" CausesValidation="false" />
            <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="btn btn-secondary" OnClick="btnShowAll_Click" CausesValidation="false" />
        </div>
    </div>

    <!-- Teacher Detail Profile Container -->
    <asp:Panel ID="pnlTeacherInfo" runat="server">
        <!-- Hero Banner for Selected Teacher -->
        <div class="profile-hero">
            <div class="profile-avatar-box">
                <i class="fa-solid fa-chalkboard-user"></i>
            </div>
            <div class="profile-hero-content">
                <h1><asp:Label ID="lblHeroName" runat="server" Text="Teacher Name"></asp:Label></h1>
                <p><i class="fa-solid fa-envelope"></i> <asp:Label ID="lblHeroEmail" runat="server" Text="email@example.com"></asp:Label> &nbsp;|&nbsp; <i class="fa-solid fa-phone"></i> <asp:Label ID="lblHeroMobile" runat="server" Text="9876543210"></asp:Label></p>
                <div class="hero-tags">
                    <span class="hero-tag"><i class="fa-solid fa-id-badge"></i> Faculty ID: #<asp:Label ID="lblHeroId" runat="server" Text="1"></asp:Label></span>
                    <span class="hero-tag"><i class="fa-solid fa-book-bookmark"></i> Subject: <asp:Label ID="lblHeroSpecialization" runat="server" Text="Specialization"></asp:Label></span>
                    <span class="hero-tag"><i class="fa-solid fa-circle-check"></i> Verified Faculty</span>
                </div>
            </div>
        </div>

        <!-- Detailed Field Cards -->
        <div class="detail-card">
            <div class="detail-card-header">
                <span><i class="fa-solid fa-address-card" style="color: var(--primary-color); margin-right: 8px;"></i> Comprehensive Teacher Information</span>
                <span class="badge-success"><i class="fa-solid fa-check"></i> Active</span>
            </div>
            <div class="detail-card-body">
                <div class="info-grid">
                    <div class="info-item">
                        <div class="info-label"><i class="fa-solid fa-hashtag"></i> Teacher Database ID</div>
                        <div class="info-value"><asp:Label ID="lblDetailId" runat="server"></asp:Label></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label"><i class="fa-solid fa-user"></i> Full Name</div>
                        <div class="info-value"><asp:Label ID="lblDetailFullName" runat="server"></asp:Label></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label"><i class="fa-solid fa-envelope"></i> Email Address</div>
                        <div class="info-value"><asp:Label ID="lblDetailEmail" runat="server"></asp:Label></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label"><i class="fa-solid fa-phone"></i> Mobile Contact Number</div>
                        <div class="info-value"><asp:Label ID="lblDetailMobile" runat="server"></asp:Label></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label"><i class="fa-solid fa-graduation-cap"></i> Subject / Teaching Specialization</div>
                        <div class="info-value"><asp:Label ID="lblDetailSpecialization" runat="server"></asp:Label></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label"><i class="fa-solid fa-shield-halved"></i> Faculty Status</div>
                        <div class="info-value">Permanent Academic Staff</div>
                    </div>
                </div>

                <div class="btn-group">
                    <a href="Teachers.aspx" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit in Teachers Registry</a>
                    <a href="TeacherTimetable.aspx" class="btn btn-secondary"><i class="fa-solid fa-calendar-days"></i> View Timetable Schedule</a>
                    <a href="TeacherAttendance.aspx" class="btn btn-secondary"><i class="fa-solid fa-calendar-check"></i> Manage Attendance</a>
                </div>
            </div>
        </div>
    </asp:Panel>

    <!-- Empty State Panel -->
    <asp:Panel ID="pnlNoTeacher" runat="server" Visible="false" CssClass="empty-alert">
        <i class="fa-solid fa-triangle-exclamation" style="font-size: 36px; color: #f59e0b; margin-bottom: 12px; display: block;"></i>
        <h3 style="margin-bottom: 8px;">No Teacher Record Found</h3>
        <p style="margin-bottom: 16px;">The requested teacher record could not be found or no teachers exist in the database.</p>
        <a href="Teachers.aspx" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Add New Teacher</a>
    </asp:Panel>
</asp:Content>
