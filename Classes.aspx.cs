using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Classes : Page
    {
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void LoadClasses()
        {
         
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
                      
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
        }

      

        protected void gvClasses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
         
        }

        private void LoadClassForEdit(int classId)
        {
             
        }

        protected void gvClasses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        private void ShowAlert(string message, bool isSuccess)
        {
            
        }
    }
}
