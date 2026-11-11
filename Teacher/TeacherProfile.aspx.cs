using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class TeacherProfile : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfileData();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadProfileData()
        {
            getcon();
            string teacherUser = Session["teacher"] != null ? Session["teacher"].ToString() : "";
            if (teacherUser != "")
            {
                da = new SqlDataAdapter("SELECT * FROM Teachers WHERE T_FullName LIKE '%" + teacherUser + "%'", con);
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Teachers", con);
            }
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                lblProfileFullName.Text = row["T_FullName"].ToString();
                lblProfileSpecialization.Text = row["T_Specialization"].ToString();
                lblProfileId.Text = row["T_Id"].ToString();
                lblProfileEmail.Text = row["T_Email"].ToString();
                lblProfileMobile.Text = row["T_Mobile"].ToString();
                lblProfileRole.Text = "Faculty Member";

                txtEditId.Text = row["T_Id"].ToString();
                txtFullName.Text = row["T_FullName"].ToString();
                txtEmail.Text = row["T_Email"].ToString();
                txtMobile.Text = row["T_Mobile"].ToString();
                txtSpecialization.Text = row["T_Specialization"].ToString();
            }
            con.Close();
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("UPDATE Teachers SET T_FullName = '" + txtFullName.Text +
                                 "', T_Email = '" + txtEmail.Text +
                                 "', T_Mobile = '" + txtMobile.Text +
                                 "', T_Specialization = '" + txtSpecialization.Text +
                                 "' WHERE T_Id = '" + txtEditId.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            LoadProfileData();
            lblAlertMsg.Text = "Profile updated successfully!";
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            LoadProfileData();
        }
    }
}
