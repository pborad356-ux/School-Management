using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace SchoolManagement
{
    public partial class TeacherDashboard : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadData()
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM stu_tbl WHERE Username='" + Session["teacher"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblTeacherGreeting.Text = ds.Tables[0].Rows[0]["Full Name"].ToString();
            }
            else
            {
                lblTeacherGreeting.Text = "Faculty Member";
            }

            da = new SqlDataAdapter("SELECT * FROM Classes", con);
            ds = new DataSet();
            da.Fill(ds);
            lblTotalClasses.Text = ds.Tables[0].Rows.Count.ToString();
            gvDashboardClasses.DataSource = ds;
            gvDashboardClasses.DataBind();

            da = new SqlDataAdapter("SELECT * FROM Students", con);
            ds = new DataSet();
            da.Fill(ds);
            lblTotalStudents.Text = ds.Tables[0].Rows.Count.ToString();

            da = new SqlDataAdapter("SELECT * FROM Teachers", con);
            ds = new DataSet();
            da.Fill(ds);
            lblTotalTeachers.Text = ds.Tables[0].Rows.Count.ToString();
            lblTotalSubjects.Text = "5";
            gvDashboardTeachers.DataSource = ds;
            gvDashboardTeachers.DataBind();

            con.Close();
        }
    }
}
