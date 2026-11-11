using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class StudentTimetable : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTimetable();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadTimetable()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Timetable", con);
            ds = new DataSet();
            da.Fill(ds);
            gvTimetable.DataSource = ds;
            gvTimetable.DataBind();
            con.Close();
        }
    }
}
