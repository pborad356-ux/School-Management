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
    public partial class Timetable : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnUpdate.Visible = false;
                fillgrid();
                fillcount();
            }
        }
        void fillgrid()
        {
            getcon();

            da = new SqlDataAdapter(
                "select * from Timetable", con);

            ds = new DataSet();

            da.Fill(ds);

            gvTimetable.DataSource = ds;
            gvTimetable.DataBind();

            con.Close();
        }

        void fillcount()
        {
            getcon();

            cmd = new SqlCommand("select count(*) from Timetable", con);
            lblTotalLectures.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(distinct Subject) from Timetable", con);
            lblTotalSubjects.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(distinct [Day]) from Timetable", con);
            lblScheduledDays.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand(
                "insert into Timetable values('" + ddlClass.SelectedValue + "','" +
                ddlAcademicYear.SelectedValue + "','" +
                ddlDay.SelectedValue + "','" +
                txtSubject.Text + "','" +
                txtTeacherId.Text + "','" +
                ddlLecture.SelectedValue + "','" +
                txtStartTime.Text + "','" +
                txtEndTime.Text + "','" +
                txtRoomNumber.Text + "')", con);

            cmd.ExecuteNonQuery();

            con.Close();

            lblMessage.Text = "Timetable Saved Successfully";

            clear();
            fillgrid();
            fillcount();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand(
                "update Timetable set ClassName='" + ddlClass.SelectedValue +
                "', AcademicYear='" + ddlAcademicYear.SelectedValue +
                "', [Day]='" + ddlDay.SelectedValue +
                "', Subject='" + txtSubject.Text +
                "', TeacherId='" + txtTeacherId.Text +
                "', LectureNumber='" + ddlLecture.SelectedValue +
                "', StartTime='" + txtStartTime.Text +
                "', EndTime='" + txtEndTime.Text +
                "', RoomNumber='" + txtRoomNumber.Text +
                "' where TimetableId='" + ViewState["TimetableId"] + "'", con);

            cmd.ExecuteNonQuery();

            con.Close();

            lblMessage.Text = "Timetable Updated Successfully";

            clear();
            fillgrid();
            fillcount();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
            lblMessage.Text = "";
        }

        void clear()
        {
            ddlClass.SelectedIndex = 0;
            ddlAcademicYear.SelectedIndex = 0;
            ddlDay.SelectedIndex = 0;
            txtSubject.Text = "";
            txtTeacherId.Text = "";
            ddlLecture.SelectedIndex = 0;
            txtStartTime.Text = "";
            txtEndTime.Text = "";
            txtRoomNumber.Text = "";

            ViewState["TimetableId"] = null;

            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {

           
        }

        protected void gvTimetable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
             if (e.CommandName == "EditTimetable")
            {
                int id = Convert.ToInt32(e.CommandArgument);

                getcon();

                da = new SqlDataAdapter("SELECT * FROM Timetable WHERE TimetableId='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ViewState["TimetableId"] = ds.Tables[0].Rows[0]["TimetableId"].ToString();

                    ddlClass.SelectedValue = ds.Tables[0].Rows[0]["ClassName"].ToString();
                    ddlAcademicYear.SelectedValue = ds.Tables[0].Rows[0]["AcademicYear"].ToString();
                    ddlDay.SelectedValue = ds.Tables[0].Rows[0]["Day"].ToString();
                    txtSubject.Text = ds.Tables[0].Rows[0]["Subject"].ToString();
                    txtTeacherId.Text = ds.Tables[0].Rows[0]["TeacherId"].ToString();
                    ddlLecture.SelectedValue = ds.Tables[0].Rows[0]["LectureNumber"].ToString();
                    txtStartTime.Text = TimeSpan.Parse(ds.Tables[0].Rows[0]["StartTime"].ToString()).ToString(@"hh\:mm");
                    txtEndTime.Text = TimeSpan.Parse(ds.Tables[0].Rows[0]["EndTime"].ToString()).ToString(@"hh\:mm");
                    txtRoomNumber.Text = ds.Tables[0].Rows[0]["RoomNumber"].ToString();

                    btnSave.Visible = false;
                    btnUpdate.Visible = true;

                    lblMessage.Text = "Edit Timetable";
                }

                con.Close();
            }
        }
    }
}