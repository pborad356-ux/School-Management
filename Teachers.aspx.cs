using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Teachers : Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void LoadTeachers(string searchVal = "")
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

        protected void gvTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }

        private void LoadTeacherForEdit(int teacherId)
        {
            
                          
        }

        protected void gvTeachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
             
            
        }

        protected void gvTeachers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
        }

        private void ShowAlert(string message, bool isSuccess)
        {
            
        }

        protected void txtFullName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
