using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace HS_Communications_Website.Admin
{
    public partial class AdminHomepage : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetChartData();
                GetChartDataSc();
            }
        }

        string conss =
                   System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
        SqlConnection con;
        private string drop;
        private void GetChartData()
        {
            if (DropDownList1.Text == "")
            {

                con = new SqlConnection(conss);
                SqlCommand cmd = new SqlCommand("Select town,tCount from dashboard where SY = '2011-2012' and category ='town' order by tcount", con);
                con.Open();
                Series series = Chart1.Series["Series1"];
                SqlDataReader red = cmd.ExecuteReader();

                while (red.Read())
                {
                    series.Points.AddXY(red["town"].ToString(), red["tCount"]);

                }
                con.Close();
            }
            else
            {


                con = new SqlConnection(conss);
                SqlCommand cmd = new SqlCommand("Select town,tCount from dashboard where SY = '" + DropDownList1.Text + "' and category ='town' order by tcount", con);
                con.Open();
                Series series = Chart1.Series["Series1"];
                SqlDataReader red = cmd.ExecuteReader();

                while (red.Read())
                {
                    series.Points.AddXY(red["town"].ToString(), red["tCount"]);

                }
                con.Close();
            }
        }


        private void GetChartDataSc()
        {
            if (DropDownList1.Text == "")
            {

                con = new SqlConnection(conss);
                SqlCommand cmd = new SqlCommand("Select school,sCount from dashboard where SY = '2011-2012' and category ='sc' order by scount", con);
                con.Open();
                Series series = Chart2.Series["Series1"];
                SqlDataReader red = cmd.ExecuteReader();

                while (red.Read())
                {
                    series.Points.AddXY(red["school"].ToString(), red["sCount"]);
                }

                con.Close();
            }
            else
            {
                con = new SqlConnection(conss);
                SqlCommand cmd = new SqlCommand("Select school,sCount from dashboard where SY = '" + DropDownList1.Text + "' and category ='sc' order by scount", con);
                con.Open();
                Series series = Chart2.Series["Series1"];
                SqlDataReader red = cmd.ExecuteReader();

                while (red.Read())
                {
                    series.Points.AddXY(red["school"].ToString(), red["sCount"]);

                }

                con.Close();
            }
        }

      
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetChartData();
            GetChartDataSc();
        }


    }
}