using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Classes : Page
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

        private void LoadClasses()
        {
         
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save Class")
            {
                getcon();

                cmd = new SqlCommand("INSERT INTO Classes (ClassName) VALUES('" + txtClassName.Text + "')", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();

                pnlAlert.Visible = true;
                lblAlertMsg.Text = "Class Saved Successfully";
            }
            else
            {
                getcon();

                cmd = new SqlCommand("UPDATE Classes SET ClassName='" + txtClassName.Text +
                    "' WHERE ClassId='" + ViewState["ClassId"] + "'", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();

                btnSave.Text = "Save Class";

                pnlAlert.Visible = true;
                lblAlertMsg.Text = "Class Updated Successfully";
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

            da = new SqlDataAdapter("SELECT * FROM Classes", con);

            DataSet ds = new DataSet();

            da.Fill(ds);

            gvClasses.DataSource = ds;
            gvClasses.DataBind();

            con.Close();
        }
        void clear()
        {
            txtClassName.Text = "";
            hfClassId.Value = "";
            ViewState["ClassId"] = null;

            btnSave.Text = "Save Class";
            lblFormTitle.Text = "Add New Class";
        }

        void filldata()
        {
            getcon();

            da = new SqlDataAdapter("select * from Classes where ClassId = '" + ViewState["ClassId"] + "' ", con);

            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtClassName.Text = ds.Tables[0].Rows[0]["ClassName"].ToString();
                hfClassId.Value = ds.Tables[0].Rows[0]["ClassId"].ToString();
            }

            con.Close();
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
        }

      

        protected void gvClasses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditClass")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                ViewState["ClassId"] = id;

                btnSave.Text = "Update Class";
                lblFormTitle.Text = "Update Class";

                filldata();
            }
            else if (e.CommandName == "DeleteClass")
            {
                getcon();

                cmd = new SqlCommand("delete from Classes where ClassId ='" + e.CommandArgument + "'", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();

                pnlAlert.Visible = true;
                lblAlertMsg.Text = "Class Deleted Successfully";
            }
        }

        private void LoadClassForEdit(int classId)
        {
             
        }

        protected void gvClasses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        private void ShowAlert(string message, bool isSuccess)
        {
            
        }
    }
}
