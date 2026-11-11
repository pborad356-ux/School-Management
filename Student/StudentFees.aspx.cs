using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace SchoolManagement
{
    public partial class StudentFees : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFees();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadFees()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Fees", con);
            ds = new DataSet();
            da.Fill(ds);
            gvFeeBreakdown.DataSource = ds;
            gvFeeBreakdown.DataBind();
            con.Close();

            lblTotalFee.Text = "₹ 25,000";
            lblPaidAmount.Text = "₹ 25,000";
            lblPendingDue.Text = "₹ 0.00";
        }
    }
}
