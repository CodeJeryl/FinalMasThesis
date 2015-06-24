using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace HS_Communications_Website
{
    public partial class log : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string sql = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
        private string hsSql = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(sql))
                {
                    con.Close();
                    con.Open();

                    SqlCommand newcom1 = new SqlCommand("Select * from ad where username =  @username and password = @password", con);
                    newcom1.Parameters.Add("@username", SqlDbType.NVarChar);
                    newcom1.Parameters["@username"].Value = TextBox1.Text;

                    newcom1.Parameters.Add("@password", SqlDbType.NVarChar);
                    newcom1.Parameters["@password"].Value = TextBox2.Text;

                    SqlDataReader red3 = newcom1.ExecuteReader();

                    if (red3.Read())
                    {
                        System.Web.Security.FormsAuthentication.SetAuthCookie(TextBox1.Text, false);

                        Response.Redirect("Student/AddEmail.aspx");
                    }
                    else
                    {
                        Label1.Text = "Wrong Username/Password";
                    }
                    con.Close();
                }
            }
            catch (Exception ex1)
            {
                Label1.Text = ex1.Message;
            }
        }
    }
}