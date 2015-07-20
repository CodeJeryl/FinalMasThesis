using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Admin
{
    public partial class GradeRange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string conss =
                    System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            SqlConnection con = new SqlConnection(conss);
            ErrorPanel.Visible = false;
            try
            {
                Label hid = (Label)(e.Item.FindControl("GcodeLabel"));
                TextBox tex1 = (TextBox) (e.Item.FindControl("TextBox1"));
                TextBox tex2 = (TextBox)(e.Item.FindControl("TextBox2"));
                if (e.CommandName == "upd")
                {
                    con.Close();
                    con.Open();

                    SqlCommand qw = new SqlCommand("update gradeRangeTbl set fromGrades = '"+ tex1.Text+"',toGrades = '"+tex2.Text+"' where Gcode = '" + hid.Text + "'", con);
                    qw.ExecuteNonQuery();

                    con.Close();

                    Panel1.Visible = true;
                }

               
            }
            catch (Exception er)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = er.Message;
                //   throw;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }
}