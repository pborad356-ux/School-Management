<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SchoolManagement.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Welcome Banner -->
    <div class="welcome-banner">
        <h1>Welcome back, <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>!</h1>
        <p>Here is an overview of your school's current status. Use the sidebar to manage students, teachers, classes, and attendance.</p>
    </div>

    <!-- Statistics Cards Grid -->
    <div class="stats-grid">
        <!-- Students Card -->
        <div class="stat-card">
            <div class="stat-info">
                <h3>Total Students</h3>
                <p><asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="stat-icon icon-blue">
                <i class="fa-solid fa-user-graduate"></i>
            </div>
        </div>

        <!-- Teachers Card -->
        <div class="stat-card">
            <div class="stat-info">
                <h3>Total Teachers</h3>
                <p><asp:Label ID="lblTotalTeachers" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="stat-icon icon-purple">
                <i class="fa-solid fa-chalkboard-teacher"></i>
            </div>
        </div>

        <!-- Classes Card -->
        <div class="stat-card">
            <div class="stat-info">
                <h3>Total Classes</h3>
                <p><asp:Label ID="lblTotalClasses" runat="server" Text="0"></asp:Label></p>
            </div>
            <div class="stat-icon icon-green">
                <i class="fa-solid fa-school"></i>
            </div>
        </div>
    </div>

    <!-- Quick Links Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-rocket"></i> Quick Actions</span>
        </div>
        <div class="card-body">
            <div class="btn-group">
                <a href="Students.aspx" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Manage Students</a>
                <a href="Teachers.aspx" class="btn btn-secondary"><i class="fa-solid fa-plus"></i> Manage Teachers</a>
                <a href="Attendance.aspx" class="btn btn-secondary"><i class="fa-solid fa-check-double"></i> Mark Attendance</a>
            </div>
        </div>
    </div>
</asp:Content>
