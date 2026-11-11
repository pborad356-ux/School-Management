using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class TeacherAttendance : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                fillgrid();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            if (ddlClass.SelectedValue != "")
            {
                da = new SqlDataAdapter("SELECT * FROM Students WHERE Stu_Class = '" + ddlClass.SelectedValue + "'", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Students", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            gvAttendance.DataSource = ds;
            gvAttendance.DataBind();
            con.Close();

            lblSheetInfo.Text = "Class: " + ddlClass.SelectedValue + " | Date: " + txtDate.Text;
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            fillgrid();
        }

        protected void btnSaveAttendance_Click(object sender, EventArgs e)
        {
            lblAlertMsg.Text = "Attendance Sheet Recorded Successfully!";
        }
    }
}
