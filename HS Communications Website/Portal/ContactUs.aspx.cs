using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Portal
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string conString = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;

        protected void sendMsgBtn_Click(object sender, EventArgs e)
        {

            try
            {
                Panel1.Visible = false;
                ErrorPanel.Visible = false;


                SqlConnection con = new SqlConnection(conString);
                con.Close();
                con.Open();

                //insert all parent/student
                SqlCommand ins =
                    new SqlCommand(
                        "Insert into personalMsgTbl values('" + Session["studno"] + "','" + Session["name"] + "','" +
                        TextBox1.Text + "','" + TextBox2.Text + "',@datee,'0','Unread','" + Session["parent"] + "')", con);
                ins.Parameters.Add("@datee", SqlDbType.DateTime).Value = DateTime.Now;
                ins.ExecuteNonQuery();

                con.Close();

                Panel1.Visible = true;

                TextBox1.Text = "";
                TextBox2.Text = "";

            }
            catch (Exception ex)
            {

                ErrorPanel.Visible = true;
                ErrorLabel.Text = ex.Message;

            }
        }

       
    }
}