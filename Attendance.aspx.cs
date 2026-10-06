using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Attendance : Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        private void LoadClasses()
        {
           
                   
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
        }

        private void LoadAttendanceSheet()
        {
            
        }

        protected void gvAttendance_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            
        }

        protected void btnSaveAttendance_Click(object sender, EventArgs e)
        {
           
                        
        }

        private void ShowAlert(string message, bool isSuccess)
        {
        }
    }
}
