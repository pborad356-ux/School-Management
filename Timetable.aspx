<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="SchoolManagement.Timetable" %>--%>

<%@ Page Title="Timetable Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="SchoolManagement.Timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ===== TIMETABLE MANAGEMENT - PREMIUM 3D DESIGN ===== */

        .tt-page {
            padding: 10px 5px 30px;
            color: #1e293b;
            font-family: 'Outfit', sans-serif;
        }

        .tt-hero {
            position: relative;
            overflow: hidden;
            padding: 30px;
            margin-bottom: 25px;
            border-radius: 24px;
            color: #fff;
            background: linear-gradient(135deg, #4338ca, #6366f1 48%, #0891b2);
            box-shadow: 0 18px 40px rgba(79,70,229,.24),
                        inset 0 1px 0 rgba(255,255,255,.25);
            transition: all .3s ease;
        }

        .tt-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 25px 48px rgba(79,70,229,.30);
        }

        .tt-hero:after {
            content: "";
            position: absolute;
            width: 230px;
            height: 230px;
            right: -65px;
            top: -105px;
            border-radius: 50%;
            background: rgba(255,255,255,.12);
            pointer-events: none;
        }

        .tt-hero h1 {
            position: relative;
            z-index: 1;
            margin: 0 0 8px;
            font-size: 30px;
            font-weight: 700;
        }

        .tt-hero p {
            position: relative;
            z-index: 1;
            margin: 0;
            color: rgba(255,255,255,.85);
            font-size: 14px;
        }

        .tt-hero-icon {
            position: absolute;
            right: 35px;
            bottom: 20px;
            font-size: 75px;
            opacity: .20;
        }

        /* Summary Cards */

        .tt-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }

        .tt-stat {
            position: relative;
            overflow: hidden;
            padding: 23px;
            background: linear-gradient(145deg, #ffffff, #f3f6ff);
            border: 1px solid rgba(226,232,240,.9);
            border-radius: 20px;
            box-shadow: 0 8px 18px rgba(15,23,42,.06),
                        0 3px 6px rgba(15,23,42,.03),
                        inset 0 1px 0 #fff;
            transition: all .3s ease;
        }

        .tt-stat:hover {
            transform: translateY(-5px);
            box-shadow: 0 18px 30px rgba(79,70,229,.13);
        }

        .tt-stat-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
        }

        .tt-stat-label {
            color: #64748b;
            font-size: 13px;
            font-weight: 600;
        }

        .tt-stat-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            border-radius: 14px;
            font-size: 20px;
            box-shadow: inset 0 1px 0 rgba(255,255,255,.7);
        }

        .tt-purple {
            color: #4f46e5;
            background: linear-gradient(135deg, #e0e7ff, #c7d2fe);
        }

        .tt-green {
            color: #059669;
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
        }

        .tt-orange {
            color: #d97706;
            background: linear-gradient(135deg, #fef3c7, #fde68a);
        }

        .tt-stat h2 {
            margin: 17px 0 5px;
            font-size: 28px;
            font-weight: 700;
            color: #1e293b;
            overflow-wrap: anywhere;
        }

        .tt-stat small {
            color: #64748b;
            font-size: 12px;
        }

        /* Main Panels */

        .tt-card {
            margin-bottom: 25px;
            padding: 25px;
            background: rgba(255,255,255,.94);
            border: 1px solid #e2e8f0;
            border-radius: 22px;
            box-shadow: 0 10px 25px rgba(15,23,42,.055),
                        inset 0 1px 0 #fff;
        }

        .tt-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 23px;
            padding-bottom: 17px;
            border-bottom: 1px solid #eef2f7;
        }

        .tt-card-header h3 {
            margin: 0 0 5px;
            font-size: 20px;
            font-weight: 700;
            color: #1e293b;
        }

        .tt-card-header p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        .tt-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .tt-field {
            min-width: 0;
        }

        .tt-field label {
            display: block;
            margin-bottom: 8px;
            color: #334155;
            font-size: 13px;
            font-weight: 600;
        }

        .tt-input {
            display: block;
            width: 100%;
            min-height: 46px;
            padding: 11px 13px;
            box-sizing: border-box;
            border: 1px solid #dbe3ef;
            border-radius: 12px;
            outline: none;
            background: linear-gradient(145deg, #ffffff, #f8faff);
            color: #1e293b;
            font-family: inherit;
            font-size: 14px;
            transition: all .25s ease;
        }

        .tt-input:focus {
            border-color: #6366f1;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(99,102,241,.12),
                        0 5px 12px rgba(79,70,229,.07);
        }

        .tt-input::placeholder {
            color: #94a3b8;
        }

        .tt-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px solid #eef2f7;
        }

        .tt-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 44px;
            padding: 11px 22px;
            border: 0;
            border-radius: 12px;
            cursor: pointer;
            font-family: inherit;
            font-size: 14px;
            font-weight: 600;
            transition: all .25s ease;
        }

        .tt-btn-primary {
            color: #fff;
            background: linear-gradient(135deg, #4f46e5, #6366f1);
            box-shadow: 0 7px 15px rgba(79,70,229,.23),
                        inset 0 1px 0 rgba(255,255,255,.2);
        }

        .tt-btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 22px rgba(79,70,229,.30);
        }

        .tt-btn-green {
            color: #fff;
            background: linear-gradient(135deg, #059669, #10b981);
            box-shadow: 0 6px 14px rgba(16,185,129,.18);
        }

        .tt-btn-light {
            color: #475569;
            background: linear-gradient(145deg, #fff, #f1f5f9);
            border: 1px solid #e2e8f0;
        }

        .tt-btn-light:hover {
            transform: translateY(-2px);
            background: #eef2ff;
            color: #4338ca;
        }

        .tt-message {
            display: block;
            margin-top: 15px;
            font-size: 13px;
            font-weight: 600;
        }

        /* GridView */

        .tt-table-wrap {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e8edf5;
            border-radius: 14px;
        }

        .tt-table {
            width: 100%;
            min-width: 900px;
            border-collapse: collapse;
            background: #fff;
        }

        .tt-table th {
            padding: 15px 14px;
            text-align: left;
            white-space: nowrap;
            color: #475569;
            background: linear-gradient(135deg, #eef2ff, #f0f9ff);
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .4px;
            border-bottom: 1px solid #e2e8f0;
        }

        .tt-table td {
            padding: 14px;
            color: #475569;
            font-size: 13px;
            border-bottom: 1px solid #eef2f7;
        }

        .tt-table tr:last-child td {
            border-bottom: none;
        }

        .tt-table tr:hover td {
            background: #f8faff;
        }

        .tt-search {
            display: flex;
            gap: 10px;
            width: 100%;
            max-width: 440px;
        }

        .tt-search .tt-input {
            flex: 1;
            min-width: 0;
        }

        .tt-edit {
            color: #4f46e5;
            font-weight: 700;
            text-decoration: none;
        }

        .tt-edit:hover {
            color: #0891b2;
            text-decoration: underline;
        }

        .tt-footer-note {
            margin-top: 15px;
            color: #94a3b8;
            font-size: 12px;
        }

        @media (max-width: 900px) {
            .tt-stats {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 600px) {
            .tt-page {
                padding: 5px 0 20px;
            }

            .tt-hero {
                padding: 24px 20px;
                border-radius: 18px;
            }

            .tt-hero h1 {
                font-size: 24px;
            }

            .tt-hero-icon {
                right: 15px;
                bottom: 15px;
                font-size: 48px;
            }

            .tt-stats,
            .tt-form-grid {
                grid-template-columns: 1fr;
            }

            .tt-card {
                padding: 18px;
                border-radius: 17px;
            }

            .tt-card-header h3 {
                font-size: 18px;
            }

            .tt-search {
                max-width: 100%;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="tt-page">

        <!-- PAGE HEADER -->

        <div class="tt-hero">
            <h1>Timetable Management</h1>
            <p>Organize classes, teachers, subjects and lecture schedules.</p>
            <span class="tt-hero-icon">&#128197;</span>
        </div>


        <!-- SUMMARY CARDS -->

        <div class="tt-stats">

            <div class="tt-stat">
                <div class="tt-stat-top">
                    <span class="tt-stat-label">Total Lectures</span>
                    <span class="tt-stat-icon tt-purple">&#128218;</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalLectures" runat="server" Text="0" />
                </h2>
                <small>Total timetable entries</small>
            </div>

            <div class="tt-stat">
                <div class="tt-stat-top">
                    <span class="tt-stat-label">Total Subjects</span>
                    <span class="tt-stat-icon tt-green">&#128214;</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalSubjects" runat="server" Text="0" />
                </h2>
                <small>Subjects in the timetable</small>
            </div>

            <div class="tt-stat">
                <div class="tt-stat-top">
                    <span class="tt-stat-label">Scheduled Days</span>
                    <span class="tt-stat-icon tt-orange">&#128197;</span>
                </div>
                <h2>
                    <asp:Label ID="lblScheduledDays" runat="server" Text="0" />
                </h2>
                <small>Days with scheduled lectures</small>
            </div>

        </div>


        <!-- TIMETABLE FORM -->

        <div class="tt-card">

            <div class="tt-card-header">
                <div>
                    <h3>Add Timetable Entry</h3>
                    <p>Enter class, teacher and lecture schedule details.</p>
                </div>
            </div>

            <div class="tt-form-grid">

                <div class="tt-field">
                    <label>Class</label>
                    <asp:DropDownList ID="ddlClass" runat="server"
                        CssClass="tt-input">
                        <asp:ListItem Text="Select Class" Value="" />
                        <asp:ListItem Text="Class 1" Value="Class 1" />
                        <asp:ListItem Text="Class 2" Value="Class 2" />
                        <asp:ListItem Text="Class 3" Value="Class 3" />
                        <asp:ListItem Text="Class 4" Value="Class 4" />
                        <asp:ListItem Text="Class 5" Value="Class 5" />
                        <asp:ListItem Text="Class 6" Value="Class 6" />
                        <asp:ListItem Text="Class 7" Value="Class 7" />
                        <asp:ListItem Text="Class 8" Value="Class 8" />
                        <asp:ListItem Text="Class 9" Value="Class 9" />
                        <asp:ListItem Text="Class 10" Value="Class 10" />
                    </asp:DropDownList>
                </div>

                <div class="tt-field">
                    <label>Academic Year</label>
                    <asp:DropDownList ID="ddlAcademicYear" runat="server"
                        CssClass="tt-input">
                        <asp:ListItem Text="Select Academic Year" Value="" />
                        <asp:ListItem Text="2026-2027" Value="2026-2027" />
                        <asp:ListItem Text="2027-2028" Value="2027-2028" />
                    </asp:DropDownList>
                </div>

                <div class="tt-field">
                    <label>Day</label>
                    <asp:DropDownList ID="ddlDay" runat="server"
                        CssClass="tt-input">
                        <asp:ListItem Text="Select Day" Value="" />
                        <asp:ListItem Text="Monday" Value="Monday" />
                        <asp:ListItem Text="Tuesday" Value="Tuesday" />
                        <asp:ListItem Text="Wednesday" Value="Wednesday" />
                        <asp:ListItem Text="Thursday" Value="Thursday" />
                        <asp:ListItem Text="Friday" Value="Friday" />
                        <asp:ListItem Text="Saturday" Value="Saturday" />
                    </asp:DropDownList>
                </div>

                <div class="tt-field">
                    <label>Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server"
                        CssClass="tt-input"
                        placeholder="Enter subject name" />
                </div>

                <div class="tt-field">
                    <label>Teacher ID</label>
                    <asp:TextBox ID="txtTeacherId" runat="server"
                        CssClass="tt-input"
                        TextMode="Number"
                        placeholder="Enter teacher ID" />
                </div>

                <div class="tt-field">
                    <label>Lecture Number</label>
                    <asp:DropDownList ID="ddlLecture" runat="server"
                        CssClass="tt-input">
                        <asp:ListItem Text="Select Lecture" Value="" />
                        <asp:ListItem Text="Lecture 1" Value="1" />
                        <asp:ListItem Text="Lecture 2" Value="2" />
                        <asp:ListItem Text="Lecture 3" Value="3" />
                        <asp:ListItem Text="Lecture 4" Value="4" />
                        <asp:ListItem Text="Lecture 5" Value="5" />
                        <asp:ListItem Text="Lecture 6" Value="6" />
                        <asp:ListItem Text="Lecture 7" Value="7" />
                    </asp:DropDownList>
                </div>

                <div class="tt-field">
                    <label>Start Time</label>
                    <asp:TextBox ID="txtStartTime" runat="server"
                        CssClass="tt-input"
                        TextMode="Time" />
                </div>

                <div class="tt-field">
                    <label>End Time</label>
                    <asp:TextBox ID="txtEndTime" runat="server"
                        CssClass="tt-input"
                        TextMode="Time" />
                </div>

                <div class="tt-field">
                    <label>Room Number</label>
                    <asp:TextBox ID="txtRoomNumber" runat="server"
                        CssClass="tt-input"
                        placeholder="Enter room number" />
                </div>

            </div>

            <div class="tt-actions">

                <asp:Button ID="btnSave" runat="server"
                    Text="Save Timetable"
                    CssClass="tt-btn tt-btn-primary"
                    OnClick="btnSave_Click" />

                <asp:Button ID="btnUpdate" runat="server"
                    Text="Update Timetable"
                    CssClass="tt-btn tt-btn-green"
                    OnClick="btnUpdate_Click" />

                <asp:Button ID="btnClear" runat="server"
                    Text="Clear Form"
                    CssClass="tt-btn tt-btn-light"
                    CausesValidation="false"
                    OnClick="btnClear_Click" />

            </div>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="tt-message" />

        </div>


        <!-- TIMETABLE GRIDVIEW -->

        <div class="tt-card">

            <div class="tt-card-header">
                <div>
                    <h3>Timetable Records</h3>
                    <p>Search and manage scheduled lectures.</p>
                </div>
            </div>

            <div class="tt-search">

                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="tt-input"
                    placeholder="Search by class or teacher ID..." />

                <asp:Button ID="btnSearch" runat="server"
                    Text="Search"
                    CssClass="tt-btn tt-btn-primary"
                    CausesValidation="false"
                    OnClick="btnSearch_Click" />

            </div>

            <br />

            <div class="tt-table-wrap">

                <asp:GridView ID="gvTimetable" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="tt-table"
                    GridLines="None"
                    EmptyDataText="No timetable records found."
                    DataKeyNames="TimetableId"
                    OnRowCommand="gvTimetable_RowCommand">

                    <Columns>

                        <asp:BoundField DataField="TimetableId"
                            HeaderText="ID" />

                        <asp:BoundField DataField="ClassName"
                            HeaderText="Class" />

                        <asp:BoundField DataField="AcademicYear"
                            HeaderText="Academic Year" />

                        <asp:BoundField DataField="Day"
                            HeaderText="Day" />

                        <asp:BoundField DataField="Subject"
                            HeaderText="Subject" />

                        <asp:BoundField DataField="TeacherId"
                            HeaderText="Teacher ID" />

                        <asp:BoundField DataField="LectureNumber"
                            HeaderText="Lecture" />

                        <asp:BoundField DataField="StartTime"
                            HeaderText="Start Time" />

                        <asp:BoundField DataField="EndTime"
                            HeaderText="End Time" />

                        <asp:BoundField DataField="RoomNumber"
                            HeaderText="Room" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server"
                                    Text="Edit"
                                    CssClass="tt-edit"
                                    CommandName="EditTimetable"
                                    CommandArgument='<%# Eval("TimetableId") %>'
                                    CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

            <p class="tt-footer-note">
                Note: Timetable records and summary counts will display after
                database connectivity and backend code are added.
            </p>

        </div>

    </div>

</asp:Content>

