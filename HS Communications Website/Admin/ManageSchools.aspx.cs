using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HS_Communications_Website.Admin
{
    public partial class ManageSchools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        string conss = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(conss);

                con.Close();
                con.Open();

                SqlCommand com = new SqlCommand("Insert into schoolTbl values('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
                com.ExecuteNonQuery();

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