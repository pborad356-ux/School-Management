using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data;

namespace SchoolManagement
{
    public partial class Register : System.Web.UI.Page
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


        protected void btnRegister_Click(object sender, EventArgs e)
        {

            if (btnRegister.Text == "Save")
            {
                getcon();

                cmd = new SqlCommand("INSERT INTO stu_tbl ([Full Name],Username,Password,[Confirm Password],Role) VALUES('" + txtFullName.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "','" + txtConfirmPassword.Text + "','" + ddlRole.Text + "')", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();
            }
            else
            {
                getcon();

                cmd = new SqlCommand("UPDATE stu_tbl SET [Full Name]='" + txtFullName.Text +
                    "', Username='" + txtUsername.Text +
                    "', Password='" + txtPassword.Text +
                    "', [Confirm Password]='" + txtConfirmPassword.Text +
                    "', Role='" + ddlRole.Text +
                    "' WHERE Id='" + ViewState["Id"] + "'", con);

                cmd.ExecuteNonQuery();

                con.Close();

                fillgrid();
                clear();

                btnRegister.Text = "Save";
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

            //string query = "SELECT * FROM stu_tbl";

             da = new SqlDataAdapter("SELECT * FROM stu_tbl", con);

            DataSet ds = new DataSet();

            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();

            con.Close();

        }
        void clear()
        {
            txtFullName.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            ddlRole.Text = "";

        }
        void filldata() 
        {
            getcon();
            da = new SqlDataAdapter("select * from stu_tbl where id = '" + ViewState["Id"] + "' ", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {

                txtFullName.Text = ds.Tables[0].Rows[0][1].ToString();
                txtUsername.Text = ds.Tables[0].Rows[0]["Username"].ToString();
                txtPassword.Text = ds.Tables[0].Rows[0]["Password"].ToString();
                txtConfirmPassword.Text = ds.Tables[0].Rows[0]["Confirm Password"].ToString();
                ddlRole.SelectedValue =ds.Tables[0].Rows[0]["Role"].ToString();
            }

        }
        
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "cmd_edt")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = id;
                btnRegister.Text = "Update";
                filldata();
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("delete from stu_tbl  where id ='" + e.CommandArgument + "' ", con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgrid();

                //delete code
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}
