using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class TeacherTimetable : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStats();
                LoadTimetable();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadStats()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Classes", con);
            ds = new DataSet();
            da.Fill(ds);
            lblTotalClasses.Text = ds.Tables[0].Rows.Count.ToString();

            da = new SqlDataAdapter("SELECT * FROM Teachers", con);
            ds = new DataSet();
            da.Fill(ds);
            lblTotalTeachers.Text = ds.Tables[0].Rows.Count.ToString();

            con.Close();
        }

        private void LoadTimetable()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Timetable", con);
            ds = new DataSet();
            da.Fill(ds);
            gvTimetable.DataSource = ds;
            gvTimetable.DataBind();
            lblScheduleCount.Text = ds.Tables[0].Rows.Count + " Lectures Found";
            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getcon();
            if (txtSearch.Text != "")
            {
                da = new SqlDataAdapter("SELECT * FROM Timetable WHERE Subject LIKE '%" + txtSearch.Text + "%' OR Day LIKE '%" + txtSearch.Text + "%' OR Room LIKE '%" + txtSearch.Text + "%'", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Timetable", con);
            }
            ds = new DataSet();
            da.Fill(ds);
            gvTimetable.DataSource = ds;
            gvTimetable.DataBind();
            lblScheduleCount.Text = ds.Tables[0].Rows.Count + " Lectures Found";
            con.Close();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadTimetable();
        }
    }
}
