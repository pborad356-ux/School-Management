using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Students : Page
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
                LoadStudents();
            }

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadStudents()

        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM Students", con);
            ds = new DataSet();
            da.Fill(ds);

            gvStudents.DataSource = ds;
            gvStudents.DataBind();

            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save Student")
            {
                getcon();

                cmd = new SqlCommand("INSERT INTO Students (Stu_RollNo, Stu_Name, Stu_Email, Stu_Gender, Stu_DOB, Stu_Class) VALUES('" +
                    txtRollNum.Text + "','" + txtFullName.Text + "','" + txtEmail.Text + "','" +
                    ddlGender.Text + "','" + txtDOB.Text + "','" + txtClass.Text + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();

                LoadStudents();
                ClearForm();
            }
            else
            {
                getcon();

                cmd = new SqlCommand("UPDATE Students SET Stu_RollNo='" + txtRollNum.Text +
                    "', Stu_Name='" + txtFullName.Text +
                    "', Stu_Email='" + txtEmail.Text +
                    "', Stu_Gender='" + ddlGender.Text +
                    "', Stu_DOB='" + txtDOB.Text +
                    "', Stu_Class='" + txtClass.Text +
                    "' WHERE Stu_Id='" + hfStudentId.Value + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();

                LoadStudents();
                ClearForm();

                btnSave.Text = "Save Student";
                lblFormTitle.Text = "Add New Student";
            }


        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();

        }

        void ClearForm()
        {
            hfStudentId.Value = "";
            txtRollNum.Text = "";
            txtFullName.Text = "";
            txtEmail.Text = "";
            ddlGender.SelectedIndex = 0;
            txtDOB.Text = "";
            txtClass.Text = "";

            btnSave.Text = "Save Student";
            lblFormTitle.Text = "Add New Student";
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStudent")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                getcon();

                da = new SqlDataAdapter("SELECT * FROM Students WHERE Stu_Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfStudentId.Value = ds.Tables[0].Rows[0]["Stu_Id"].ToString();
                    txtRollNum.Text = ds.Tables[0].Rows[0]["Stu_RollNo"].ToString();
                    txtFullName.Text = ds.Tables[0].Rows[0]["Stu_Name"].ToString();
                    txtEmail.Text = ds.Tables[0].Rows[0]["Stu_Email"].ToString();
                    ddlGender.SelectedValue = ds.Tables[0].Rows[0]["Stu_Gender"].ToString();
                    txtDOB.Text = ds.Tables[0].Rows[0]["Stu_DOB"].ToString();
                    txtClass.Text = ds.Tables[0].Rows[0]["Stu_Class"].ToString();

                    btnSave.Text = "Update Student";
                    lblFormTitle.Text = "Edit Student";
                }

                con.Close();
            }

            if (e.CommandName == "DeleteStudent")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                getcon();

                cmd = new SqlCommand("DELETE FROM Students WHERE Stu_Id='" + id + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                LoadStudents();
                ClearForm();
            }

        }

         protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
        }

        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            LoadStudents();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
        }

        private void ShowAlert(string message, bool isSuccess)
        {
            
        }
    }
}
