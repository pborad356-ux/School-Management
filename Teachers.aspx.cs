using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Teachers : Page
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
                fillgrid();
            }
        }

     
  
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save Teacher")
            {
                getcon();

                cmd = new SqlCommand("INSERT INTO Teachers (T_FullName,T_Email,T_Mobile,T_Specialization) VALUES('" +
                    txtFullName.Text + "','" +
                    txtEmail.Text + "','" +
                    txtMobile.Text + "','" +
                    txtSpecialization.Text + "')", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();
            }
            else
            {
                getcon();

                cmd = new SqlCommand("UPDATE Teachers SET T_FullName='" + txtFullName.Text +
                    "', T_Email='" + txtEmail.Text +
                    "', T_Mobile='" + txtMobile.Text +
                    "', T_Specialization='" + txtSpecialization.Text +
                    "' WHERE T_Id='" + ViewState["T_Id"] + "'", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();

                btnSave.Text = "Save Teacher";
            }


        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            getcon();

            da = new SqlDataAdapter("SELECT [T_Id ] AS T_Id, [T_FullName ] AS T_FullName, [T_Email ] AS T_Email, [T_Mobile ] AS T_Mobile, [T_Specialization ] AS T_Specialization FROM Teachers", con);
            DataSet ds = new DataSet();

            da.Fill(ds);

            gvTeachers.DataSource = ds;
            gvTeachers.DataBind();

            con.Close();
        }
        void clear()
        {
            hfTeacherId.Value = "";
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtSpecialization.Text = "";
            lblFormTitle.Text = "Add New Teacher";
            btnSave.Text = "Save Teacher";
        }

        void filldata()
        {
            getcon();

            da = new SqlDataAdapter("select * from Teachers where T_Id = '" +
                ViewState["T_Id"] + "'", con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = ds.Tables[0].Rows[0]["T_FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["T_Email"].ToString();
                txtMobile.Text = ds.Tables[0].Rows[0]["T_Mobile"].ToString();
                txtSpecialization.Text = ds.Tables[0].Rows[0]["T_Specialization"].ToString();

                hfTeacherId.Value = ds.Tables[0].Rows[0]["T_Id"].ToString();
            }

            con.Close();
        }
        protected void gvTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditTeacher")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["T_Id"] = id;

                btnSave.Text = "Update Teacher";
                lblFormTitle.Text = "Edit Teacher";

                filldata();
            }
            else if (e.CommandName == "DeleteTeacher")
            {
                getcon();

                cmd = new SqlCommand("delete from Teachers where T_Id = '" +
                    e.CommandArgument + "'", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();
            }

        }
        private void LoadTeacherForEdit(int teacherId)
        {
            
                          
        }

        protected void gvTeachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
             
            
        }

        protected void gvTeachers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTeachers.PageIndex = e.NewPageIndex;
            fillgrid();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
        }

        private void ShowAlert(string message, bool isSuccess)
        {
            
        }

        protected void txtFullName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}
