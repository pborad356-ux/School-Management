using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace SchoolManagement
{
    public partial class StudentDashboard : Page
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

            da = new SqlDataAdapter("SELECT * FROM stu_tbl WHERE Username='" + Session["student"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblStudentGreeting.Text = ds.Tables[0].Rows[0]["Full Name"].ToString();
            }
            else
            {
                lblStudentGreeting.Text = "Aarav Patel";
            }

            lblStudentClass.Text = "Class 10";
            lblAttendancePercent.Text = "94.5%";
            lblLatestGrade.Text = "A+ (89%)";
            lblFeeStatus.Text = "Paid";

            da = new SqlDataAdapter("SELECT * FROM Timetable", con);
            ds = new DataSet();
            da.Fill(ds);
            gvTodaySchedule.DataSource = ds;
            gvTodaySchedule.DataBind();

            da = new SqlDataAdapter("SELECT * FROM Results", con);
            ds = new DataSet();
            da.Fill(ds);
            gvRecentResults.DataSource = ds;
            gvRecentResults.DataBind();

            con.Close();
        }
    }
}
