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
            
        }

       

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}
