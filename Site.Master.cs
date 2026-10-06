using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace SchoolManagement
{
    public partial class Site : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    lblCurrentDate.Text = DateTime.Now.ToString("dd MMM yyyy, dddd");
                
            //    if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
            //    {
            //        lblUserFullName.Text = HttpContext.Current.User.Identity.Name;
            //    }
            //    else
            //    {
            //        lblUserFullName.Text = "Guest Admin";
            //    }
                
            //    HighlightActiveLink();
            //}
        }

        //private void HighlightActiveLink()
        //{
        //    string activePage = Request.Url.AbsolutePath.ToLower();
            
        //    lnkDashboard.CssClass = "sidebar-link";
        //    lnkStudents.CssClass = "sidebar-link";
        //    lnkTeachers.CssClass = "sidebar-link";
        //    lnkClasses.CssClass = "sidebar-link";
        //    lnkAttendance.CssClass = "sidebar-link";
            
        //    if (activePage.EndsWith("/default.aspx") || activePage.EndsWith("/default") || activePage.EndsWith("/"))
        //    {
        //        lnkDashboard.CssClass = "sidebar-link active";
        //    }
        //    else if (activePage.Contains("students.aspx") || activePage.Contains("/students"))
        //    {
        //        lnkStudents.CssClass = "sidebar-link active";
        //    }
        //    else if (activePage.Contains("teachers.aspx") || activePage.Contains("/teachers"))
        //    {
        //        lnkTeachers.CssClass = "sidebar-link active";
        //    }
        //    else if (activePage.Contains("classes.aspx") || activePage.Contains("/classes"))
        //    {
        //        lnkClasses.CssClass = "sidebar-link active";
        //    }
        //    else if (activePage.Contains("attendance.aspx") || activePage.Contains("/attendance"))
        //    {
        //        lnkAttendance.CssClass = "sidebar-link active";
        //    }
        //}

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
