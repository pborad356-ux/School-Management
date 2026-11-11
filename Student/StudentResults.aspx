<%@ Page Title="Student Results" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentResults.aspx.cs" Inherits="SchoolManagement.StudentResults" %>

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

        .summary-card {
            background: linear-gradient(135deg, #0284c7 0%, #0ea5e9 100%);
            color: #ffffff;
            border-radius: 20px;
            padding: 24px 30px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            box-shadow: 0 10px 25px rgba(14, 165, 233, 0.25);
        }
        .summary-item h4 {
            font-size: 13px;
            font-weight: 600;
            opacity: 0.9;
            margin: 0 0 4px 0;
        }
        .summary-item p {
            font-size: 24px;
            font-weight: 800;
            margin: 0;
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
        .badge-pass {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 8px;
            font-size: 12px;
            font-weight: 700;
            background: #dcfce7;
            color: #15803d;
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
        <a href="StudentResults.aspx" class="student-nav-item active">
            <i class="fa-solid fa-chart-column"></i> Results & Marks
        </a>
        <a href="StudentFees.aspx" class="student-nav-item">
            <i class="fa-solid fa-wallet"></i> Fee Status
        </a>
        <a href="StudentTimetable.aspx" class="student-nav-item">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
    </div>

    <!-- Overall Marks Summary -->
    <div class="summary-card">
        <div class="summary-item">
            <h4>Total Marks</h4>
            <p><asp:Label ID="lblTotalMarks" runat="server" Text="455 / 500"></asp:Label></p>
        </div>
        <div class="summary-item">
            <h4>Percentage</h4>
            <p><asp:Label ID="lblPercentage" runat="server" Text="91.0%"></asp:Label></p>
        </div>
        <div class="summary-item">
            <h4>Overall Grade</h4>
            <p><asp:Label ID="lblGrade" runat="server" Text="A+"></asp:Label></p>
        </div>
        <div class="summary-item">
            <h4>Status</h4>
            <p><asp:Label ID="lblFinalStatus" runat="server" Text="PASSED"></asp:Label></p>
        </div>
    </div>

    <!-- Results Table Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-award" style="color: #0284c7; margin-right: 8px;"></i> Semester Examination Marksheet</span>
            <span style="font-size: 13.5px; color: var(--text-muted); font-weight: 600;">Term 1 &bull; Class 10</span>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvResults" runat="server" AutoGenerateColumns="False" CssClass="grid-view" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="SubjectCode" HeaderText="Code" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject Title" />
                        <asp:BoundField DataField="MaxMarks" HeaderText="Max Marks" />
                        <asp:BoundField DataField="MinMarks" HeaderText="Pass Marks" />
                        <asp:BoundField DataField="ObtainedMarks" HeaderText="Obtained Marks" />
                        <asp:BoundField DataField="Grade" HeaderText="Grade" />
                        <asp:TemplateField HeaderText="Result">
                            <ItemTemplate>
                                <span class="badge-pass"><%# Eval("Status") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
