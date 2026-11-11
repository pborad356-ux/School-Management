<%@ Page Title="Teacher Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeacherProfile.aspx.cs" Inherits="SchoolManagement.TeacherProfile" %>

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

        /* Selection Card */
        .selector-box {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 18px 24px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 16px;
            box-shadow: var(--shadow-sm);
            flex-wrap: wrap;
        }
        .selector-box label {
            font-size: 13.5px;
            font-weight: 600;
            color: var(--text-main);
            white-space: nowrap;
        }

        /* Profile Layout */
        .profile-container {
            display: grid;
            grid-template-columns: 340px 1fr;
            gap: 25px;
        }
        @media (max-width: 900px) {
            .profile-container { grid-template-columns: 1fr; }
        }

        /* Card styles */
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

        /* Left Card: Summary */
        .profile-summary-card {
            text-align: center;
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(135deg, #4f46e5 0%, #0ea5e9 100%);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 44px;
            margin: 0 auto 16px auto;
            box-shadow: 0 10px 20px rgba(79, 70, 229, 0.25);
        }
        .profile-name {
            font-size: 20px;
            font-weight: 800;
            color: var(--text-main);
            margin-bottom: 4px;
        }
        .profile-badge {
            display: inline-block;
            background: rgba(79, 70, 229, 0.10);
            color: var(--primary-color);
            font-size: 12.5px;
            font-weight: 600;
            padding: 4px 12px;
            border-radius: 20px;
            margin-bottom: 20px;
        }
        .profile-meta-list {
            text-align: left;
            border-top: 1px solid var(--border-color);
            padding-top: 18px;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }
        .profile-meta-item {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            font-size: 13.5px;
        }
        .profile-meta-icon {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            background: #f1f5f9;
            color: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            flex-shrink: 0;
        }
        .profile-meta-label {
            font-size: 11.5px;
            color: var(--text-muted);
            text-transform: uppercase;
            font-weight: 600;
        }
        .profile-meta-val {
            font-weight: 600;
            color: var(--text-main);
            word-break: break-word;
        }

        /* Right Card: Form */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }
        @media (max-width: 600px) {
            .form-grid { grid-template-columns: 1fr; }
        }
        .form-group {
            display: flex;
            flex-direction: column;
        }
        .form-group.full-width {
            grid-column: 1 / -1;
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
        .form-control[readonly] {
            background: #f8fafc;
            color: var(--text-muted);
            cursor: not-allowed;
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
            margin-top: 22px;
            flex-wrap: wrap;
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
        <a href="TeacherTimetable.aspx" class="teacher-nav-item">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
        <a href="TeacherProfile.aspx" class="teacher-nav-item active">
            <i class="fa-solid fa-user-circle"></i> Profile
        </a>
    </div>

    <!-- Alert Message Banner -->
    <div style="margin-bottom: 15px;">
        <asp:Label ID="lblAlertMsg" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
    </div>



    <!-- Two-column Profile Container -->
    <div class="profile-container">
        <!-- Left Column: Summary Card -->
        <div class="card profile-summary-card">
            <div class="card-body">
                <div class="profile-pic">
                    <i class="fa-solid fa-user-tie"></i>
                </div>
                <div class="profile-name">
                    <asp:Label ID="lblProfileFullName" runat="server" Text="Teacher Name"></asp:Label>
                </div>
                <div class="profile-badge">
                    <asp:Label ID="lblProfileSpecialization" runat="server" Text="Specialization"></asp:Label>
                </div>

                <div class="profile-meta-list">
                    <div class="profile-meta-item">
                        <div class="profile-meta-icon"><i class="fa-solid fa-hashtag"></i></div>
                        <div>
                            <div class="profile-meta-label">Faculty ID</div>
                            <div class="profile-meta-val">#<asp:Label ID="lblProfileId" runat="server" Text="1"></asp:Label></div>
                        </div>
                    </div>
                    <div class="profile-meta-item">
                        <div class="profile-meta-icon"><i class="fa-solid fa-envelope"></i></div>
                        <div>
                            <div class="profile-meta-label">Email Address</div>
                            <div class="profile-meta-val"><asp:Label ID="lblProfileEmail" runat="server" Text="email@example.com"></asp:Label></div>
                        </div>
                    </div>
                    <div class="profile-meta-item">
                        <div class="profile-meta-icon"><i class="fa-solid fa-phone"></i></div>
                        <div>
                            <div class="profile-meta-label">Mobile Phone</div>
                            <div class="profile-meta-val"><asp:Label ID="lblProfileMobile" runat="server" Text="9876543210"></asp:Label></div>
                        </div>
                    </div>
                    <div class="profile-meta-item">
                        <div class="profile-meta-icon"><i class="fa-solid fa-user-shield"></i></div>
                        <div>
                            <div class="profile-meta-label">Access Role</div>
                            <div class="profile-meta-val"><asp:Label ID="lblProfileRole" runat="server" Text="Teacher"></asp:Label></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Column: Edit Profile Form -->
        <div class="card">
            <div class="card-header">
                <span><i class="fa-solid fa-id-card-clip" style="color: var(--primary-color); margin-right: 8px;"></i> Update Teacher Profile Details</span>
            </div>
            <div class="card-body">
                <div class="form-grid">
                    <div class="form-group">
                        <label class="form-label">Teacher System ID</label>
                        <asp:TextBox ID="txtEditId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Full Name *</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="e.g. Dr. Amit Mehta"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="ProfileVal"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="e.g. amit@example.com"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email format" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="ProfileVal"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Mobile Number</label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="e.g. 9876543210"></asp:TextBox>
                    </div>

                    <div class="form-group full-width">
                        <label class="form-label">Subject Specialization</label>
                        <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control" placeholder="e.g. Computer Science & Mathematics"></asp:TextBox>
                    </div>
                </div>

                <div class="btn-group">
                    <asp:Button ID="btnUpdateProfile" runat="server" Text="Save Profile Changes" CssClass="btn btn-primary" OnClick="btnUpdateProfile_Click" ValidationGroup="ProfileVal" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset Form" CssClass="btn btn-secondary" OnClick="btnReset_Click" CausesValidation="false" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
