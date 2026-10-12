<%--<%@ Page Title="Mark Student Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="SchoolManagement.Attendance" %>--%>
<%@ Page Title="Mark Student Attendance"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Attendance.aspx.cs"
    Inherits="SchoolManagement.Attendance"
    UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">--%>

    <style>

        /* =========================================
           ATTENDANCE PAGE - PREMIUM 3D UI
        ========================================= */

        /* =========================================
           ALERT
        ========================================= */

        .alert-box {
            position: relative;
            z-index: 5;

            padding: 15px 20px;
            margin-bottom: 24px;

            border-radius: 14px;

            font-size: 14px;
            font-weight: 600;

            animation: attendanceAlert .4s ease;

            box-shadow:
                0 10px 25px rgba(15,23,42,.08),
                inset 0 1px 0 rgba(255,255,255,.8);
        }

        .alert-success {
            color: #166534;

            background:
                linear-gradient(
                    135deg,
                    #f0fdf4,
                    #dcfce7
                );

            border: 1px solid #bbf7d0;
        }

        @keyframes attendanceAlert {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }


        /* =========================================
           COMMON CARD
        ========================================= */

        .card {
            position: relative;

            margin-bottom: 25px;

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

            gap: 15px;

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

            border-bottom: 1px solid rgba(148,163,184,.16);

            position: relative;
        }


        /* Header top line */

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
           FORM GRID
        ========================================= */

        .form-grid {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(0, 1fr));

            gap: 20px;
        }


        .form-group {
            margin-bottom: 3px;
        }


        .form-label {
            display: block;

            margin-bottom: 9px;

            color: #334155;

            font-size: 13px;
            font-weight: 700;

            letter-spacing: .2px;
        }


        /* =========================================
           SELECT + DATE INPUT
        ========================================= */

        .form-control {
            width: 100%;

            min-height: 46px;

            padding: 10px 14px;

            border: 1px solid #dbe2ea;

            border-radius: 12px;

            background:
                rgba(255,255,255,.9);

            color: #1e293b;

            font-family: inherit;

            font-size: 14px;

            outline: none;

            box-shadow:
                inset 0 2px 5px rgba(15,23,42,.035),
                0 3px 7px rgba(15,23,42,.025);

            transition:
                all .25s ease;
        }


        .form-control:hover {
            border-color: #a5b4fc;

            transform: translateY(-1px);
        }


        .form-control:focus {
            border-color: #6366f1;

            background: #ffffff;

            transform: translateY(-1px);

            box-shadow:
                0 0 0 4px rgba(99,102,241,.10),
                0 8px 20px rgba(99,102,241,.10),
                inset 0 2px 5px rgba(15,23,42,.02);
        }


        /* =========================================
           DROPDOWN
        ========================================= */

        select.form-control {
            cursor: pointer;

            appearance: auto;
        }


        /* =========================================
           VALIDATION
        ========================================= */

        .form-group span {
            display: block;

            margin-top: 6px;

            color: #ef4444;

            font-size: 12px;
            font-weight: 600;
        }


        /* =========================================
           BUTTON GROUP
        ========================================= */

        .btn-group {
            display: flex;

            gap: 12px;

            margin-top: 22px;
        }


        /* =========================================
           BUTTON
        ========================================= */

        .btn {
            min-height: 45px;

            padding: 10px 22px;

            border: none;

            border-radius: 11px;

            font-family: inherit;

            font-size: 14px;
            font-weight: 700;

            cursor: pointer;

            transition:
                all .25s ease;
        }


        /* =========================================
           PRIMARY BUTTON
        ========================================= */

        .btn-primary {
            color: white;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #4f46e5
                );

            box-shadow:
                0 9px 20px rgba(99,102,241,.28),
                inset 0 1px 0 rgba(255,255,255,.3);

            position: relative;

            overflow: hidden;
        }


        .btn-primary::before {
            content: "";

            position: absolute;

            top: 0;
            left: -100%;

            width: 70%;
            height: 100%;

            background:
                linear-gradient(
                    90deg,
                    transparent,
                    rgba(255,255,255,.25),
                    transparent
                );

            transform: skewX(-20deg);

            transition: left .5s ease;
        }


        .btn-primary:hover {
            transform: translateY(-3px);

            box-shadow:
                0 14px 28px rgba(99,102,241,.35),
                inset 0 1px 0 rgba(255,255,255,.35);
        }


        .btn-primary:hover::before {
            left: 130%;
        }


        .btn-primary:active {
            transform: translateY(1px);
        }


        /* =========================================
           ATTENDANCE GRID
        ========================================= */

        .table-container {
            width: 100%;

            overflow-x: auto;

            border-radius: 15px;

            border: 1px solid #e2e8f0;

            background: white;

            box-shadow:
                0 7px 18px rgba(15,23,42,.06);
        }


        .grid-view {
            width: 100%;

            border-collapse: separate;

            border-spacing: 0;

            background:
                rgba(255,255,255,.95);

            font-size: 14px;
        }


        /* =========================================
           TABLE HEADER
        ========================================= */

        .grid-view th {
            padding: 15px 16px;

            color: white;

            text-align: left;

            font-size: 12px;
            font-weight: 800;

            text-transform: uppercase;

            letter-spacing: .5px;

            background:
                linear-gradient(
                    135deg,
                    #4338ca,
                    #6366f1
                );

            border-bottom: 1px solid rgba(255,255,255,.2);
        }


        .grid-view th:first-child {
            border-radius: 13px 0 0 0;
        }


        .grid-view th:last-child {
            border-radius: 0 13px 0 0;
        }


        /* =========================================
           TABLE DATA
        ========================================= */

        .grid-view td {
            padding: 15px 16px;

            color: #475569;

            font-size: 14px;

            border-bottom: 1px solid #edf2f7;

            vertical-align: middle;
        }


        .grid-view tbody tr {
            transition:
                background .2s ease,
                transform .2s ease;
        }


        .grid-view tbody tr:hover {
            background:
                linear-gradient(
                    90deg,
                    rgba(99,102,241,.07),
                    rgba(6,182,212,.04)
                );
        }


        .grid-view tbody tr:last-child td {
            border-bottom: none;
        }


        /* =========================================
           ATTENDANCE RADIO BUTTONS
        ========================================= */

        .attendance-radio {
            display: flex !important;

            align-items: center;

            justify-content: flex-start;

            gap: 25px;

            margin: 0;

            padding: 0;
        }


        .attendance-radio td {
            padding: 0 !important;

            border: none !important;

            white-space: nowrap;
        }


        .attendance-radio input[type="radio"] {
            width: 18px;
            height: 18px;

            margin: 0 7px 0 0;

            vertical-align: middle;

            accent-color: #6366f1;

            cursor: pointer;
        }


        .attendance-radio label {
            color: #334155;

            font-size: 14px;
            font-weight: 700;

            cursor: pointer;

            transition: color .2s ease;
        }


        .attendance-radio label:hover {
            color: #4f46e5;
        }


        /* =========================================
           PRESENT / ABSENT VISUAL
        ========================================= */

        .attendance-radio input[type="radio"]:checked + label {
            color: #4f46e5;
        }


        /* =========================================
           SHEET INFORMATION BADGE
        ========================================= */

        .header-date {
            display: inline-flex;

            align-items: center;

            padding: 8px 13px;

            border-radius: 10px;

            color: #4f46e5 !important;

            background:
                rgba(99,102,241,.08);

            border: 1px solid rgba(99,102,241,.15);

            font-size: 12px;

            box-shadow:
                0 4px 10px rgba(99,102,241,.07);
        }


        /* =========================================
           SAVE ATTENDANCE BUTTON
        ========================================= */

        #<%= btnSaveAttendance.ClientID %> {
            min-width: 210px;
        }


        /* =========================================
           EMPTY DATA
        ========================================= */

        .grid-view div {
            color: #64748b !important;

            font-size: 14px;

            font-weight: 600;
        }


        /* =========================================
           TABLE SCROLLBAR
        ========================================= */

        .table-container::-webkit-scrollbar {
            height: 7px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #e2e8f0;
        }

        .table-container::-webkit-scrollbar-thumb {
            background:
                linear-gradient(
                    90deg,
                    #6366f1,
                    #06b6d4
                );

            border-radius: 10px;
        }


        /* =========================================
           RESPONSIVE TABLET
        ========================================= */

        @media (max-width: 800px) {

            .form-grid {
                grid-template-columns: 1fr;
            }


            .card-body {
                padding: 20px;
            }


            .attendance-radio {
                gap: 18px;
            }


            .grid-view {
                min-width: 650px;
            }


            .table-container {
                overflow-x: auto;
            }
        }


        /* =========================================
           RESPONSIVE MOBILE
        ========================================= */

        @media (max-width: 600px) {

            .card {
                border-radius: 18px;
            }


            .card-header {
                min-height: 58px;

                padding: 13px 16px;

                font-size: 14px;

                flex-wrap: wrap;
            }


            .card-body {
                padding: 17px;
            }


            .btn-group {
                flex-direction: column;
            }


            .btn {
                width: 100%;
            }


            #<%= btnSaveAttendance.ClientID %> {
                min-width: 100%;
            }


            .header-date {
                width: 100%;

                justify-content: center;

                margin-top: 5px;
            }


            .attendance-radio {
                gap: 15px;
            }
        }


        /* =========================================
           SMALL MOBILE
        ========================================= */

        @media (max-width: 400px) {

            .card-body {
                padding: 14px;
            }


            .form-control {
                min-height: 44px;
            }


            .grid-view {
                min-width: 600px;
            }


            .attendance-radio {
                gap: 12px;
            }
        }

    </style>

