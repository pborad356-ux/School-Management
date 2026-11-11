<%@ Page Title="Student Fees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentFees.aspx.cs" Inherits="SchoolManagement.StudentFees" %>

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
        .badge-paid {
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
        <a href="StudentResults.aspx" class="student-nav-item">
            <i class="fa-solid fa-chart-column"></i> Results & Marks
        </a>
        <a href="StudentFees.aspx" class="student-nav-item active">
            <i class="fa-solid fa-wallet"></i> Fee Status
        </a>
        <a href="StudentTimetable.aspx" class="student-nav-item">
            <i class="fa-solid fa-calendar-days"></i> Timetable
        </a>
    </div>

    <!-- Fee Summary Cards -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(14, 165, 233, 0.12); color: #0284c7;">
                <i class="fa-solid fa-coins"></i>
            </div>
            <div class="stat-info">
                <h3>Total Academic Fee</h3>
                <p><asp:Label ID="lblTotalFee" runat="server" Text="₹ 25,000"></asp:Label></p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(16, 185, 129, 0.12); color: #10b981;">
                <i class="fa-solid fa-check-circle"></i>
            </div>
            <div class="stat-info">
                <h3>Paid Amount</h3>
                <p><asp:Label ID="lblPaidAmount" runat="server" Text="₹ 25,000"></asp:Label></p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(239, 68, 68, 0.12); color: #ef4444;">
                <i class="fa-solid fa-hourglass-half"></i>
            </div>
            <div class="stat-info">
                <h3>Pending Due</h3>
                <p><asp:Label ID="lblPendingDue" runat="server" Text="₹ 0.00"></asp:Label></p>
            </div>
        </div>
        <div class="stat-card">
            <div class="stat-icon" style="background: rgba(99, 102, 241, 0.12); color: #6366f1;">
                <i class="fa-solid fa-file-invoice-dollar"></i>
            </div>
            <div class="stat-info">
                <h3>Fee Status</h3>
                <p><span class="badge-paid">Fully Paid</span></p>
            </div>
        </div>
    </div>

    <!-- Breakdown Table -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-receipt" style="color: #0284c7; margin-right: 8px;"></i> Academic Fee Structure Breakdown</span>
            <span style="font-size: 13px; color: var(--text-muted);">Session 2026-2027</span>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <asp:GridView ID="gvFeeBreakdown" runat="server" AutoGenerateColumns="False" CssClass="grid-view" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="FeeHead" HeaderText="Fee Particulars" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />
                        <asp:BoundField DataField="PaidAmount" HeaderText="Amount Paid" />
                        <asp:BoundField DataField="DueDate" HeaderText="Payment Due Date" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class="badge-paid"><%# Eval("Status") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
