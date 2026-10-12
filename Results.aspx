<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="SchoolManagement.Results" %>

```aspx--%>
<%@ Page Title="Results Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="SchoolManagement.Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ===== RESULTS MANAGEMENT - PREMIUM 3D DESIGN ===== */

        .results-page {
            padding: 10px 5px 30px;
            color: #1e293b;
            font-family: 'Outfit', sans-serif;
        }

        .results-hero {
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

        .results-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 25px 48px rgba(79,70,229,.30);
        }

        .results-hero:after {
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

        .results-hero h1 {
            position: relative;
            z-index: 1;
            margin: 0 0 8px;
            font-size: 30px;
            font-weight: 700;
        }

        .results-hero p {
            position: relative;
            z-index: 1;
            margin: 0;
            color: rgba(255,255,255,.85);
            font-size: 14px;
        }

        .results-hero-icon {
            position: absolute;
            right: 35px;
            bottom: 20px;
            font-size: 75px;
            opacity: .20;
        }

        /* Summary Cards */

        .results-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }

        .result-stat {
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

        .result-stat:hover {
            transform: translateY(-5px);
            box-shadow: 0 18px 30px rgba(79,70,229,.13);
        }

        .result-stat-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
        }

        .result-stat-label {
            color: #64748b;
            font-size: 13px;
            font-weight: 600;
        }

        .result-stat-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            border-radius: 14px;
            font-size: 20px;
            box-shadow: inset 0 1px 0 rgba(255,255,255,.7);
        }

        .result-icon-purple {
            color: #4f46e5;
            background: linear-gradient(135deg, #e0e7ff, #c7d2fe);
        }

        .result-icon-green {
            color: #059669;
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
        }

        .result-icon-red {
            color: #dc2626;
            background: linear-gradient(135deg, #fee2e2, #fecaca);
        }

        .result-stat h2 {
            margin: 17px 0 5px;
            font-size: 28px;
            font-weight: 700;
            color: #1e293b;
            overflow-wrap: anywhere;
        }

        .result-stat small {
            color: #64748b;
            font-size: 12px;
        }

        /* Main Panels */

        .results-card {
            margin-bottom: 25px;
            padding: 25px;
            background: rgba(255,255,255,.94);
            border: 1px solid #e2e8f0;
            border-radius: 22px;
            box-shadow: 0 10px 25px rgba(15,23,42,.055),
                        inset 0 1px 0 #fff;
        }

        .results-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 23px;
            padding-bottom: 17px;
            border-bottom: 1px solid #eef2f7;
        }

        .results-card-header h3 {
            margin: 0 0 5px;
            font-size: 20px;
            font-weight: 700;
            color: #1e293b;
        }

        .results-card-header p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        .results-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .results-field {
            min-width: 0;
        }

        .results-field label {
            display: block;
            margin-bottom: 8px;
            color: #334155;
            font-size: 13px;
            font-weight: 600;
        }

        .results-input {
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

        .results-input:focus {
            border-color: #6366f1;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(99,102,241,.12),
                        0 5px 12px rgba(79,70,229,.07);
        }

        .results-input::placeholder {
            color: #94a3b8;
        }

        .results-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px solid #eef2f7;
        }

        .results-btn {
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

        .results-btn-primary {
            color: #fff;
            background: linear-gradient(135deg, #4f46e5, #6366f1);
            box-shadow: 0 7px 15px rgba(79,70,229,.23),
                        inset 0 1px 0 rgba(255,255,255,.2);
        }

        .results-btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 22px rgba(79,70,229,.30);
        }

        .results-btn-green {
            color: #fff;
            background: linear-gradient(135deg, #059669, #10b981);
            box-shadow: 0 6px 14px rgba(16,185,129,.18);
        }

        .results-btn-light {
            color: #475569;
            background: linear-gradient(145deg, #fff, #f1f5f9);
            border: 1px solid #e2e8f0;
        }

        .results-btn-light:hover {
            transform: translateY(-2px);
            background: #eef2ff;
            color: #4338ca;
        }

        .results-message {
            display: block;
            margin-top: 15px;
            font-size: 13px;
            font-weight: 600;
        }

        /* Results Table */

        .results-table-wrap {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e8edf5;
            border-radius: 14px;
        }

        .results-table {
            width: 100%;
            min-width: 850px;
            border-collapse: collapse;
            background: #fff;
        }

        .results-table th {
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

        .results-table td {
            padding: 14px;
            color: #475569;
            font-size: 13px;
            border-bottom: 1px solid #eef2f7;
        }

        .results-table tr:last-child td {
            border-bottom: none;
        }

        .results-table tr:hover td {
            background: #f8faff;
        }

        .results-search {
            display: flex;
            gap: 10px;
            width: 100%;
            max-width: 440px;
        }

        .results-search .results-input {
            flex: 1;
            min-width: 0;
        }

        .results-edit {
            color: #4f46e5;
            font-weight: 700;
            text-decoration: none;
        }

        .results-edit:hover {
            color: #0891b2;
            text-decoration: underline;
        }

        .results-footer-note {
            margin-top: 15px;
            color: #94a3b8;
            font-size: 12px;
        }

        @media (max-width: 900px) {
            .results-stats {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 600px) {
            .results-page {
                padding: 5px 0 20px;
            }

            .results-hero {
                padding: 24px 20px;
                border-radius: 18px;
            }

            .results-hero h1 {
                font-size: 24px;
            }

            .results-hero-icon {
                right: 15px;
                bottom: 15px;
                font-size: 48px;
            }

            .results-stats,
            .results-form-grid {
                grid-template-columns: 1fr;
            }

            .results-card {
                padding: 18px;
                border-radius: 17px;
            }

            .results-card-header h3 {
                font-size: 18px;
            }

            .results-search {
                max-width: 100%;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="results-page">

        <!-- PAGE HEADER -->

        <div class="results-hero">
            <h1>Results Management</h1>
            <p>Manage student marks, grades and examination results.</p>
            <span class="results-hero-icon">&#127891;</span>
        </div>


        <!-- SUMMARY CARDS -->

        <div class="results-stats">

            <div class="result-stat">
                <div class="result-stat-top">
                    <span class="result-stat-label">Total Results</span>
                    <span class="result-stat-icon result-icon-purple">&#128202;</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalResults" runat="server" Text="0" />
                </h2>
                <small>Total result records entered</small>
            </div>

            <div class="result-stat">
                <div class="result-stat-top">
                    <span class="result-stat-label">Passed</span>
                    <span class="result-stat-icon result-icon-green">&#10003;</span>
                </div>
                <h2>
                    <asp:Label ID="lblPassed" runat="server" Text="0" />
                </h2>
                <small>Students who passed</small>
            </div>

            <div class="result-stat">
                <div class="result-stat-top">
                    <span class="result-stat-label">Failed</span>
                    <span class="result-stat-icon result-icon-red">&#10007;</span>
                </div>
                <h2>
                    <asp:Label ID="lblFailed" runat="server" Text="0" />
                </h2>
                <small>Students who need improvement</small>
            </div>

        </div>


        <!-- RESULT FORM -->

        <div class="results-card">

            <div class="results-card-header">
                <div>
                    <h3>Add Result Record</h3>
                    <p>Enter student examination and marks details.</p>
                </div>
            </div>

            <div class="results-form-grid">

                <div class="results-field">
                    <label>Student ID</label>
                    <asp:TextBox ID="txtStudentId" runat="server"
                        CssClass="results-input"
                        TextMode="Number"
                        placeholder="Enter student ID" />
                </div>

                <div class="results-field">
                    <label>Academic Year</label>
                    <asp:DropDownList ID="ddlAcademicYear" runat="server"
                        CssClass="results-input">
                        <asp:ListItem Text="Select Academic Year" Value="" />
                        <asp:ListItem Text="2026-2027" Value="2026-2027" />
                        <asp:ListItem Text="2027-2028" Value="2027-2028" />
                    </asp:DropDownList>
                </div>

                <div class="results-field">
                    <label>Exam Name</label>
                    <asp:DropDownList ID="ddlExamName" runat="server"
                        CssClass="results-input">
                        <asp:ListItem Text="Select Exam" Value="" />
                        <asp:ListItem Text="Unit Test 1" Value="Unit Test 1" />
                        <asp:ListItem Text="Unit Test 2" Value="Unit Test 2" />
                        <asp:ListItem Text="Mid Term" Value="Mid Term" />
                        <asp:ListItem Text="Final Exam" Value="Final Exam" />
                    </asp:DropDownList>
                </div>

                <div class="results-field">
                    <label>Subject</label>
                    <asp:TextBox ID="txtSubject" runat="server"
                        CssClass="results-input"
                        placeholder="Enter subject name" />
                </div>

                <div class="results-field">
                    <label>Total Marks</label>
                    <asp:TextBox ID="txtTotalMarks" runat="server"
                        CssClass="results-input"
                        TextMode="Number"
                        placeholder="Enter total marks" />
                </div>

                <div class="results-field">
                    <label>Obtained Marks</label>
                    <asp:TextBox ID="txtObtainedMarks" runat="server"
                        CssClass="results-input"
                        TextMode="Number"
                        placeholder="Enter obtained marks" />
                </div>

                <div class="results-field">
                    <label>Grade</label>
                    <asp:DropDownList ID="ddlGrade" runat="server"
                        CssClass="results-input">
                        <asp:ListItem Text="Select Grade" Value="" />
                        <asp:ListItem Text="A+" Value="A+" />
                        <asp:ListItem Text="A" Value="A" />
                        <asp:ListItem Text="B+" Value="B+" />
                        <asp:ListItem Text="B" Value="B" />
                        <asp:ListItem Text="C" Value="C" />
                        <asp:ListItem Text="D" Value="D" />
                        <asp:ListItem Text="F" Value="F" />
                    </asp:DropDownList>
                </div>

                <div class="results-field">
                    <label>Result Status</label>
                    <asp:DropDownList ID="ddlResultStatus" runat="server"
                        CssClass="results-input">
                        <asp:ListItem Text="Select Status" Value="" />
                        <asp:ListItem Text="Pass" Value="Pass" />
                        <asp:ListItem Text="Fail" Value="Fail" />
                    </asp:DropDownList>
                </div>

                <div class="results-field">
                    <label>Exam Date</label>
                    <asp:TextBox ID="txtExamDate" runat="server"
                        CssClass="results-input"
                        TextMode="Date" />
                </div>

            </div>

            <div class="results-actions">

                <asp:Button ID="btnSave" runat="server"
                    Text="Save Result"
                    CssClass="results-btn results-btn-primary"
                    OnClick="btnSave_Click" />

                <asp:Button ID="btnUpdate" runat="server"
                    Text="Update Result"
                    CssClass="results-btn results-btn-green"
                    OnClick="btnUpdate_Click" />

                <asp:Button ID="btnClear" runat="server"
                    Text="Clear Form"
                    CssClass="results-btn results-btn-light"
                    CausesValidation="false"
                    OnClick="btnClear_Click" />

            </div>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="results-message" />

        </div>


        <!-- RESULTS GRIDVIEW -->

        <div class="results-card">

            <div class="results-card-header">
                <div>
                    <h3>Student Results</h3>
                    <p>Search and manage examination records.</p>
                </div>
            </div>

            <div class="results-search">

                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="results-input"
                    placeholder="Search by Student ID..." />

                <asp:Button ID="btnSearch" runat="server"
                    Text="Search"
                    CssClass="results-btn results-btn-primary"
                    CausesValidation="false"
                    OnClick="btnSearch_Click" />

            </div>

            <br />

            <div class="results-table-wrap">

                <asp:GridView ID="gvResults" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="results-table"
                    GridLines="None"
                    EmptyDataText="No result records found."
                    DataKeyNames="ResultId"
                    OnRowCommand="gvResults_RowCommand">

                    <Columns>

                        <asp:BoundField DataField="ResultId"
                            HeaderText="Result ID" />

                        <asp:BoundField DataField="StudentId"
                            HeaderText="Student ID" />

                        <asp:BoundField DataField="AcademicYear"
                            HeaderText="Academic Year" />

                        <asp:BoundField DataField="ExamName"
                            HeaderText="Exam" />

                        <asp:BoundField DataField="Subject"
                            HeaderText="Subject" />

                        <asp:BoundField DataField="TotalMarks"
                            HeaderText="Total Marks" />

                        <asp:BoundField DataField="ObtainedMarks"
                            HeaderText="Obtained Marks" />

                        <asp:BoundField DataField="Grade"
                            HeaderText="Grade" />

                        <asp:BoundField DataField="ResultStatus"
                            HeaderText="Status" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server"
                                    Text="Edit"
                                    CssClass="results-edit"
                                    CommandName="EditResult"
                                    CommandArgument='<%# Eval("ResultId") %>'
                                    CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

            <p class="results-footer-note">
                Note: Result records and summary counts will display after
                database connectivity and backend code are added.
            </p>

        </div>

    </div>

</asp:Content>

