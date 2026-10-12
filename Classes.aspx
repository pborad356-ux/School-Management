<%--<%@ Page Title="Classes Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="SchoolManagement.Classes" %>--%>
<%@ Page Title="Classes Management"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Classes.aspx.cs"
    Inherits="SchoolManagement.Classes"
    UnobtrusiveValidationMode="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">--%>

    <style>

        /* ========================================
           CLASSES PAGE - PREMIUM 3D DESIGN
        ======================================== */

        /* Main page spacing */
        #MainContent > div[style*="flex-direction"] {
            position: relative;
            z-index: 1;
        }


        /* ========================================
           ALERT MESSAGE
        ======================================== */

        .alert-box {
            position: relative;
            z-index: 5;

            padding: 15px 20px;
            margin-bottom: 25px;

            border-radius: 14px;

            font-size: 14px;
            font-weight: 600;

            animation: alertSlide .4s ease;

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

        @keyframes alertSlide {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }


        /* ========================================
           CLASS CARDS
        ======================================== */

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
            transform: translateY(-4px);

            box-shadow:
                0 25px 55px rgba(15,23,42,.14),
                0 8px 20px rgba(15,23,42,.07),
                inset 0 1px 0 rgba(255,255,255,1);
        }


        /* ========================================
           CARD HEADER
        ======================================== */

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

            border-bottom: 1px solid rgba(148,163,184,.16);

            position: relative;
        }


        /* Header top shine */

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


        /* ========================================
           CARD BODY
        ======================================== */

        .card-body {
            padding: 25px;
        }


        /* ========================================
           FORM GROUP
        ======================================== */

        .form-group {
            margin-bottom: 5px;
        }


        .form-label {
            display: block;

            margin-bottom: 9px;

            color: #334155;

            font-size: 13px;
            font-weight: 700;

            letter-spacing: .2px;
        }


        /* ========================================
           CLASS NAME INPUT
        ======================================== */

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
                border-color .25s ease,
                box-shadow .25s ease,
                transform .25s ease;
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


        .form-control::placeholder {
            color: #94a3b8;
        }


        /* ========================================
           VALIDATION
        ======================================== */

        .form-group span {
            display: block;

            margin-top: 6px;

            font-size: 12px;
            font-weight: 600;
        }


        /* ========================================
           BUTTON GROUP
        ======================================== */

        .btn-group {
            display: flex;

            gap: 12px;

            margin-top: 22px;
        }


        /* ========================================
           COMMON BUTTON
        ======================================== */

        .btn {
            min-height: 45px;

            padding: 10px 20px;

            border: none;

            border-radius: 11px;

            font-family: inherit;

            font-size: 14px;
            font-weight: 700;

            cursor: pointer;

            transition:
                transform .25s ease,
                box-shadow .25s ease;
        }


        /* ========================================
           SAVE BUTTON
        ======================================== */

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
                    rgba(255,255,255,.22),
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

            box-shadow:
                0 5px 12px rgba(99,102,241,.25);
        }


        /* ========================================
           CLEAR BUTTON
        ======================================== */

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
            transform: translateY(-3px);

            color: #1e293b;

            background: #ffffff;

            box-shadow:
                0 11px 22px rgba(15,23,42,.12),
                inset 0 1px 0 #ffffff;
        }


        /* ========================================
           CLASS TABLE
        ======================================== */

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

            background: rgba(255,255,255,.95);

            font-size: 14px;
        }


        /* ========================================
           TABLE HEADER
        ======================================== */

        .grid-view th {
            padding: 15px 16px;

            color: white;

            text-align: left;

            font-size: 12px;
            font-weight: 800;

            text-transform: uppercase;

            letter-spacing: .6px;

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

            text-align: center;
        }


        /* ========================================
           TABLE DATA
        ======================================== */

        .grid-view td {
            padding: 15px 16px;

            color: #475569;

            font-size: 14px;
            font-weight: 500;

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


        /* ========================================
           ACTION BUTTONS
        ======================================== */

        .grid-view td:last-child {
            text-align: center;
            white-space: nowrap;
        }


        .grid-view a {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            min-height: 33px;

            padding: 6px 11px;

            margin: 2px;

            border-radius: 8px;

            text-decoration: none;

            font-size: 12px;
            font-weight: 700;

            transition:
                all .2s ease;
        }


        /* Edit */

        .grid-view a:first-child {
            color: #4f46e5;

            background: #eef2ff;

            border: 1px solid #c7d2fe;

            box-shadow:
                0 3px 7px rgba(79,70,229,.08);
        }


        .grid-view a:first-child:hover {
            color: white;

            background: #4f46e5;

            border-color: #4f46e5;

            transform: translateY(-2px);

            box-shadow:
                0 6px 13px rgba(79,70,229,.25);
        }


        /* Delete */

        .grid-view a:last-child {
            color: #dc2626;

            background: #fef2f2;

            border: 1px solid #fecaca;

            box-shadow:
                0 3px 7px rgba(220,38,38,.06);
        }


        .grid-view a:last-child:hover {
            color: white;

            background: #dc2626;

            border-color: #dc2626;

            transform: translateY(-2px);

            box-shadow:
                0 6px 13px rgba(220,38,38,.22);
        }


        /* ========================================
           EMPTY DATA
        ======================================== */

        .grid-view div {
            color: #64748b !important;

            font-size: 14px;

            font-weight: 600;
        }


        /* ========================================
           RESPONSIVE
        ======================================== */

        @media (max-width: 700px) {

            #MainContent > div[style*="flex-direction"] {
                gap: 20px !important;
            }


            .card {
                max-width: 100% !important;

                border-radius: 18px;
            }


            .card-header {
                padding: 14px 17px;

                font-size: 15px;
            }


            .card-body {
                padding: 18px;
            }


            .btn-group {
                flex-direction: column;
            }


            .btn {
                width: 100%;
            }


            .grid-view {
                min-width: 500px;
            }


            .table-container {
                overflow-x: auto;
            }
        }


        @media (max-width: 450px) {

            .card-body {
                padding: 15px;
            }


            .card-header {
                min-height: 58px;

                font-size: 14px;
            }


            .form-control {
                min-height: 44px;
            }


            .grid-view th,
            .grid-view td {
                padding: 12px 10px;
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

    <div style="display: flex; flex-direction: column; gap: 30px;">
        <!-- Add Class Form -->
        <div class="card" style="max-width: 500px;">
            <div class="card-header">
                <span><i class="fa-solid fa-school"></i> <asp:Label ID="lblFormTitle" runat="server" Text="Add New Class"></asp:Label></span>
            </div>
            <div class="card-body">
                <!-- Hidden field for ClassId -->
                <asp:HiddenField ID="hfClassId" runat="server" />

                <div class="form-group">
                    <label class="form-label">Class Name *</label>
                    <asp:TextBox ID="txtClassName" runat="server" CssClass="form-control" placeholder="e.g. BCA Sem 5 or Class 10-A"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvClassName" runat="server" ControlToValidate="txtClassName" ErrorMessage="Class name is required" ForeColor="#ef4444" Display="Dynamic" ValidationGroup="ClassVal"></asp:RequiredFieldValidator>
                </div>

                <div class="btn-group">
                    <asp:Button ID="btnSave" runat="server" Text="Save Class" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="ClassVal" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary" OnClick="btnClear_Click" CausesValidation="false" />
                </div>
            </div>
        </div>

        <!-- Class List Grid -->
        <div class="card" style="max-width: 600px;">
            <div class="card-header">
                <span><i class="fa-solid fa-list"></i> Available Classes</span>
            </div>
            <div class="card-body">
                <div class="table-container">
                  
<asp:GridView ID="gvClasses" runat="server"
    AutoGenerateColumns="False"
    CssClass="grid-view"
    DataKeyNames="ClassId"
    OnRowCommand="gvClasses_RowCommand">

    <Columns>
        <asp:BoundField DataField="ClassName" HeaderText="Class Name" />

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>

                <asp:LinkButton ID="lnkEdit" runat="server"
                    CommandName="EditClass"
                    CommandArgument='<%# Eval("ClassId") %>'
                    Text="<i class='fa-solid fa-pen-to-square'></i> Edit"
                    CausesValidation="false">
                </asp:LinkButton>

                <asp:LinkButton ID="lnkDelete" runat="server"
                    CommandName="DeleteClass"
                    CommandArgument='<%# Eval("ClassId") %>'
                    Text="<i class='fa-solid fa-trash'></i> Delete"
                    OnClientClick="return confirm('Are you sure you want to delete this class?');"
                    CausesValidation="false">
                </asp:LinkButton>

            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

    <EmptyDataTemplate>
        <div style="padding:20px; text-align:center;">
            No classes have been registered yet.
        </div>
    </EmptyDataTemplate>

</asp:GridView>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
