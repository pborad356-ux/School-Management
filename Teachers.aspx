<%--<%@ Page Title="Teachers Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs" Inherits="SchoolManagement.Teachers" %>--%>
<%@ Page Title="Teachers Management"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Teachers.aspx.cs"
    Inherits="SchoolManagement.Teachers"
    UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>

    /* =========================================
       SCHOOL MANAGEMENT
       TEACHERS MANAGEMENT - PROFESSIONAL 6D UI
       ========================================= */

    /* ---------- PAGE BACKGROUND ---------- */

    #MainContent {
        position: relative;
    }

    #MainContent::before {
        content: "";
        position: fixed;

        width: 320px;
        height: 320px;

        top: 90px;
        right: -150px;

        border-radius: 50%;

        background: rgba(99, 102, 241, 0.10);

        filter: blur(5px);

        pointer-events: none;
        z-index: -1;
    }

    #MainContent::after {
        content: "";
        position: fixed;

        width: 280px;
        height: 280px;

        bottom: -120px;
        left: -120px;

        border-radius: 50%;

        background: rgba(14, 165, 233, 0.10);

        filter: blur(5px);

        pointer-events: none;
        z-index: -1;
    }


    /* =========================================
       ALERT MESSAGE
       ========================================= */

    .alert-box {
        padding: 14px 18px;

        margin-bottom: 22px;

        border-radius: 14px;

        font-size: 14px;
        font-weight: 600;

        border: 1px solid transparent;

        box-shadow:
            0 8px 20px rgba(15, 23, 42, 0.08),
            inset 0 1px 0 rgba(255, 255, 255, 0.7);

        animation: alertSlide 0.35s ease;
    }

    .alert-success {
        background: linear-gradient(
            135deg,
            #ecfdf5,
            #f0fdf4
        );

        color: #15803d;

        border-color: #bbf7d0;
    }

    @keyframes alertSlide {
        from {
            opacity: 0;
            transform: translateY(-8px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }


    /* =========================================
       MAIN CARDS
       ========================================= */

    .card {
        position: relative;

        margin-bottom: 28px;

        background: rgba(255, 255, 255, 0.82);

        backdrop-filter: blur(18px);
        -webkit-backdrop-filter: blur(18px);

        border: 1px solid rgba(255, 255, 255, 0.9);

        border-radius: 22px;

        overflow: hidden;

        box-shadow:
            0 22px 50px rgba(15, 23, 42, 0.10),
            0 8px 20px rgba(79, 70, 229, 0.06),
            inset 0 1px 0 rgba(255, 255, 255, 0.95);

        transition: all 0.3s ease;
    }

    .card:hover {
        transform: translateY(-3px);

        box-shadow:
            0 30px 65px rgba(15, 23, 42, 0.13),
            0 12px 25px rgba(79, 70, 229, 0.08),
            inset 0 1px 0 rgba(255, 255, 255, 1);
    }


    /* =========================================
       CARD HEADER
       ========================================= */

    .card-header {
        min-height: 68px;

        padding: 17px 22px;

        display: flex;

        align-items: center;

        justify-content: space-between;

        gap: 20px;

        background:
            linear-gradient(
                135deg,
                rgba(79, 70, 229, 0.08),
                rgba(14, 165, 233, 0.06)
            );

        border-bottom: 1px solid rgba(148, 163, 184, 0.16);

        color: #1e293b;

        font-size: 17px;

        font-weight: 750;
    }

    .card-header i {
        margin-right: 8px;

        color: #4f46e5;

        filter:
            drop-shadow(
                0 3px 5px rgba(79, 70, 229, 0.20)
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

        gap: 20px 22px;

        margin-bottom: 22px;
    }


    /* =========================================
       FORM GROUP
       ========================================= */

    .form-group {
        position: relative;
    }


    /* =========================================
       FORM LABEL
       ========================================= */

    .form-label {
        display: block;

        margin-bottom: 8px;

        color: #334155;

        font-size: 13px;

        font-weight: 700;

        letter-spacing: 0.2px;
    }


    /* =========================================
       INPUT BOX
       ========================================= */

    .form-control {
        width: 100%;

        height: 48px;

        padding: 0 15px;

        border-radius: 13px;

        border: 1px solid #dbe3f0;

        background: rgba(248, 250, 252, 0.92);

        color: #1e293b;

        font-family: "Segoe UI", Arial, sans-serif;

        font-size: 14px;

        outline: none;

        box-shadow:
            inset 3px 3px 7px rgba(148, 163, 184, 0.10),
            inset -3px -3px 7px rgba(255, 255, 255, 0.95),
            0 2px 5px rgba(15, 23, 42, 0.035);

        transition:
            border-color 0.25s ease,
            box-shadow 0.25s ease,
            transform 0.25s ease,
            background 0.25s ease;
    }

    .form-control::placeholder {
        color: #94a3b8;
    }

    .form-control:hover {
        border-color: #c7d2fe;

        background: #ffffff;

        box-shadow:
            inset 2px 2px 5px rgba(148, 163, 184, 0.08),
            inset -2px -2px 5px rgba(255, 255, 255, 1),
            0 5px 14px rgba(79, 70, 229, 0.06);
    }

    .form-control:focus {
        border-color: #6366f1;

        background: #ffffff;

        transform: translateY(-1px);

        box-shadow:
            0 0 0 4px rgba(99, 102, 241, 0.09),
            0 8px 20px rgba(79, 70, 229, 0.10),
            inset 0 1px 2px rgba(255, 255, 255, 1);
    }


    /* =========================================
       VALIDATION
       ========================================= */

    .form-group span {
        display: block;

        margin-top: 5px;

        font-size: 12px;

        font-weight: 600;
    }


    /* =========================================
       BUTTON GROUP
       ========================================= */

    .btn-group {
        display: flex;

        align-items: center;

        gap: 12px;

        padding-top: 4px;
    }


    /* =========================================
       ALL BUTTONS
       ========================================= */

    .btn {
        min-width: 145px;

        height: 45px;

        padding: 0 20px;

        border: none;

        border-radius: 12px;

        font-family: "Segoe UI", Arial, sans-serif;

        font-size: 13px;

        font-weight: 700;

        cursor: pointer;

        transition: all 0.2s ease;
    }


    /* =========================================
       PRIMARY BUTTON
       ========================================= */

    .btn-primary {
        background:
            linear-gradient(
                135deg,
                #4f46e5,
                #6366f1 50%,
                #0ea5e9
            );

        color: #ffffff;

        box-shadow:
            0 9px 18px rgba(79, 70, 229, 0.23),
            0 4px 0 rgba(49, 46, 129, 0.32),
            inset 0 1px 0 rgba(255, 255, 255, 0.35);
    }

    .btn-primary:hover {
        transform: translateY(-3px);

        box-shadow:
            0 14px 25px rgba(79, 70, 229, 0.30),
            0 5px 0 rgba(49, 46, 129, 0.28),
            inset 0 1px 0 rgba(255, 255, 255, 0.40);
    }

    .btn-primary:active {
        transform: translateY(1px);

        box-shadow:
            0 5px 10px rgba(79, 70, 229, 0.18),
            0 1px 0 rgba(49, 46, 129, 0.30);
    }


    /* =========================================
       SECONDARY BUTTON
       ========================================= */

    .btn-secondary {
        background: #f1f5f9;

        color: #475569;

        border: 1px solid #e2e8f0;

        box-shadow:
            0 5px 12px rgba(15, 23, 42, 0.07),
            inset 0 1px 0 #ffffff;
    }

    .btn-secondary:hover {
        background: #e2e8f0;

        color: #1e293b;

        transform: translateY(-2px);

        box-shadow:
            0 9px 18px rgba(15, 23, 42, 0.10);
    }


    /* =========================================
       SEARCH BOX
       ========================================= */

    .search-container {
        width: 250px;
    }

    .search-container .form-control {
        height: 42px;

        border-radius: 11px;

        background: rgba(255, 255, 255, 0.90);
    }


    /* =========================================
       TABLE CONTAINER
       ========================================= */

    .table-container {
        width: 100%;

        overflow-x: auto;

        border-radius: 15px;

        box-shadow:
            0 5px 15px rgba(15, 23, 42, 0.05);
    }


    /* =========================================
       GRIDVIEW
       ========================================= */

    .grid-view {
        width: 100%;

        border-collapse: separate;

        border-spacing: 0;

        background: rgba(255, 255, 255, 0.95);

        overflow: hidden;
    }


    /* ---------- TABLE HEADER ---------- */

    .grid-view th {
        padding: 15px 14px;

        background:
            linear-gradient(
                135deg,
                #312e81,
                #4f46e5,
                #0284c7
            );

        color: #ffffff;

        font-size: 12px;

        font-weight: 700;

        text-align: left;

        white-space: nowrap;

        border: none;
    }


    /* ---------- TABLE DATA ---------- */

    .grid-view td {
        padding: 14px;

        background: rgba(255, 255, 255, 0.92);

        color: #334155;

        font-size: 13px;

        border-bottom: 1px solid #e8edf4;

        vertical-align: middle;
    }


    /* ---------- TABLE ROW ---------- */

    .grid-view tr {
        transition: all 0.2s ease;
    }

    .grid-view tbody tr:hover td {
        background: #f5f7ff;

        color: #1e293b;
    }


    /* =========================================
       ACTION BUTTONS
       ========================================= */

    .grid-view td a {
        display: inline-flex;

        align-items: center;

        gap: 5px;

        padding: 7px 11px;

        margin-right: 5px;

        border-radius: 8px;

        font-size: 12px;

        font-weight: 700;

        text-decoration: none;

        transition: all 0.2s ease;
    }


    /* ---------- EDIT ---------- */

    .grid-view td a:first-child {
        background: #eef2ff;

        color: #4f46e5;

        border: 1px solid #e0e7ff;

        box-shadow:
            0 3px 8px rgba(79, 70, 229, 0.08);
    }

    .grid-view td a:first-child:hover {
        background: #4f46e5;

        color: #ffffff;

        transform: translateY(-2px);

        box-shadow:
            0 7px 14px rgba(79, 70, 229, 0.20);
    }


    /* ---------- DELETE ---------- */

    .grid-view td a:last-child {
        background: #fff1f2;

        color: #e11d48;

        border: 1px solid #ffe4e6;

        box-shadow:
            0 3px 8px rgba(225, 29, 72, 0.07);
    }

    .grid-view td a:last-child:hover {
        background: #e11d48;

        color: #ffffff;

        transform: translateY(-2px);

        box-shadow:
            0 7px 14px rgba(225, 29, 72, 0.18);
    }


    /* =========================================
       PAGINATION
       ========================================= */

    .pager {
        padding: 15px !important;

        text-align: center;

        background: #f8fafc;
    }

    .pager a,
    .pager span {
        display: inline-block;

        min-width: 34px;

        padding: 7px 10px;

        margin: 2px;

        border-radius: 8px;

        font-size: 12px;

        font-weight: 700;

        text-decoration: none;
    }

    .pager a {
        background: #eef2ff;

        color: #4f46e5;
    }

    .pager a:hover {
        background: #4f46e5;

        color: white;
    }

    .pager span {
        background: #4f46e5;

        color: white;

        box-shadow:
            0 4px 10px rgba(79, 70, 229, 0.20);
    }


    /* =========================================
       EMPTY DATA
       ========================================= */

    .grid-view .empty-data {
        padding: 30px;

        text-align: center;

        color: #64748b;
    }


    /* =========================================
       RESPONSIVE
       ========================================= */

    @media (max-width: 900px) {

        .form-grid {
            grid-template-columns: 1fr;
        }

        .card-header {
            align-items: flex-start;

            flex-direction: column;
        }

        .search-container {
            width: 100%;

            max-width: none !important;
        }
    }


    @media (max-width: 600px) {

        .card {
            border-radius: 17px;

            margin-bottom: 20px;
        }

        .card-header {
            padding: 15px 17px;

            font-size: 15px;
        }

        .card-body {
            padding: 17px;
        }

        .form-grid {
            gap: 17px;
        }

        .btn-group {
            flex-direction: column;

            align-items: stretch;
        }

        .btn {
            width: 100%;
        }

        .table-container {
            overflow-x: auto;
        }

        .grid-view {
            min-width: 750px;
        }
    }

</style>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Alert Message Banner -->
    <asp:Panel ID="pnlAlert" runat="server" CssClass="alert-box alert-success" Visible="false">
        <asp:Label ID="lblAlertMsg" runat="server"></asp:Label>
    </asp:Panel>

    <!-- Teacher Input Form -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-user-plus"></i> <asp:Label ID="lblFormTitle" runat="server" Text="Add New Teacher"></asp:Label></span>
        </div>
        <div class="card-body">
            <!-- Hidden field for TeacherId during edit -->
            <asp:HiddenField ID="hfTeacherId" runat="server" />

            <div class="form-grid">
                <div class="form-group">
                    <label class="form-label">Full Name *</label>
<%--                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="e.g. Dr. Amit Mehta" OnTextChanged="txtFullName_TextChanged"></asp:TextBox>--%>
             <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="e.g. Dr. Amit Mehta"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Name is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="TeacherVal"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="e.g. amit@example.com"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email address" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="TeacherVal"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label class="form-label">Mobile Number</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="e.g. 9876543210"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Specialization / Subject</label>
                    <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control" placeholder="e.g. ASP.NET & C#"></asp:TextBox>
                </div>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnSave" runat="server" Text="Save Teacher" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="TeacherVal" />
                <asp:Button ID="btnClear" runat="server" Text="Clear Form" CssClass="btn btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
            </div>
        </div>
    </div>

    <!-- Teacher List Card -->
    <div class="card">
        <div class="card-header">
            <span><i class="fa-solid fa-list"></i> Teacher Registry</span>
            <!-- Search Control -->
            <div class="search-container" style="margin-bottom:0; max-width:250px;">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by name..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
            </div>
        </div>
        <div class="card-body">
            <div class="table-container">
                
<asp:GridView ID="gvTeachers" runat="server"
    AutoGenerateColumns="False"
    CssClass="grid-view"
    DataKeyNames="T_Id"
    OnRowCommand="gvTeachers_RowCommand"
    AllowPaging="True"
    PageSize="10"
    OnPageIndexChanging="gvTeachers_PageIndexChanging">

    <Columns>
        <asp:BoundField DataField="T_FullName" HeaderText="Teacher Name" />
        <asp:BoundField DataField="T_Email" HeaderText="Email Address" />
        <asp:BoundField DataField="T_Mobile" HeaderText="Mobile Number" />
        <asp:BoundField DataField="T_Specialization" HeaderText="Subject / Specialization" />

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="lnkEdit" runat="server"
                    CommandName="EditTeacher"
                    CommandArgument='<%# Eval("T_Id") %>'
                    Text="Edit"
                    CausesValidation="false">
                </asp:LinkButton>

                <asp:LinkButton ID="lnkDelete" runat="server"
                    CommandName="DeleteTeacher"
                    CommandArgument='<%# Eval("T_Id") %>'
                    Text="Delete"
                    OnClientClick="return confirm('Are you sure you want to delete this teacher?');"
                    CausesValidation="false">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

    <PagerStyle CssClass="pager" />
</asp:GridView>

            </div>
        </div>
    </div>
</asp:Content>
