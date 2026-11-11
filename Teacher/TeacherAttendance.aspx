<%@ Page Title="Teacher Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeacherAttendance.aspx.cs" Inherits="SchoolManagement.TeacherAttendance" %>

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

        /* Alert Box */
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
        .alert-success {
            background: #f0fdf4;
            color: #15803d;
            border: 1px solid #bbf7d0;
        }
        .alert-info {
            background: #eff6ff;
            color: #1d4ed8;
            border: 1px solid #bfdbfe;
        }

        /* Card Styles matching existing project */
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

        /* Form Grid */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }
        @media (max-width: 640px) {
            .form-grid { grid-template-columns: 1fr; }
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-label {
            font-size: 13.5px;
            font-weight: 600;
            margin-bottom: 8px;
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
            padding: 10px 22px;
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
        .btn-success {
            background: #10b981;
            color: #ffffff;
        }
        .btn-success:hover {
            background: #059669;
        }
        .btn-group {
            display: flex;
            gap: 12px;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        /* Grid View */
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

        .attendance-radio label {
            margin-right: 18px;
            cursor: pointer;
            font-weight: 500;
            font-size: 13.5px;
        }
        .attendance-radio input[type="radio"] {
            margin-right: 6px;
            accent-color: var(--primary-color);
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
        <a href="TeacherAttendance.aspx" class="teacher-nav-item active">
            <i class="fa-solid fa-calendar-check"></i> Attendance
        </a>
        <a href="TeacherTimetable.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
        <a href="TeacherProfile.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-user-circle"></i> Profile
        </a>
    </div>

    <!-- Alert Message Banner -->
    <div style="margin-bottom: 15px;">
        <asp:Label ID="lblAlertMsg" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
    </div>

    <!-- Selection Controls Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-calendar-days" style="color: var(--primary-color); margin-right: 8px;"></i> Select Class & Attendance Date</span>
        </div>
        <div class="card-body">
            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">Select Class *</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">-- Select Class --</asp:ListItem>
                        <asp:ListItem Value="Class 10-A">Class 10-A</asp:ListItem>
                        <asp:ListItem Value="Class 10-B">Class 10-B</asp:ListItem>
                        <asp:ListItem Value="Class 9-A">Class 9-A</asp:ListItem>
                        <asp:ListItem Value="Class 9-B">Class 9-B</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="ddlClass" InitialValue="" ErrorMessage="Please select a class" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="AttendanceLoad"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Attendance Date *</label>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please select a date" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="AttendanceLoad"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnLoad" runat="server" Text="Load Class Students" CssClass="btn btn-primary" OnClick="btnLoad_Click" ValidationGroup="AttendanceLoad" />
            </div>
        </div>
    </div>

    <!-- Attendance Grid Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-check-double" style="color: #10b981; margin-right: 8px;"></i> Student Attendance Roster</span>
            <asp:Label ID="lblSheetInfo" runat="server" Style="font-weight: 600; color: var(--primary-color); font-size: 13.5px;"></asp:Label>
        </div>
        <div class="card-body">
            <div class="table-container">
                <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" CssClass="grid-view" DataKeyNames="StudentId">
                    <Columns>
                        <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" HeaderStyle-Width="140px" />
                        <asp:BoundField DataField="FullName" HeaderText="Student Full Name" />
                        <asp:BoundField DataField="ClassName" HeaderText="Class" HeaderStyle-Width="120px" />
                        <asp:TemplateField HeaderText="Attendance Status" HeaderStyle-Width="250px">
                            <ItemTemplate>
                                <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" CssClass="attendance-radio">
                                    <asp:ListItem Value="Present" Selected="True">Present</asp:ListItem>
                                    <asp:ListItem Value="Absent">Absent</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="padding: 24px; text-align: center; color: var(--text-muted);">
                            <i class="fa-solid fa-users-slash" style="font-size: 28px; margin-bottom: 8px; display: block;"></i>
                            No students currently registered in this class.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <div class="btn-group" style="margin-top: 24px;">
                <asp:Button ID="btnSaveAttendance" runat="server" Text="Save Attendance Sheet" CssClass="btn btn-success" OnClick="btnSaveAttendance_Click" />
            </div>
        </div>
    </div>
</asp:Content>
