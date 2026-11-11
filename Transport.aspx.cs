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
    public partial class Transport : System.Web.UI.Page
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

            da = new SqlDataAdapter("select * from Transport", con);

            ds = new DataSet();

            da.Fill(ds);

            gvTransport.DataSource = ds;
            gvTransport.DataBind();

            con.Close();
        }

        void fillcount()
        {
            getcon();

            cmd = new SqlCommand("select count(*) from Transport", con);
            lblTotalBuses.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select count(distinct RouteName) from Transport", con);
            lblTotalRoutes.Text = cmd.ExecuteScalar().ToString();

            cmd = new SqlCommand("select isnull(sum(Capacity),0) from Transport", con);
            lblTotalCapacity.Text = cmd.ExecuteScalar().ToString();

            con.Close();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand(
                "insert into Transport values('" + txtBusNumber.Text + "','" +
                txtRouteName.Text + "','" +
                txtDriverName.Text + "','" +
                txtDriverContact.Text + "','" +
                txtCapacity.Text + "','" +
                txtPickupPoint.Text + "','" +
                txtDepartureTime.Text + "','" +
                txtArrivalTime.Text + "','" +
                txtTransportFee.Text + "','" +
                ddlTransportStatus.SelectedValue + "')", con);

            cmd.ExecuteNonQuery();

            con.Close();

            lblMessage.Text = "Transport Saved Successfully";

            clear();
            fillgrid();
            fillcount();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand(
                "update Transport set BusNumber='" + txtBusNumber.Text +
                "', RouteName='" + txtRouteName.Text +
                "', DriverName='" + txtDriverName.Text +
                "', DriverContact='" + txtDriverContact.Text +
                "', Capacity='" + txtCapacity.Text +
                "', PickupPoint='" + txtPickupPoint.Text +
                "', DepartureTime='" + txtDepartureTime.Text +
                "', ArrivalTime='" + txtArrivalTime.Text +
                "', TransportFee='" + txtTransportFee.Text +
                "', Status='" + ddlTransportStatus.SelectedValue +
                "' where TransportId='" + ViewState["TransportId"] + "'", con);

            cmd.ExecuteNonQuery();

            con.Close();

            lblMessage.Text = "Transport Updated Successfully";

            clear();
            fillgrid();
            fillcount();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
            lblMessage.Text = "";
            fillgrid();
        }

        void clear()
        {
            txtBusNumber.Text = "";
            txtRouteName.Text = "";
            txtDriverName.Text = "";
            txtDriverContact.Text = "";
            txtCapacity.Text = "";
            txtPickupPoint.Text = "";
            txtDepartureTime.Text = "";
            txtArrivalTime.Text = "";
            txtTransportFee.Text = "";
            ddlTransportStatus.SelectedIndex = 0;

            ViewState["TransportId"] = null;

            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }

        protected void gvTransport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditTransport")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int id = Convert.ToInt32(gvTransport.DataKeys[rowIndex].Value);

                getcon();

                da = new SqlDataAdapter(
                    "select * from Transport where TransportId='" + id + "'", con);

                ds = new DataSet();

                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ViewState["TransportId"] = ds.Tables[0].Rows[0]["TransportId"].ToString();

                    txtBusNumber.Text = ds.Tables[0].Rows[0]["BusNumber"].ToString();
                    txtRouteName.Text = ds.Tables[0].Rows[0]["RouteName"].ToString();
                    txtDriverName.Text = ds.Tables[0].Rows[0]["DriverName"].ToString();
                    txtDriverContact.Text = ds.Tables[0].Rows[0]["DriverContact"].ToString();
                    txtCapacity.Text = ds.Tables[0].Rows[0]["Capacity"].ToString();
                    txtPickupPoint.Text = ds.Tables[0].Rows[0]["PickupPoint"].ToString();

                    txtDepartureTime.Text = TimeSpan.Parse(ds.Tables[0].Rows[0]["DepartureTime"].ToString()).ToString(@"hh\:mm");
                    txtArrivalTime.Text = TimeSpan.Parse(ds.Tables[0].Rows[0]["ArrivalTime"].ToString()).ToString(@"hh\:mm");

                    txtTransportFee.Text = ds.Tables[0].Rows[0]["TransportFee"].ToString();
                    ddlTransportStatus.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();

                    btnSave.Visible = false;
                    btnUpdate.Visible = true;

                    lblMessage.Text = "Edit Transport";
                }

                con.Close();
            }

        }
    }
}