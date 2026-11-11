using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace SchoolManagement
{
    public partial class StudentAttendance : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAttendance();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadAttendance()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Attendance", con);
            ds = new DataSet();
            da.Fill(ds);
            gvAttendanceHistory.DataSource = ds;
            gvAttendanceHistory.DataBind();
            con.Close();

            lblTotalDays.Text = "120";
            lblDaysPresent.Text = "113";
            lblDaysAbsent.Text = "7";
            lblAttendancePercentage.Text = "94.2%";
        }
    }
}