</asp:Content>
<%--</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Alert Message Banner -->
    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert-box alert-success" Visible="false">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Selection Controls Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-calendar-days"></i> Select Class & Date</span>
        </div>
        <div class="card-body">
            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">Select Class *</label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvClass" runat="server" ControlToValidate="ddlClass" InitialValue="" ErrorMessage="Please select a class" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="AttendanceLoad"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Attendance Date *</label>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" AutoPostBack="true" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" ErrorMessage="Please select a date" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="AttendanceLoad"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div class="btn-group">
                <asp:Button ID="btnLoad" runat="server" Text="Load Class Students" CssClass="btn btn-primary" OnClick="btnLoad_Click" ValidationGroup="AttendanceLoad" />
            </div>
        </div>
    </div>

    <!-- Attendance Grid Card -->
    <asp:Panel ID="pnlAttendanceGrid" runat="server" CssClass="card" Visible="false">
        <div class="card-header">
            <span><i class="fa-solid fa-check-double"></i> Mark Attendance Sheet</span>
            <asp:Label ID="lblSheetInfo" runat="server" CssClass="header-date" Style="font-weight: 500; color: var(--primary-color);"></asp:Label>
        </div>
        <div class="card-body">
            <div class="table-container">
                <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" CssClass="grid-view" DataKeyNames="StudentId" OnRowDataBound="gvAttendance_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="RollNumber" HeaderText="Roll Number" HeaderStyle-Width="150px" />
                        <asp:BoundField DataField="FullName" HeaderText="Student Name" />
                        <asp:TemplateField HeaderText="Attendance Status" HeaderStyle-Width="300px">
                            <ItemTemplate>
                                <asp:RadioButtonList ID="rblStatus" runat="server" RepeatDirection="Horizontal" CssClass="attendance-radio">
                                    <asp:ListItem Value="Present">Present</asp:ListItem>
                                    <asp:ListItem Value="Absent">Absent</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:HiddenField ID="hfPrevStatus" runat="server" Value='<%# Eval("Status") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="padding: 20px; text-align: center; color: var(--text-muted);">
                            No students registered in this class.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <div class="btn-group" style="margin-top: 20px;">
                <asp:Button ID="btnSaveAttendance" runat="server" Text="Save Attendance Sheet" CssClass="btn btn-primary" OnClick="btnSaveAttendance_Click" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
