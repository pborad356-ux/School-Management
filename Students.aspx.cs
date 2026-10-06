using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Students : Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       

        private void LoadStudents(string searchVal = "")
        {
                  
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
  }

        private void ClearForm()
        {
            
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }

        private void LoadStudentForEdit(int studentId)
        {
           
        }

        protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        }

        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
        }

        private void ShowAlert(string message, bool isSuccess)
        {
            
        }
    }
}
