<%@ Page Title="Teacher Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="SchoolManagement.TeacherDashboard" %>

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

        /* Welcome Banner */
        .welcome-banner {
            position: relative;
            margin-bottom: 28px;
            padding: 32px 35px;
            overflow: hidden;
            border-radius: 24px;
            color: #ffffff;
            background: linear-gradient(135deg, #0284c7 0%, #0ea5e9 48%, #4f46e5 100%);
            box-shadow: 0 20px 45px rgba(14, 165, 233, 0.25), 0 8px 18px rgba(15, 23, 42, 0.08), inset 0 1px 0 rgba(255, 255, 255, 0.25);
            transition: transform .3s ease, box-shadow .3s ease;
        }
        .welcome-banner:hover {
            transform: translateY(-4px);
            box-shadow: 0 28px 55px rgba(14, 165, 233, 0.30), 0 10px 22px rgba(15, 23, 42, 0.10);
        }
        .welcome-banner h1 {
            margin: 0 0 10px;
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -.5px;
        }
        .welcome-banner p {
            max-width: 850px;
            margin: 0;
            color: rgba(255, 255, 255, 0.90);
            font-size: 14px;
            line-height: 1.7;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 28px;
        }
        @media (max-width: 992px) {
            .stats-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
        }
        @media (max-width: 576px) {
            .stats-grid { grid-template-columns: 1fr; }
        }

        .stat-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: var(--shadow-sm);
            transition: all .25s ease;
        }
        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-md);
        }
        .stat-info h3 {
            font-size: 13px;
            color: var(--text-muted);
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: .5px;
            font-weight: 600;
        }
        .stat-info p {
            font-size: 28px;
            font-weight: 700;
            color: var(--text-main);
            margin: 0;
        }
        .stat-icon {
            width: 56px;
            height: 56px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }
        .icon-blue { background: rgba(14, 165, 233, 0.12); color: #0284c7; }
        .icon-purple { background: rgba(99, 102, 241, 0.12); color: #4f46e5; }
        .icon-green { background: rgba(16, 185, 129, 0.12); color: #059669; }
        .icon-orange { background: rgba(245, 158, 11, 0.12); color: #d97706; }

        /* Quick Actions Grid */
        .actions-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
        }
        .action-card {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 18px 20px;
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            text-decoration: none;
            color: var(--text-main);
            font-weight: 600;
            font-size: 14px;
            box-shadow: var(--shadow-sm);
            transition: all .25s ease;
        }
        .action-card:hover {
            transform: translateY(-3px);
            border-color: var(--primary-color);
            box-shadow: 0 10px 20px rgba(79, 70, 229, 0.12);
            color: var(--primary-color);
        }
        .action-icon {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: rgba(79, 70, 229, 0.08);
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            transition: all .25s ease;
        }
        .action-card:hover .action-icon {
            background: var(--primary-color);
            color: #ffffff;
        }

        /* Two columns */
        .two-col-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
            margin-top: 25px;
        }
        @media (max-width: 900px) {
            .two-col-grid { grid-template-columns: 1fr; }
        }

        .card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            box-shadow: var(--shadow-sm);
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
        .grid-view {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }
        .grid-view th {
            background: #f8fafc;
            padding: 12px 16px;
            text-align: left;
            font-weight: 600;
            color: var(--text-muted);
            border-bottom: 1px solid var(--border-color);
        }
        .grid-view td {
            padding: 12px 16px;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-main);
        }
        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            background: rgba(14, 165, 233, 0.12);
            color: #0284c7;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Teacher Panel Navigation Sub-bar -->
    <div class="teacher-nav">
        <a href="TeacherDashboard.aspx" class="teacher-nav-item active">
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
        <a href="TeacherTimetable.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
        <a href="TeacherProfile.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-user-circle"></i> Profile
        </a>
    </div>

    <!-- Welcome Banner -->
    <div class="welcome-banner">
        <h1>Welcome to Teacher Portal, <asp:Label ID="lblTeacherGreeting" runat="server" Text="Teacher"></asp:Label>!</h1>
        <p>Access your class schedules, mark daily student attendance, inspect teacher directory details, and update your personal faculty profile.</p>
    </div>

    <!-- Statistics Cards Grid -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-info">
                <h3>Total Classes</h3>
                <p><asp:Label ID="lblTotalClasses" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="stat-icon icon-blue">
                <i class="fa-solid fa-school"></i>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-info">
                <h3>Total Students</h3>
                <p><asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="stat-icon icon-green">
                <i class="fa-solid fa-user-graduate"></i>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-info">
                <h3>Total Teachers</h3>
                <p><asp:Label ID="lblTotalTeachers" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="stat-icon icon-purple">
                <i class="fa-solid fa-chalkboard-teacher"></i>
            </div>
        </div>

        <div class="stat-card">
            <div class="stat-info">
                <h3>Specializations</h3>
                <p><asp:Label ID="lblTotalSubjects" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="stat-icon icon-orange">
                <i class="fa-solid fa-book-open"></i>
            </div>
        </div>
    </div>

    <!-- Quick Actions Card -->
    <div class="card" style="margin-bottom: 25px;">
        <div class="card-header">
            <span><i class="fa-solid fa-bolt" style="color: #f59e0b; margin-right: 8px;"></i> Teacher Quick Operations</span>
        </div>
        <div class="card-body">
            <div class="actions-grid">
                <a href="TeacherAttendance.aspx" class="action-card">
                    <div class="action-icon"><i class="fa-solid fa-calendar-check"></i></div>
                    <div>
                        <div>Mark Attendance</div>
                        <small style="color: var(--text-muted); font-weight: normal;">Daily student roll call</small>
                    </div>
                </a>
                <a href="TeacherTimetable.aspx" class="action-card">
                    <div class="action-icon"><i class="fa-solid fa-calendar-days"></i></div>
                    <div>
                        <div>View Timetable</div>
                        <small style="color: var(--text-muted); font-weight: normal;">Weekly class routine</small>
                    </div>
                </a>
                <a href="TeacherDetails.aspx" class="action-card">
                    <div class="action-icon"><i class="fa-solid fa-id-card"></i></div>
                    <div>
                        <div>Teacher Details</div>
                        <small style="color: var(--text-muted); font-weight: normal;">Faculty member info</small>
                    </div>
                </a>
                <a href="Teachers.aspx" class="action-card">
                    <div class="action-icon"><i class="fa-solid fa-users"></i></div>
                    <div>
                        <div>Teacher Registry</div>
                        <small style="color: var(--text-muted); font-weight: normal;">Manage teachers (CRUD)</small>
                    </div>
                </a>
                <a href="TeacherProfile.aspx" class="action-card">
                    <div class="action-icon"><i class="fa-solid fa-user-gear"></i></div>
                    <div>
                        <div>Teacher Profile</div>
                        <small style="color: var(--text-muted); font-weight: normal;">Personal account settings</small>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Two Columns: School Classes & Faculty Summary -->
    <div class="two-col-grid">
        <!-- Classes Overview Card -->
        <div class="card">
            <div class="card-header">
                <span><i class="fa-solid fa-chalkboard"></i> Active School Classes</span>
                <a href="TeacherAttendance.aspx" class="badge" style="text-decoration: none;">Mark Attendance</a>
            </div>
            <div class="card-body" style="padding: 0;">
                <asp:GridView ID="gvDashboardClasses" runat="server" AutoGenerateColumns="False" CssClass="grid-view" EmptyDataText="No classes registered yet.">
                    <Columns>
                        <asp:BoundField DataField="ClassId" HeaderText="Class ID" HeaderStyle-Width="90px" />
                        <asp:BoundField DataField="ClassName" HeaderText="Class Name" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Teachers Summary Card -->
        <div class="card">
            <div class="card-header">
                <span><i class="fa-solid fa-user-tie"></i> Faculty Directory Overview</span>
                <a href="Teachers.aspx" class="badge" style="text-decoration: none;">View All</a>
            </div>
            <div class="card-body" style="padding: 0;">
                <asp:GridView ID="gvDashboardTeachers" runat="server" AutoGenerateColumns="False" CssClass="grid-view" EmptyDataText="No teachers recorded yet.">
                    <Columns>
                        <asp:BoundField DataField="T_FullName" HeaderText="Teacher Name" />
                        <asp:BoundField DataField="T_Specialization" HeaderText="Specialization" />
                        <asp:TemplateField HeaderText="Action" HeaderStyle-Width="90px">
                            <ItemTemplate>
                                <a href='<%# "TeacherDetails.aspx?id=" + Eval("T_Id") %>' style="color: var(--primary-color); font-weight: 600;">Details</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
