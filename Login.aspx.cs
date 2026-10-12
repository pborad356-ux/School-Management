using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;



namespace SchoolManagement
{
      public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int i;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            if (!(string.IsNullOrEmpty(txtUsername.Text)) && !(string.IsNullOrEmpty(txtPassword.Text)))
            {
                con = new SqlConnection(s);

                con.Open();

                cmd = new SqlCommand("select count(*) from stu_tbl where Username='" + txtUsername.Text + "' and Password='" + txtPassword.Text + "'", con);

                i = Convert.ToInt16(cmd.ExecuteScalar());


                if (i > 0)
                {
                    Session["admin"] = txtUsername.Text;
                    Response.Redirect("Default.aspx");

                }
                else
                {
                    Response.Write("Invalid username and password");
                }
            }

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
