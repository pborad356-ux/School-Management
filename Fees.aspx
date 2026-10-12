<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="SchoolManagement.Fees" %>--%>

<%@ Page Title="Fees Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Fees.aspx.cs" Inherits="SchoolManagement.Fees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* ===== FEES MANAGEMENT - PREMIUM 3D DESIGN ===== */

        .fees-page {
            padding: 10px 5px 30px;
            color: #1e293b;
            font-family: 'Outfit', sans-serif;
        }

        .fees-hero {
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

        .fees-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 25px 48px rgba(79,70,229,.30);
        }

        .fees-hero:after {
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

        .fees-hero h1 {
            position: relative;
            z-index: 1;
            margin: 0 0 8px;
            font-size: 30px;
            font-weight: 700;
        }

        .fees-hero p {
            position: relative;
            z-index: 1;
            margin: 0;
            color: rgba(255,255,255,.85);
            font-size: 14px;
        }

        .fees-hero-icon {
            position: absolute;
            right: 35px;
            bottom: 20px;
            font-size: 75px;
            opacity: .20;
        }

        /* Summary Cards */

        .fees-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }

        .fee-stat {
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

        .fee-stat:hover {
            transform: translateY(-5px);
            box-shadow: 0 18px 30px rgba(79,70,229,.13);
        }

        .fee-stat-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 10px;
        }

        .fee-stat-label {
            color: #64748b;
            font-size: 13px;
            font-weight: 600;
        }

        .fee-stat-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            border-radius: 14px;
            font-size: 20px;
            box-shadow: inset 0 1px 0 rgba(255,255,255,.7);
        }

        .icon-purple {
            color: #4f46e5;
            background: linear-gradient(135deg, #e0e7ff, #c7d2fe);
        }

        .icon-green {
            color: #059669;
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
        }

        .icon-orange {
            color: #d97706;
            background: linear-gradient(135deg, #fef3c7, #fde68a);
        }

        .fee-stat h2 {
            margin: 17px 0 5px;
            font-size: 28px;
            font-weight: 700;
            color: #1e293b;
            overflow-wrap: anywhere;
        }

        .fee-stat small {
            color: #64748b;
            font-size: 12px;
        }

        /* Main Panels */

        .fees-card {
            margin-bottom: 25px;
            padding: 25px;
            background: rgba(255,255,255,.94);
            border: 1px solid #e2e8f0;
            border-radius: 22px;
            box-shadow: 0 10px 25px rgba(15,23,42,.055),
                        inset 0 1px 0 #fff;
        }

        .fees-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 23px;
            padding-bottom: 17px;
            border-bottom: 1px solid #eef2f7;
        }

        .fees-card-header h3 {
            margin: 0 0 5px;
            font-size: 20px;
            font-weight: 700;
            color: #1e293b;
        }

        .fees-card-header p {
            margin: 0;
            color: #64748b;
            font-size: 13px;
        }

        .fees-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 20px;
        }

        .fees-field {
            min-width: 0;
        }

        .fees-field label {
            display: block;
            margin-bottom: 8px;
            color: #334155;
            font-size: 13px;
            font-weight: 600;
        }

        .fees-input {
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

        .fees-input:focus {
            border-color: #6366f1;
            background: #fff;
            box-shadow: 0 0 0 4px rgba(99,102,241,.12),
                        0 5px 12px rgba(79,70,229,.07);
        }

        .fees-input::placeholder {
            color: #94a3b8;
        }

        .fees-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px solid #eef2f7;
        }

        .fees-btn {
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

        .fees-btn-primary {
            color: #fff;
            background: linear-gradient(135deg, #4f46e5, #6366f1);
            box-shadow: 0 7px 15px rgba(79,70,229,.23),
                        inset 0 1px 0 rgba(255,255,255,.2);
        }

        .fees-btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 22px rgba(79,70,229,.30);
        }

        .fees-btn-light {
            color: #475569;
            background: linear-gradient(145deg, #fff, #f1f5f9);
            border: 1px solid #e2e8f0;
        }

        .fees-btn-light:hover {
            transform: translateY(-2px);
            background: #eef2ff;
            color: #4338ca;
        }

        .fees-btn-green {
            color: #fff;
            background: linear-gradient(135deg, #059669, #10b981);
            box-shadow: 0 6px 14px rgba(16,185,129,.18);
        }

        .fees-message {
            display: block;
            margin-top: 15px;
            font-size: 13px;
            font-weight: 600;
        }

        /* Records Table */

        .fees-table-wrap {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e8edf5;
            border-radius: 14px;
        }

        .fees-table {
            width: 100%;
            min-width: 760px;
            border-collapse: collapse;
            background: #fff;
        }

        .fees-table th {
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

        .fees-table td {
            padding: 14px;
            color: #475569;
            font-size: 13px;
            border-bottom: 1px solid #eef2f7;
        }

        .fees-table tr:last-child td {
            border-bottom: none;
        }

        .fees-table tr:hover td {
            background: #f8faff;
        }

        .fees-search {
            display: flex;
            gap: 10px;
            width: 100%;
            max-width: 440px;
        }

        .fees-search .fees-input {
            flex: 1;
            min-width: 0;
        }

        .fees-footer-note {
            margin-top: 15px;
            color: #94a3b8;
            font-size: 12px;
        }

        @media (max-width: 900px) {
            .fees-stats {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 600px) {
            .fees-page {
                padding: 5px 0 20px;
            }

            .fees-hero {
                padding: 24px 20px;
                border-radius: 18px;
            }

            .fees-hero h1 {
                font-size: 24px;
            }

            .fees-hero-icon {
                right: 15px;
                bottom: 15px;
                font-size: 48px;
            }

            .fees-stats,
            .fees-form-grid {
                grid-template-columns: 1fr;
            }

            .fees-card {
                padding: 18px;
                border-radius: 17px;
            }

            .fees-card-header h3 {
                font-size: 18px;
            }

            .fees-search {
                max-width: 100%;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="fees-page">

        <!-- PAGE HEADER -->

        <div class="fees-hero">
            <h1>Fees Management</h1>
            <p>Manage student fees, payments and pending balances.</p>
            <span class="fees-hero-icon">&#8377;</span>
        </div>


        <!-- SUMMARY CARDS -->

        <div class="fees-stats">

            <div class="fee-stat">
                <div class="fee-stat-top">
                    <span class="fee-stat-label">Total Fees</span>
                    <span class="fee-stat-icon icon-purple">&#8377;</span>
                </div>
                <h2>
                    <asp:Label ID="lblTotalFees" runat="server" Text="₹ 0" />
                </h2>
                <small>Total fees assigned to students</small>
            </div>

            <div class="fee-stat">
                <div class="fee-stat-top">
                    <span class="fee-stat-label">Collected Fees</span>
                    <span class="fee-stat-icon icon-green">&#10003;</span>
                </div>
                <h2>
                    <asp:Label ID="lblCollectedFees" runat="server" Text="₹ 0" />
                </h2>
                <small>Total payments received</small>
            </div>

            <div class="fee-stat">
                <div class="fee-stat-top">
                    <span class="fee-stat-label">Pending Fees</span>
                    <span class="fee-stat-icon icon-orange">&#9203;</span>
                </div>
                <h2>
                    <asp:Label ID="lblPendingFees" runat="server" Text="₹ 0" />
                </h2>
                <small>Remaining fees to be collected</small>
            </div>

        </div>


        <!-- ADD FEE FORM -->

        <div class="fees-card">

            <div class="fees-card-header">
                <div>
                    <h3>Add Fee Record</h3>
                    <p>Enter student fee and payment details.</p>
                </div>
            </div>

            <div class="fees-form-grid">

                <div class="fees-field">
                    <label>Student ID</label>
                    <asp:TextBox ID="txtStudentId" runat="server"
                        CssClass="fees-input"
                        placeholder="Enter student ID" />
                </div>

                <div class="fees-field">
                    <label>Academic Year</label>
                    <asp:DropDownList ID="ddlAcademicYear" runat="server"
                        CssClass="fees-input">
                        <asp:ListItem Text="Select Academic Year" Value="" />
                        <asp:ListItem Text="2026-2027" Value="2026-2027" />
                        <asp:ListItem Text="2027-2028" Value="2027-2028" />
                    </asp:DropDownList>
                </div>

                <div class="fees-field">
                    <label>Total Fees (₹)</label>
                    <asp:TextBox ID="txtTotalFees" runat="server"
                        CssClass="fees-input"
                        TextMode="Number"
                        placeholder="Enter total fees" />
                </div>

                <div class="fees-field">
                    <label>Paid Amount (₹)</label>
                    <asp:TextBox ID="txtPaidAmount" runat="server"
                        CssClass="fees-input"
                        TextMode="Number"
                        placeholder="Enter paid amount" />
                </div>

                <div class="fees-field">
                    <label>Payment Date</label>
                    <asp:TextBox ID="txtPaymentDate" runat="server"
                        CssClass="fees-input"
                        TextMode="Date" />
                </div>

                <div class="fees-field">
                    <label>Payment Method</label>
                    <asp:DropDownList ID="ddlPaymentMethod" runat="server"
                        CssClass="fees-input">
                        <asp:ListItem Text="Select Payment Method" Value="" />
                        <asp:ListItem Text="Cash" Value="Cash" />
                        <asp:ListItem Text="UPI" Value="UPI" />
                        <asp:ListItem Text="Bank Transfer" Value="Bank Transfer" />
                        <asp:ListItem Text="Cheque" Value="Cheque" />
                    </asp:DropDownList>
                </div>

                <div class="fees-field">
                    <label>Payment Status</label>
                    <asp:DropDownList ID="ddlPaymentStatus" runat="server"
                        CssClass="fees-input">
                        <asp:ListItem Text="Select Status" Value="" />
                        <asp:ListItem Text="Paid" Value="Paid" />
                        <asp:ListItem Text="Partial" Value="Partial" />
                        <asp:ListItem Text="Pending" Value="Pending" />
                    </asp:DropDownList>
                </div>

                <div class="fees-field">
                    <label>Remarks</label>
                    <asp:TextBox ID="txtRemarks" runat="server"
                        CssClass="fees-input"
                        placeholder="Enter remarks (optional)" />
                </div>

            </div>

            <div class="fees-actions">

                <asp:Button ID="btnSave" runat="server"
                    Text="Save Record"
                    CssClass="fees-btn fees-btn-primary"
                    OnClick="btnSave_Click" />

                <asp:Button ID="btnUpdate" runat="server"
                    Text="Update Record"
                    CssClass="fees-btn fees-btn-green"
                    OnClick="btnUpdate_Click" />

                <asp:Button ID="btnClear" runat="server"
                    Text="Clear Form"
                    CssClass="fees-btn fees-btn-light"
                    CausesValidation="false"
                    OnClick="btnClear_Click" />

            </div>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="fees-message" />

        </div>


        <!-- FEE RECORDS -->

        <div class="fees-card">

            <div class="fees-card-header">
                <div>
                    <h3>Fee Records</h3>
                    <p>Search and manage student payment records.</p>
                </div>
            </div>

            <div class="fees-search">
                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="fees-input"
                    placeholder="Search by Student ID..." />

                <asp:Button ID="btnSearch" runat="server"
                    Text="Search"
                    CssClass="fees-btn fees-btn-primary"
                    CausesValidation="false"
                    OnClick="btnSearch_Click" />
            </div>

            <br />

            <div class="fees-table-wrap">

            <%--    <asp:GridView ID="gvFees" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="fees-table"
                    GridLines="None"
                    EmptyDataText="No fee records found."
                    DataKeyNames="FeeId"
                    OnRowCommand="gvFees_RowCommand">--%>
                <asp:GridView ID="gvFees" runat="server"
    AutoGenerateColumns="False"
    CssClass="fees-table"
    DataKeyNames="FeeId"
    OnRowCommand="gvFees_RowCommand" OnSelectedIndexChanged="gvFees_SelectedIndexChanged">

                    <Columns>

                        <asp:BoundField DataField="FeeId"
                            HeaderText="Fee ID" />

                        <asp:BoundField DataField="StudentId"
                            HeaderText="Student ID" />

                        <asp:BoundField DataField="AcademicYear"
                            HeaderText="Academic Year" />

                        <asp:BoundField DataField="TotalFees"
                            HeaderText="Total Fees" />

                        <asp:BoundField DataField="PaidAmount"
                            HeaderText="Paid Amount" />

                        <asp:BoundField DataField="PaymentDate"
                            HeaderText="Payment Date"
                            DataFormatString="{0:dd-MM-yyyy}" />

                        <asp:BoundField DataField="PaymentStatus"
                            HeaderText="Status" />

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server"
                                    Text="Edit"
                                    CommandName="EditFee"
                                    CommandArgument='<%# Eval("FeeId") %>'
                                    CausesValidation="false" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

            <p class="fees-footer-note">
                Note: Fee summary and records will display after database
                connectivity and backend code are added.
            </p>

        </div>

    </div>

</asp:Content>
