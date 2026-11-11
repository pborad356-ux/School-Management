using System;
using System.Configuration;
using System.Data;
using System.Web.UI;

namespace SchoolManagement
{
    public partial class StudentProfile : Page
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
                LoadProfile();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadProfile()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Students", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRow row = ds.Tables[0].Rows[0];
                txtRollNo.Text = row["Stu_RollNo"].ToString();
                txtFullName.Text = row["Stu_Name"].ToString();
                txtEmail.Text = row["Stu_Email"].ToString();
                txtGender.Text = row["Stu_Gender"].ToString();
                txtDOB.Text = row["Stu_DOB"].ToString();
                txtClass.Text = row["Stu_Class"].ToString();

                lblAvatarName.Text = row["Stu_Name"].ToString();
                lblAvatarClass.Text = row["Stu_Class"].ToString();
                lblSideRoll.Text = row["Stu_RollNo"].ToString();
            }
            con.Close();
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            getcon();
            cmd = new SqlCommand("UPDATE Students SET Stu_Email = '" + txtEmail.Text + "' WHERE Stu_RollNo = '" + txtRollNo.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            LoadProfile();
        }
    }
}
