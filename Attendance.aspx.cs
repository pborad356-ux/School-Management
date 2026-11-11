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
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
            }
        }

        private void LoadClasses()
        {
            getcon();

            da = new SqlDataAdapter("select * from Classes", con);

            ds = new DataSet();
            da.Fill(ds);

            ddlClass.DataSource = ds;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();

            ddlClass.Items.Insert(0, new ListItem("-- Select Class --", ""));

            con.Close();
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            if (ddlClass.SelectedValue != "" && txtDate.Text != "")
            {
                LoadAttendanceSheet();
            }
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
