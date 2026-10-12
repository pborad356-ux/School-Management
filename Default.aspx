<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SchoolManagement.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">--%>

    <style>

        /* =========================================
           DASHBOARD - PREMIUM 3D DESIGN
        ========================================= */


        /* =========================================
           WELCOME BANNER
        ========================================= */

        .welcome-banner {
            position: relative;

            margin-bottom: 28px;

            padding: 32px 35px;

            overflow: hidden;

            border-radius: 24px;

            color: #ffffff;

            background:
                linear-gradient(
                    135deg,
                    #4338ca 0%,
                    #6366f1 48%,
                    #0891b2 100%
                );

            box-shadow:
                0 20px 45px rgba(79,70,229,.25),
                0 8px 18px rgba(15,23,42,.08),
                inset 0 1px 0 rgba(255,255,255,.25);

            transition:
                transform .3s ease,
                box-shadow .3s ease;
        }


        .welcome-banner:hover {
            transform: translateY(-4px);

            box-shadow:
                0 28px 55px rgba(79,70,229,.30),
                0 10px 22px rgba(15,23,42,.10),
                inset 0 1px 0 rgba(255,255,255,.30);
        }


        /* Decorative circles */

        .welcome-banner::before {
            content: "";

            position: absolute;

            width: 260px;
            height: 260px;

            right: -80px;
            top: -120px;

            border-radius: 50%;

            background:
                rgba(255,255,255,.12);

            filter: blur(2px);

            pointer-events: none;
        }


        .welcome-banner::after {
            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            left: 45%;
            bottom: -130px;

            border-radius: 50%;

            background:
                rgba(255,255,255,.08);

            pointer-events: none;
        }


        .welcome-banner h1 {
            position: relative;

            z-index: 2;

            margin: 0 0 10px;

            font-size: 29px;

            font-weight: 800;

            letter-spacing: -.5px;

            text-shadow:
                0 3px 8px rgba(0,0,0,.18);
        }


        .welcome-banner p {
            position: relative;

            z-index: 2;

            max-width: 850px;

            margin: 0;

            color: rgba(255,255,255,.88);

            font-size: 14px;

            line-height: 1.7;
        }


        /* =========================================
           STATISTICS GRID
        ========================================= */

        .stats-grid {
            display: grid;

            grid-template-columns:
                repeat(3, minmax(0, 1fr));

            gap: 22px;

            margin-bottom: 28px;
        }


        /* =========================================
           STAT CARD
        ========================================= */

        .stat-card {
            position: relative;

            min-height: 145px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 20px;

            padding: 25px;

            overflow: hidden;

            border-radius: 20px;

            background:
                rgba(255,255,255,.86);

            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);

            border: 1px solid rgba(255,255,255,.85);

            box-shadow:
                0 16px 35px rgba(15,23,42,.09),
                0 5px 12px rgba(15,23,42,.04),
                inset 0 1px 0 rgba(255,255,255,.95);

            transition:
                transform .3s ease,
                box-shadow .3s ease;
        }


        .stat-card:hover {
            transform:
                translateY(-6px)
                scale(1.01);

            box-shadow:
                0 25px 50px rgba(15,23,42,.14),
                0 8px 18px rgba(15,23,42,.06),
                inset 0 1px 0 rgba(255,255,255,1);
        }


        /* Card decorative glow */

        .stat-card::before {
            content: "";

            position: absolute;

            width: 130px;
            height: 130px;

            right: -45px;
            top: -55px;

            border-radius: 50%;

            background:
                rgba(99,102,241,.07);

            pointer-events: none;
        }


        /* =========================================
           STAT INFORMATION
        ========================================= */

        .stat-info {
            position: relative;

            z-index: 2;
        }


        .stat-info h3 {
            margin: 0 0 10px;

            color: #64748b;

            font-size: 13px;

            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: .6px;
        }


        .stat-info p {
            margin: 0;

            color: #0f172a;

            font-size: 34px;

            line-height: 1;

            font-weight: 800;

            letter-spacing: -1px;
        }


        /* =========================================
           STAT ICON
        ========================================= */

        .stat-icon {
            position: relative;

            z-index: 2;

            flex-shrink: 0;

            width: 64px;
            height: 64px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 18px;

            color: #ffffff;

            font-size: 26px;

            box-shadow:
                0 12px 22px rgba(15,23,42,.15),
                inset 0 1px 0 rgba(255,255,255,.35);

            transition:
                transform .3s ease;
        }


        .stat-card:hover .stat-icon {
            transform:
                rotate(-5deg)
                scale(1.08);
        }


        /* =========================================
           STUDENT ICON
        ========================================= */

        .icon-blue {
            background:
                linear-gradient(
                    135deg,
                    #06b6d4,
                    #2563eb
                );

            box-shadow:
                0 12px 24px rgba(37,99,235,.25),
                inset 0 1px 0 rgba(255,255,255,.35);
        }


        /* =========================================
           TEACHER ICON
        ========================================= */

        .icon-purple {
            background:
                linear-gradient(
                    135deg,
                    #8b5cf6,
                    #6366f1
                );

            box-shadow:
                0 12px 24px rgba(99,102,241,.25),
                inset 0 1px 0 rgba(255,255,255,.35);
        }


        /* =========================================
           CLASS ICON
        ========================================= */

        .icon-green {
            background:
                linear-gradient(
                    135deg,
                    #10b981,
                    #059669
                );

            box-shadow:
                0 12px 24px rgba(5,150,105,.24),
                inset 0 1px 0 rgba(255,255,255,.35);
        }


        /* =========================================
           QUICK ACTION CARD
        ========================================= */

        .card {
            position: relative;

            background:
                rgba(255,255,255,.84);

            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);

            border: 1px solid rgba(255,255,255,.8);

            border-radius: 22px;

            overflow: hidden;

            box-shadow:
                0 18px 45px rgba(15,23,42,.10),
                0 6px 15px rgba(15,23,42,.05),
                inset 0 1px 0 rgba(255,255,255,.95);

            transition:
                transform .3s ease,
                box-shadow .3s ease;
        }


        .card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 25px 55px rgba(15,23,42,.14),
                0 8px 20px rgba(15,23,42,.07),
                inset 0 1px 0 rgba(255,255,255,1);
        }


        /* =========================================
           CARD HEADER
        ========================================= */

        .card-header {
            min-height: 65px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 15px 22px;

            color: #1e293b;

            font-size: 17px;

            font-weight: 800;

            background:
                linear-gradient(
                    135deg,
                    rgba(99,102,241,.10),
                    rgba(6,182,212,.06)
                );

            border-bottom:
                1px solid rgba(148,163,184,.16);

            position: relative;
        }


        .card-header::before {
            content: "";

            position: absolute;

            top: 0;
            left: 0;
            right: 0;

            height: 2px;

            background:
                linear-gradient(
                    90deg,
                    #6366f1,
                    #06b6d4
                );
        }


        .card-header i {
            color: #6366f1;

            margin-right: 8px;

            font-size: 18px;

            filter:
                drop-shadow(
                    0 3px 5px rgba(99,102,241,.25)
                );
        }


        /* =========================================
           CARD BODY
        ========================================= */

        .card-body {
            padding: 25px;
        }


        /* =========================================
           QUICK ACTION BUTTONS
        ========================================= */

        .btn-group {
            display: flex;

            flex-wrap: wrap;

            gap: 14px;

            margin-top: 0;
        }


        .btn {
            min-height: 46px;

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 8px;

            padding: 10px 20px;

            border-radius: 11px;

            text-decoration: none;

            border: none;

            font-family: inherit;

            font-size: 14px;

            font-weight: 700;

            cursor: pointer;

            transition:
                transform .25s ease,
                box-shadow .25s ease,
                background .25s ease;
        }


        .btn-primary {
            color: #ffffff;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #4f46e5
                );

            box-shadow:
                0 9px 20px rgba(99,102,241,.28),
                inset 0 1px 0 rgba(255,255,255,.30);
        }


        .btn-primary:hover {
            color: #ffffff;

            transform: translateY(-3px);

            box-shadow:
                0 14px 28px rgba(99,102,241,.35),
                inset 0 1px 0 rgba(255,255,255,.35);
        }


        .btn-secondary {
            color: #334155;

            background:
                linear-gradient(
                    135deg,
                    #f8fafc,
                    #e2e8f0
                );

            border: 1px solid #dbe2ea;

            box-shadow:
                0 6px 14px rgba(15,23,42,.08),
                inset 0 1px 0 #ffffff;
        }


        .btn-secondary:hover {
            color: #1e293b;

            background: #ffffff;

            transform: translateY(-3px);

            box-shadow:
                0 11px 22px rgba(15,23,42,.12),
                inset 0 1px 0 #ffffff;
        }


        .btn i {
            font-size: 14px;
        }


        /* =========================================
           RESPONSIVE - TABLET
        ========================================= */

        @media (max-width: 900px) {

            .stats-grid {
                grid-template-columns:
                    repeat(2, minmax(0, 1fr));
            }


            .stats-grid .stat-card:last-child {
                grid-column: span 2;
            }


            .welcome-banner {
                padding: 27px 28px;
            }


            .welcome-banner h1 {
                font-size: 25px;
            }

        }


        /* =========================================
           RESPONSIVE - MOBILE
        ========================================= */

        @media (max-width: 700px) {

            .welcome-banner {
                padding: 24px 20px;

                border-radius: 19px;
            }


            .welcome-banner h1 {
                font-size: 22px;

                line-height: 1.3;
            }


            .welcome-banner p {
                font-size: 13px;

                line-height: 1.6;
            }


            .stats-grid {
                grid-template-columns: 1fr;

                gap: 15px;
            }


            .stats-grid .stat-card:last-child {
                grid-column: auto;
            }


            .stat-card {
                min-height: 125px;

                padding: 20px;
            }


            .stat-info p {
                font-size: 30px;
            }


            .stat-icon {
                width: 57px;
                height: 57px;

                border-radius: 16px;

                font-size: 23px;
            }


            .card {
                border-radius: 18px;
            }


            .card-header {
                min-height: 58px;

                padding: 13px 17px;

                font-size: 15px;
            }


            .card-body {
                padding: 18px;
            }


            .btn-group {
                flex-direction: column;

                width: 100%;
            }


            .btn {
                width: 100%;
            }

        }


        /* =========================================
           SMALL MOBILE
        ========================================= */

        @media (max-width: 400px) {

            .welcome-banner {
                padding: 20px 17px;
            }


            .welcome-banner h1 {
                font-size: 20px;
            }


            .stat-card {
                padding: 17px;
            }


            .stat-info h3 {
                font-size: 11px;
            }


            .stat-info p {
                font-size: 27px;
            }


            .stat-icon {
                width: 52px;
                height: 52px;

                font-size: 21px;
            }

        }

    </style>

<%--</asp:Content>--%>
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
