<%@ Page Title="Student Timetable" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentTimetable.aspx.cs" Inherits="SchoolManagement.StudentTimetable" %>

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

        .filter-bar {
            display: flex;
            gap: 15px;
            align-items: center;
            flex-wrap: wrap;
            margin-bottom: 25px;
            background: #ffffff;
            padding: 16px 20px;
            border-radius: 16px;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
        }
        .form-select {
            padding: 9px 14px;
            border: 1px solid var(--border-color);
            border-radius: 10px;
            font-family: inherit;
            font-size: 14px;
            outline: none;
            background: #ffffff;
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
        .badge-room {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 600;
            background: #e0f2fe;
            color: #0284c7;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Student Panel Navigation Sub-bar -->
    <div class="student-nav">
        <a href="StudentDashboard.aspx" class="student-nav-item">
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
        <a href="StudentTimetable.aspx" class="student-nav-item active">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
    </div>

    <!-- Header Banner -->
    <div class="filter-bar" style="display: flex; justify-content: space-between; align-items: center;">
        <span style="font-size: 14px; font-weight: 600; color: var(--text-main);">
            <i class="fa-solid fa-calendar-days" style="color: #0284c7; margin-right: 6px;"></i> Full Weekly Class Schedule
        </span>
        <span style="font-size: 13px; color: var(--text-muted); font-weight: 600;">
            Class: <asp:Label ID="lblCurrentClass" runat="server" Text="Class 10"></asp:Label>
        </span>
    </div>

    <!-- Timetable Grid Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-calendar-week" style="color: #0284c7; margin-right: 8px;"></i> Weekly Class Routine Schedule</span>
            <span style="font-size: 13px; color: var(--text-muted);">Room Allotment & Teacher In-Charge</span>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvTimetable" runat="server" AutoGenerateColumns="False" CssClass="grid-view" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Day" HeaderText="Day" />
                        <asp:BoundField DataField="Timing" HeaderText="Time Period" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                        <asp:BoundField DataField="Teacher" HeaderText="Faculty Teacher" />
                        <asp:TemplateField HeaderText="Classroom / Lab">
                            <ItemTemplate>
                                <span class="badge-room"><%# Eval("Room") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
