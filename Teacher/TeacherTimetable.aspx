<%@ Page Title="Teacher Timetable" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeacherTimetable.aspx.cs" Inherits="SchoolManagement.TeacherTimetable" %>

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

        /* Hero banner */
        .tt-hero {
            background: linear-gradient(135deg, #0f766e 0%, #0d9488 45%, #14b8a6 100%);
            border-radius: 24px;
            padding: 30px 35px;
            color: #ffffff;
            margin-bottom: 25px;
            box-shadow: 0 20px 45px rgba(13, 148, 136, 0.25);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .tt-hero h1 {
            font-size: 26px;
            font-weight: 800;
            margin: 0 0 8px 0;
        }
        .tt-hero p {
            margin: 0;
            color: rgba(255, 255, 255, 0.90);
            font-size: 14px;
        }

        /* Stats */
        .tt-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }
        @media (max-width: 768px) {
            .tt-stats { grid-template-columns: 1fr; }
        }
        .tt-stat-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 18px;
            padding: 20px 24px;
            box-shadow: var(--shadow-sm);
        }
        .tt-stat-card h4 {
            font-size: 12.5px;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: .5px;
            margin: 0 0 6px 0;
        }
        .tt-stat-card p {
            font-size: 26px;
            font-weight: 700;
            color: var(--text-main);
            margin: 0;
        }

        /* Filter Section */
        .card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            box-shadow: var(--shadow-sm);
            margin-bottom: 25px;
            overflow: hidden;
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

        .filter-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr)) auto;
            gap: 16px;
            align-items: flex-end;
        }
        @media (max-width: 900px) {
            .filter-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 576px) {
            .filter-grid { grid-template-columns: 1fr; }
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-label {
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 6px;
            color: var(--text-main);
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

        /* Table */
        .table-container {
            overflow-x: auto;
        }
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }
        .grid-view th {
            background: #f8fafc;
            padding: 14px 16px;
            text-align: left;
            font-weight: 600;
            color: var(--text-muted);
            border-bottom: 1px solid var(--border-color);
        }
        .grid-view td {
            padding: 14px 16px;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-main);
        }

        .day-badge {
            background: rgba(79, 70, 229, 0.10);
            color: var(--primary-color);
            padding: 4px 10px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 12px;
            display: inline-block;
        }
        .room-badge {
            background: #f1f5f9;
            color: var(--text-muted);
            padding: 4px 8px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
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
        <a href="TeacherDetails.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-id-card"></i> Teacher Details
        </a>
        <a href="TeacherAttendance.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-calendar-check"></i> Attendance
        </a>
        <a href="TeacherTimetable.aspx" class="teacher-nav-item active">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
        <a href="TeacherProfile.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-user-circle"></i> Profile
        </a>
    </div>

    <!-- Hero Header -->
    <div class="tt-hero">
        <div>
            <h1><i class="fa-solid fa-calendar-days" style="margin-right: 10px;"></i> Teacher Timetable & Class Routine</h1>
            <p>View upcoming lecture schedules, assigned subjects, and room allocations across school classes.</p>
        </div>
        <div style="font-size: 42px; opacity: 0.75;">
            <i class="fa-solid fa-clock"></i>
        </div>
    </div>

    <!-- Stats Row -->
    <div class="tt-stats">
        <div class="tt-stat-card">
            <h4><i class="fa-solid fa-school" style="color: #0284c7; margin-right: 6px;"></i> Total Classes</h4>
            <p><asp:Label ID="lblTotalClasses" runat="server" Text="0"></asp:Label></p>
        </div>
        <div class="tt-stat-card">
            <h4><i class="fa-solid fa-chalkboard-user" style="color: #4f46e5; margin-right: 6px;"></i> Active Faculty</h4>
            <p><asp:Label ID="lblTotalTeachers" runat="server" Text="0"></asp:Label></p>
        </div>
        <div class="tt-stat-card">
            <h4><i class="fa-solid fa-calendar-week" style="color: #10b981; margin-right: 6px;"></i> Scheduled Days</h4>
            <p><asp:Label ID="lblTeachingDays" runat="server" Text="Mon - Sat"></asp:Label></p>
        </div>
    </div>

    <!-- Search Routine -->
    <div class="card">
        <div class="card-body" style="padding: 16px 24px;">
            <div style="display: flex; gap: 12px; align-items: center; flex-wrap: wrap;">
                <label style="font-weight: 600; font-size: 14px;"><i class="fa-solid fa-magnifying-glass" style="color: var(--primary-color); margin-right: 6px;"></i> Search Schedule:</label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by Subject, Day or Room..." style="max-width: 320px;"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary" OnClick="btnReset_Click" />
            </div>
        </div>
    </div>

    <!-- Timetable Grid Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-table-list" style="color: var(--primary-color); margin-right: 8px;"></i> Scheduled Lecture List</span>
            <asp:Label ID="lblScheduleCount" runat="server" CssClass="badge" Style="background: rgba(79,70,229,0.12); color: var(--primary-color); font-weight: 600; padding: 4px 10px; border-radius: 8px;"></asp:Label>
        </div>
        <div class="card-body" style="padding: 0;">
            <div class="table-container">
                <asp:GridView ID="gvTimetable" runat="server" AutoGenerateColumns="False" CssClass="grid-view" EmptyDataText="No scheduled lectures match the selected filter.">
                    <Columns>
                        <asp:TemplateField HeaderText="Day" HeaderStyle-Width="120px">
                            <ItemTemplate>
                                <span class="day-badge"><%# Eval("Day") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Lecture" HeaderText="Lecture #" HeaderStyle-Width="100px" />
                        <asp:BoundField DataField="TimeSlot" HeaderText="Time Period" HeaderStyle-Width="180px" />
                        <asp:BoundField DataField="ClassName" HeaderText="Class" HeaderStyle-Width="130px" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject / Topic" />
                        <asp:BoundField DataField="TeacherName" HeaderText="Assigned Teacher" />
                        <asp:TemplateField HeaderText="Room" HeaderStyle-Width="110px">
                            <ItemTemplate>
                                <span class="room-badge"><i class="fa-solid fa-door-open"></i> <%# Eval("RoomNumber") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
