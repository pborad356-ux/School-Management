using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace SchoolManagement
{
    public partial class StudentResults : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadResults();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadResults()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Results", con);
            ds = new DataSet();
            da.Fill(ds);
            gvResults.DataSource = ds;
            gvResults.DataBind();
            con.Close();

            lblTotalMarks.Text = "455 / 500";
            lblPercentage.Text = "91.0%";
            lblGrade.Text = "A+";
            lblFinalStatus.Text = "PASSED";
        }
    }
}
