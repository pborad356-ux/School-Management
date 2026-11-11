using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagement
{
    public partial class Notices : System.Web.UI.Page
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
                LoadNotices();
            }

        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        private void LoadNotices()
        {
            getcon();

            da = new SqlDataAdapter("SELECT * FROM Notices", con);
            ds = new DataSet();
            da.Fill(ds);

            gvNotices.DataSource = ds;
            gvNotices.DataBind();

            con.Close();

            LoadNoticeStats();
        }

        private void LoadNoticeStats()
        {
            getcon();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Notices", con);
            lblTotalNotices.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("SELECT COUNT(*) FROM Notices WHERE Status='Published'", con);
            lblPublished.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("SELECT COUNT(DISTINCT Audience) FROM Notices", con);
            lblAudience.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("INSERT INTO Notices (NoticeTitle, Category, PublishDate, Audience, ExpiryDate, Status, Description) VALUES('" +
                txtNoticeTitle.Text + "','" + ddlCategory.Text + "','" +
                txtPublishDate.Text + "','" + ddlAudience.Text + "',NULLIF('" +
                txtExpiryDate.Text + "',''),'" + ddlStatus.Text + "','" +
                txtDescription.Text + "')", con);

            cmd.ExecuteNonQuery();
            con.Close();

            LoadNotices();
            ClearForm();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("UPDATE Notices SET NoticeTitle='" + txtNoticeTitle.Text +
                "', Category='" + ddlCategory.Text +
                "', PublishDate='" + txtPublishDate.Text +
                "', Audience='" + ddlAudience.Text +
                "', ExpiryDate=NULLIF('" + txtExpiryDate.Text +
                "',''), Status='" + ddlStatus.Text +
                "', Description='" + txtDescription.Text +
                "' WHERE NoticeId='" + hfNoticeId.Value + "'", con);

            cmd.ExecuteNonQuery();
            con.Close();

            LoadNotices();
            ClearForm();
        }

         void ClearForm()
        {
            hfNoticeId.Value = "";
            txtNoticeTitle.Text = "";
            ddlCategory.SelectedIndex = 0;
            txtPublishDate.Text = "";
            ddlAudience.SelectedIndex = 0;
            txtExpiryDate.Text = "";
            ddlStatus.SelectedIndex = 0;
            txtDescription.Text = "";

            btnSave.Text = "Save Notice";
            lblFormTitle.Text = "Add Notice";
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void gvNotices_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditNotice")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                getcon();

                da = new SqlDataAdapter("SELECT * FROM Notices WHERE NoticeId='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    hfNoticeId.Value = ds.Tables[0].Rows[0]["NoticeId"].ToString();
                    txtNoticeTitle.Text = ds.Tables[0].Rows[0]["NoticeTitle"].ToString();
                    ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
                    txtPublishDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["PublishDate"]).ToString("yyyy-MM-dd");
                    ddlAudience.SelectedValue = ds.Tables[0].Rows[0]["Audience"].ToString();

                    if (ds.Tables[0].Rows[0]["ExpiryDate"] != DBNull.Value)
                    {
                        txtExpiryDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["ExpiryDate"]).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        txtExpiryDate.Text = "";
                    }

                    ddlStatus.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();
                    txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();

                    btnSave.Text = "Save Notice";
                    lblFormTitle.Text = "Edit Notice";
                }

                con.Close();
            }

            if (e.CommandName == "DeleteNotice")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                getcon();

                cmd = new SqlCommand("DELETE FROM Notices WHERE NoticeId='" + id + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                LoadNotices();
                ClearForm();
            }

        }
    }
}