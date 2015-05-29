using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Admin
{
    public partial class ManageDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                ErrorPanel.Visible = false;
                Panel1.Visible = false;
            string conss =
                     System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
            SqlConnection con;
            con = new SqlConnection(conss);

            con.Open();
            SqlCommand de1 = new SqlCommand("Delete from dashboard where SY='" + DropDownList2.SelectedItem.Text + "'", con);
            de1.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand cout = new SqlCommand("Insert into Dashboard(town,tcount,sy,category) select townadd,Count(*) as tCount,'" + DropDownList2.SelectedItem.Text + "','town' from students where studentno LIKE '" + DropDownList2.SelectedValue + "%' and townadd is not NULL group by townadd", con);
            cout.ExecuteNonQuery();
            con.Close();

            con.Open();
            SqlCommand cout1 = new SqlCommand("Insert into Dashboard(school,sCount,sy,category) select scLastAttend,Count(*) as sCount,'" + DropDownList2.SelectedItem.Text + "','sc' from students where studentno LIKE '" + DropDownList2.SelectedValue + "%' and scLastAttend is not NULL group by scLastAttend", con);
            cout1.ExecuteNonQuery();
            con.Close();

            Panel1.Visible = true;

            }
            catch (Exception ex)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ex.Message;
            }

        }
    }
}