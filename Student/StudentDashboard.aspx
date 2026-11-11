<%@ Page Title="Student Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="SchoolManagement.StudentDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Student Navigation Bar */
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

        /* Welcome Banner */
        .welcome-banner {
            background: linear-gradient(135deg, #0284c7 0%, #0ea5e9 60%, #38bdf8 100%);
            color: #ffffff;
            padding: 28px 32px;
            border-radius: 20px;
            margin-bottom: 25px;
            box-shadow: 0 10px 25px rgba(14, 165, 233, 0.25);
        }
        .welcome-banner h1 {
            font-size: 24px;
            font-weight: 800;
            margin: 0 0 8px 0;
        }
        .welcome-banner p {
            font-size: 14px;
            margin: 0;
            opacity: 0.92;
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 18px;
            margin-bottom: 25px;
        }
        @media (max-width: 900px) {
            .stats-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 500px) {
            .stats-grid { grid-template-columns: 1fr; }
        }

        .stat-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 16px;
            box-shadow: var(--shadow-sm);
        }
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }
        .stat-info h3 {
            font-size: 13px;
            font-weight: 600;
            color: var(--text-muted);
            margin: 0 0 4px 0;
        }
        .stat-info p {
            font-size: 20px;
            font-weight: 800;
            color: var(--text-main);
            margin: 0;
        }

        /* Content Grid */
        .content-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }
        @media (max-width: 900px) {
            .content-grid { grid-template-columns: 1fr; }
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

        .table-responsive {
            overflow-x: auto;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            font-size: 13.5px;
        }
        .grid-view th {
            background: #f8fafc;
            padding: 12px 14px;
            text-align: left;
            font-weight: 600;
            color: var(--text-muted);
            border-bottom: 1px solid var(--border-color);
        }
        .grid-view td {
            padding: 12px 14px;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-main);
        }
        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
        }
        .badge-success { background: #dcfce7; color: #15803d; }
        .badge-info { background: #e0f2fe; color: #0284c7; }
        .badge-warning { background: #fef3c7; color: #b45309; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Student Panel Navigation Sub-bar -->
    <div class="student-nav">
        <a href="StudentDashboard.aspx" class="student-nav-item active">
            <i class="fa-solid fa-chart-pie"></i> Dashboard
        </a>
        <a href="StudentProfile.aspx" class="student-nav-item">
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

    <!-- Welcome Banner -->
    <div class="welcome-banner">
        <h1>Welcome to Student Portal, <asp:Label ID="lblStudentGreeting" runat="server" Text="Student"></asp:Label>!</h1>
        <p>Monitor your academic performance, attendance percentage, class schedule, and fee payments in real-time.</p>
    </div>

    <!-- Quick Stats Grid -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(14, 165, 233, 0.12); color: #0284c7;">
                <i class="fa-solid fa-school"></i>
            </div>
            <div class="stat-info">
                <h3>Current Class</h3>
                <p><asp:Label ID="lblStudentClass" runat="server" Text="Class 10"></asp:Label></p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(16, 185, 129, 0.12); color: #10b981;">
                <i class="fa-solid fa-calendar-check"></i>
            </div>
            <div class="stat-info">
                <h3>Attendance</h3>
                <p><asp:Label ID="lblAttendancePercent" runat="server" Text="94.5%"></asp:Label></p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(139, 92, 246, 0.12); color: #8b5cf6;">
                <i class="fa-solid fa-award"></i>
            </div>
            <div class="stat-info">
                <h3>Latest Grade</h3>
                <p><asp:Label ID="lblLatestGrade" runat="server" Text="A+ (89%)"></asp:Label></p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(245, 158, 11, 0.12); color: #d97706;">
                <i class="fa-solid fa-receipt"></i>
            </div>
            <div class="stat-info">
                <h3>Fee Status</h3>
                <p><asp:Label ID="lblFeeStatus" runat="server" Text="Paid"></asp:Label></p>
            </div>
        </div>
    </div>

    <!-- Content Columns -->
    <div class="content-grid">
        <!-- Today's Class Schedule -->
        <div class="card">
            <div class="card-header">
                <span><i class="fa-solid fa-clock" style="color: #0284c7; margin-right: 8px;"></i> Today's Schedule</span>
                <a href="StudentTimetable.aspx" style="font-size: 13px; color: #0284c7; text-decoration: none; font-weight: 600;">Full Week &rarr;</a>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvTodaySchedule" runat="server" AutoGenerateColumns="False" CssClass="grid-view" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Timing" HeaderText="Time" />
                            <asp:BoundField DataField="Subject" HeaderText="Subject" />
                            <asp:BoundField DataField="Teacher" HeaderText="Teacher" />
                            <asp:BoundField DataField="Room" HeaderText="Room" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Recent Results -->
        <div class="card">
            <div class="card-header">
                <span><i class="fa-solid fa-graduation-cap" style="color: #10b981; margin-right: 8px;"></i> Recent Exam Scores</span>
                <a href="StudentResults.aspx" style="font-size: 13px; color: #10b981; text-decoration: none; font-weight: 600;">All Marks &rarr;</a>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:GridView ID="gvRecentResults" runat="server" AutoGenerateColumns="False" CssClass="grid-view" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Subject" HeaderText="Subject" />
                            <asp:BoundField DataField="MaxMarks" HeaderText="Max" />
                            <asp:BoundField DataField="ObtainedMarks" HeaderText="Marks" />
                            <asp:TemplateField HeaderText="Grade">
                                <ItemTemplate>
                                    <span class="badge badge-success"><%# Eval("Grade") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
