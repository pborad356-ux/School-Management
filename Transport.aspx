<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transport.aspx.cs" Inherits="SchoolManagement.Transport" %>--%>


<%@ Page Title="Transport Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transport.aspx.cs" Inherits="SchoolManagement.Transport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.transport-page { padding: 6px; color: #1e293b; }

.transport-hero {
    padding: 32px;
    border-radius: 24px;
    color: white;
    background: linear-gradient(120deg, #4938d5, #6265ed, #1199b5);
    box-shadow: 0 15px 30px rgba(79, 70, 229, .20);
    margin-bottom: 25px;
}

.transport-hero h1 { margin: 0 0 10px; font-size: 30px; }
.transport-hero p { margin: 0; opacity: .9; }
.transport-stats {
    display: grid; grid-template-columns: repeat(3,minmax(0,1fr));
    gap: 20px; margin-bottom: 25px;
}
.transport-stat {
    background: white; padding: 23px; border-radius: 20px;
    box-shadow: 0 8px 22px rgba(15,23,42,.07);
    border: 1px solid #e7ebf3;
}
.transport-stat i {
    font-size: 23px;
    color: #5145cd;
}.transport-stat h2 { margin: 14px 0 5px; font-size: 28px; }
.transport-stat p { margin: 0; color: #64748b; }
.transport-card {
    background: white; padding: 28px; border-radius: 22px;
    border: 1px solid #e5eaf3;
    box-shadow: 0 8px 22px rgba(15,23,42,.06);
    margin-bottom: 25px;
}
.transport-card h2 { margin: 0 0 8px; font-size: 23px; }
.transport-sub { color: #64748b; margin: 0 0 22px; }
.transport-form {
    display: grid; grid-template-columns: repeat(2,minmax(0,1fr));
    gap: 19px;
}
.transport-field { display: flex; flex-direction: column; gap: 8px; }
.transport-field label { font-weight: 600; font-size: 14px; }
.transport-input {
    width: 100%; box-sizing: border-box; padding: 13px 14px;
    border: 1px solid #dbe3f0; border-radius: 12px;
    background: #f9fbff; color: #1e293b; font: inherit;
}
.transport-input:focus {
    outline: none; border-color: #0d9488;
    box-shadow: 0 0 0 3px rgba(13,148,136,.12);
}
.transport-actions { display: flex; flex-wrap: wrap; gap: 12px; margin-top: 22px; }
.transport-btn {
    border: 0; border-radius: 11px; padding: 12px 21px;
    color: white; background: #0d9488; cursor: pointer;
    font-weight: 600; transition: .2s;
}
.transport-btn:hover { transform: translateY(-2px); box-shadow: 0 7px 15px #0d948835; }
.transport-btn.update { background: #2563eb; }
.transport-btn.clear { background: #64748b; }
.transport-search { display: flex; gap: 12px; margin-bottom: 20px; }
.transport-grid { width: 100%; border-collapse: collapse; }
.transport-grid th {
    background: #ecfdf5; color: #334155; padding: 14px 10px;
    text-align: left; white-space: nowrap;
}
.transport-grid td { padding: 13px 10px; border-bottom: 1px solid #e8edf5; }
.transport-message { display: block; margin-top: 16px; font-weight: 600; }
.transport-table-wrap { overflow-x: auto; }
@media(max-width:800px) {
    .transport-stats { grid-template-columns: 1fr; }
    .transport-form { grid-template-columns: 1fr; }
    .transport-card { padding: 18px; }
    .transport-hero { padding: 24px; }
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="transport-page">

    <div class="transport-hero">
        <h1><i class="fa-solid fa-bus"></i> Transport Management</h1>
        <p>Manage school buses, routes, drivers and transport details.</p>
    </div>

    <div class="transport-stats">
        <div class="transport-stat">
            <i class="fa-solid fa-bus-simple"></i>
            <h2><asp:Label ID="lblTotalBuses" runat="server" Text="0" /></h2>
            <p>Total Buses</p>
        </div>
        <div class="transport-stat">
            <i class="fa-solid fa-route"></i>
            <h2><asp:Label ID="lblTotalRoutes" runat="server" Text="0" /></h2>
            <p>Total Routes</p>
        </div>
        <div class="transport-stat">
            <i class="fa-solid fa-users"></i>
            <h2><asp:Label ID="lblTotalCapacity" runat="server" Text="0" /></h2>
            <p>Total Bus Capacity</p>
        </div>
    </div>

    <div class="transport-card">
        <h2><i class="fa-solid fa-pen-to-square"></i> Add Transport Record</h2>
        <p class="transport-sub">Enter bus, route and driver information.</p>

        <div class="transport-form">
            <div class="transport-field">
                <label>Bus Number</label>
                <asp:TextBox ID="txtBusNumber" runat="server"
                    CssClass="transport-input" placeholder="e.g. GJ03AB1234" />
            </div>

            <div class="transport-field">
                <label>Route Name</label>
                <asp:TextBox ID="txtRouteName" runat="server"
                    CssClass="transport-input" placeholder="Enter route name" />
            </div>

            <div class="transport-field">
                <label>Driver Name</label>
                <asp:TextBox ID="txtDriverName" runat="server"
                    CssClass="transport-input" placeholder="Enter driver name" />
            </div>

            <div class="transport-field">
                <label>Driver Contact Number</label>
                <asp:TextBox ID="txtDriverContact" runat="server"
                    TextMode="Phone" CssClass="transport-input"
                    placeholder="Enter contact number" />
            </div>

            <div class="transport-field">
                <label>Bus Capacity</label>
                <asp:TextBox ID="txtCapacity" runat="server"
                    TextMode="Number" CssClass="transport-input"
                    placeholder="Enter seat capacity" />
            </div>

            <div class="transport-field">
                <label>Pickup Point</label>
                <asp:TextBox ID="txtPickupPoint" runat="server"
                    CssClass="transport-input" placeholder="Enter pickup point" />
            </div>

            <div class="transport-field">
                <label>Departure Time</label>
                <asp:TextBox ID="txtDepartureTime" runat="server"
                    TextMode="Time" CssClass="transport-input" />
            </div>

            <div class="transport-field">
                <label>Arrival Time</label>
                <asp:TextBox ID="txtArrivalTime" runat="server"
                    TextMode="Time" CssClass="transport-input" />
            </div>

            <div class="transport-field">
                <label>Transport Fee</label>
                <asp:TextBox ID="txtTransportFee" runat="server"
                    TextMode="Number" CssClass="transport-input"
                    placeholder="Enter fee amount" />
            </div>

            <div class="transport-field">
                <label>Status</label>
                <asp:DropDownList ID="ddlTransportStatus" runat="server"
                    CssClass="transport-input">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                    <asp:ListItem>Under Maintenance</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="transport-actions">
            <asp:Button ID="btnSave" runat="server" Text="Save Transport"
                CssClass="transport-btn" OnClick="btnSave_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update Transport"
                CssClass="transport-btn update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear"
                CssClass="transport-btn clear" OnClick="btnClear_Click"
                CausesValidation="false" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="transport-message" />
    </div>

    <div class="transport-card">
        <h2><i class="fa-solid fa-list"></i> Transport Records</h2>
        <p class="transport-sub">Search and view registered transport details.</p>

        <div class="transport-search">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="transport-input"
                placeholder="Search by bus number, route or driver..." />
            <asp:Button ID="btnSearch" runat="server" Text="Search"
                CssClass="transport-btn" OnClick="btnSearch_Click"
                CausesValidation="false" />
        </div>

        <div class="transport-table-wrap">
            <asp:GridView ID="gvTransport" runat="server"
                AutoGenerateColumns="False" CssClass="transport-grid"
                GridLines="None" DataKeyNames="TransportId"
                EmptyDataText="No transport records found."
                OnRowCommand="gvTransport_RowCommand">
                <Columns>
                    <asp:BoundField DataField="TransportId" HeaderText="ID" />
                    <asp:BoundField DataField="BusNumber" HeaderText="Bus Number" />
                    <asp:BoundField DataField="RouteName" HeaderText="Route" />
                    <asp:BoundField DataField="DriverName" HeaderText="Driver" />
                    <asp:BoundField DataField="DriverContact" HeaderText="Contact" />
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                    <asp:BoundField DataField="PickupPoint" HeaderText="Pickup Point" />
                    <asp:BoundField DataField="TransportFee" HeaderText="Transport Fee"
                        DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:ButtonField Text="Edit" CommandName="EditTransport"
                        ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>

