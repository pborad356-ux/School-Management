<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notices.aspx.cs" Inherits="SchoolManagement.Notices" %>--%>
<%@ Page Title="Notice Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notices.aspx.cs" Inherits="SchoolManagement.Notices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.notice-page { padding: 6px; color: #1e293b; }
.notice-hero {
    padding: 32px; border-radius: 24px; color: white;
    background: linear-gradient(120deg,#4938d5,#6265ed,#1199b5);
    box-shadow: 0 15px 30px rgba(79,70,229,.20);
    margin-bottom: 25px;
}
.notice-hero h1 { margin: 0 0 10px; font-size: 30px; }
.notice-hero p { margin: 0; opacity: .9; }
.notice-stats {
    display: grid; grid-template-columns: repeat(3,minmax(0,1fr));
    gap: 20px; margin-bottom: 25px;
}
.notice-stat {
    background: #fff; padding: 23px; border-radius: 20px;
    box-shadow: 0 8px 22px rgba(15,23,42,.07);
    border: 1px solid #e7ebf3;
}
.notice-stat i { font-size: 23px; color: #5145cd; }
.notice-stat h2 { margin: 14px 0 5px; font-size: 28px; }
.notice-stat p { margin: 0; color: #64748b; }
.notice-card {
    background: white; padding: 28px; border-radius: 22px;
    border: 1px solid #e5eaf3;
    box-shadow: 0 8px 22px rgba(15,23,42,.06);
    margin-bottom: 25px;
}
.notice-card h2 { margin: 0 0 8px; font-size: 23px; }
.notice-sub { color: #64748b; margin: 0 0 22px; }
.notice-form {
    display: grid; grid-template-columns: repeat(2,minmax(0,1fr));
    gap: 19px;
}
.notice-field { display: flex; flex-direction: column; gap: 8px; }
.notice-field.full { grid-column: 1 / -1; }
.notice-field label { font-weight: 600; font-size: 14px; }
.notice-input {
    width: 100%; box-sizing: border-box; padding: 13px 14px;
    border: 1px solid #dbe3f0; border-radius: 12px;
    background: #f9fbff; color: #1e293b; font: inherit;
}
.notice-input:focus {
    outline: none; border-color: #6558e8;
    box-shadow: 0 0 0 3px rgba(101,88,232,.12);
}
.notice-actions { display: flex; flex-wrap: wrap; gap: 12px; margin-top: 22px; }
.notice-btn {
    border: 0; border-radius: 11px; padding: 12px 21px;
    color: white; background: #5145cd; cursor: pointer;
    font-weight: 600; transition: .2s;
}
.notice-btn:hover { transform: translateY(-2px); box-shadow: 0 7px 15px #5145cd35; }
.notice-btn.update { background: #0891b2; }
.notice-btn.clear { background: #64748b; }
.notice-search { display: flex; gap: 12px; margin-bottom: 20px; }
.notice-grid { width: 100%; border-collapse: collapse; }
.notice-grid th {
    background: #f1f5ff; color: #334155; padding: 14px 10px;
    text-align: left; white-space: nowrap;
}
.notice-grid td { padding: 13px 10px; border-bottom: 1px solid #e8edf5; }
.notice-message { display: block; margin-top: 16px; font-weight: 600; }
.notice-table-wrap { overflow-x: auto; }
@media(max-width:800px) {
    .notice-stats { grid-template-columns: 1fr; }
    .notice-form { grid-template-columns: 1fr; }
    .notice-field.full { grid-column: auto; }
    .notice-card { padding: 18px; }
    .notice-hero { padding: 24px; }
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="notice-page">

    <div class="notice-hero">
        <h1><i class="fa-solid fa-bullhorn"></i> Notice Management</h1>
        <p>Create and manage school announcements and important updates.</p>
    </div>

    <div class="notice-stats">
        <div class="notice-stat">
            <i class="fa-solid fa-bell"></i>
            <h2><asp:Label ID="lblTotalNotices" runat="server" Text="0" /></h2>
            <p>Total Notices</p>
        </div>
        <div class="notice-stat">
            <i class="fa-solid fa-calendar-check"></i>
            <h2><asp:Label ID="lblPublished" runat="server" Text="0" /></h2>
            <p>Published Notices</p>
        </div>
        <div class="notice-stat">
            <i class="fa-solid fa-users"></i>
            <h2><asp:Label ID="lblAudience" runat="server" Text="0" /></h2>
            <p>Audience Categories</p>
        </div>
    </div>

    <div class="notice-card">
        <h2><i class="fa-solid fa-pen-to-square"></i> Add Notice</h2>
        <p class="notice-sub">Enter the announcement details below.</p>

        <div class="notice-form">
            <div class="notice-field">
                <label>Notice Title</label>
                <asp:TextBox ID="txtNoticeTitle" runat="server"
                    CssClass="notice-input" placeholder="Enter notice title" />
            </div>

            <div class="notice-field">
                <label>Notice Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="notice-input">
                    <asp:ListItem Value="">Select Category</asp:ListItem>
                    <asp:ListItem>General</asp:ListItem>
                    <asp:ListItem>Examination</asp:ListItem>
                    <asp:ListItem>Holiday</asp:ListItem>
                    <asp:ListItem>Event</asp:ListItem>
                    <asp:ListItem>Urgent</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="notice-field">
                <label>Publish Date</label>
                <asp:TextBox ID="txtPublishDate" runat="server"
                    TextMode="Date" CssClass="notice-input" />
            </div>

            <div class="notice-field">
                <label>Audience</label>
                <asp:DropDownList ID="ddlAudience" runat="server" CssClass="notice-input">
                    <asp:ListItem Value="">Select Audience</asp:ListItem>
                    <asp:ListItem>All</asp:ListItem>
                    <asp:ListItem>Students</asp:ListItem>
                    <asp:ListItem>Teachers</asp:ListItem>
                    <asp:ListItem>Parents</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="notice-field">
                <label>Expiry Date (Optional)</label>
                <asp:TextBox ID="txtExpiryDate" runat="server"
                    TextMode="Date" CssClass="notice-input" />
            </div>

            <div class="notice-field">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="notice-input">
                    <asp:ListItem>Published</asp:ListItem>
                    <asp:ListItem>Draft</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="notice-field full">
                <label>Notice Description</label>
                <asp:TextBox ID="txtDescription" runat="server"
                    TextMode="MultiLine" Rows="4" CssClass="notice-input"
                    placeholder="Enter complete notice details..." />
            </div>
        </div>

        <div class="notice-actions">
            <asp:Button ID="btnSave" runat="server" Text="Save Notice"
                CssClass="notice-btn" OnClick="btnSave_Click" />
            <asp:Button ID="btnUpdate" runat="server" Text="Update Notice"
                CssClass="notice-btn update" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear"
                CssClass="notice-btn clear" OnClick="btnClear_Click"
                CausesValidation="false" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="notice-message" />
    </div>

    <div class="notice-card">
        <h2><i class="fa-solid fa-list"></i> Notice Records</h2>
        <p class="notice-sub">Search and view existing announcements.</p>

        <div class="notice-search">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="notice-input"
                placeholder="Search by title or category..." />
            <asp:Button ID="btnSearch" runat="server" Text="Search"
                CssClass="notice-btn" OnClick="btnSearch_Click"
                CausesValidation="false" />
        </div>

        <div class="notice-table-wrap">
            <asp:GridView ID="gvNotices" runat="server"
                AutoGenerateColumns="False" CssClass="notice-grid"
                GridLines="None" DataKeyNames="NoticeId"
                EmptyDataText="No notice records found."
                OnRowCommand="gvNotices_RowCommand">
                <Columns>
                    <asp:BoundField DataField="NoticeId" HeaderText="ID" />
                    <asp:BoundField DataField="NoticeTitle" HeaderText="Title" />
                    <asp:BoundField DataField="Category" HeaderText="Category" />
                    <asp:BoundField DataField="PublishDate" HeaderText="Publish Date"
                        DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Audience" HeaderText="Audience" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:ButtonField Text="Edit" CommandName="EditNotice"
                        ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>
