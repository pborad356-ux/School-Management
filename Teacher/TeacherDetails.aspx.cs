using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class TeacherDetails : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTeacherDetails("SELECT * FROM Teachers");
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadTeacherDetails(string query)
        {
            getcon();
            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                lblHeroName.Text = row["T_FullName"].ToString();
                lblHeroEmail.Text = row["T_Email"].ToString();
                lblHeroMobile.Text = row["T_Mobile"].ToString();
                lblHeroId.Text = row["T_Id"].ToString();
                lblHeroSpecialization.Text = row["T_Specialization"].ToString();

                lblDetailId.Text = "#" + row["T_Id"].ToString();
                lblDetailFullName.Text = row["T_FullName"].ToString();
                lblDetailEmail.Text = row["T_Email"].ToString();
                lblDetailMobile.Text = row["T_Mobile"].ToString();
                lblDetailSpecialization.Text = row["T_Specialization"].ToString();
            }
            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
            {
                LoadTeacherDetails("SELECT * FROM Teachers WHERE T_FullName LIKE '%" + txtSearch.Text + "%' OR T_Id LIKE '%" + txtSearch.Text + "%'");
            }
            else
            {
                LoadTeacherDetails("SELECT * FROM Teachers");
            }
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            LoadTeacherDetails("SELECT * FROM Teachers");
        }
    }
}
