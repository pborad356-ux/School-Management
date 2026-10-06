using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Default : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int i;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string nm;
            if (Session["admin"] != null)
            {
                //getcon();
                //fillgrid();
                da=new SqlDataAdapter("select * from stu_tbl where Username='" + Session["admin"] +"'",con);
                ds=new DataSet();
                da.Fill(ds);
                nm = ds.Tables[0].Rows[0]["Full Name"].ToString();

                Label1.Text =  nm;


            }
        }

        private void LoadStatistics()
        {
          
                }
            }
        }
    
