using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Faculty
{
    public partial class Fhomepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string conss =
                     System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
      
            using (SqlConnection HScon = new SqlConnection(conss))
            {

                try
                {
                    HScon.Close();
                    HScon.Open();


                    SqlCommand comsearch =
                        new SqlCommand(
                            "Select * From facTbl where empID = '" + User.Identity.Name + "'", HScon);

                    SqlDataReader rd = comsearch.ExecuteReader();

                    if (rd.Read())
                    {
                        Session["fcode"] = rd.GetInt32(0);
                        Session["level"] = rd.GetString(3);
                        Session["name"] = rd.GetString(4);
                        Session["admin"] = rd.GetBoolean(5);
                        Session["adviser"] = rd.GetBoolean(7);
                        Session["advisory"] = rd.GetString(8);
                        Session["section"] = "faculty";
                    }
                    else
                    {
                        Session.Abandon();
                        Session.Clear();
                        System.Web.Security.FormsAuthentication.SignOut();

                        Response.Redirect("http://Workforce.LetranBataan.edu.ph/Homepage.aspx");
                    }

                }
                catch (Exception ex)
                {
                    ErrorPanel.Visible = true;
                    ErrorLabel.Text = ex.Message;
                }
            }

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            try
            {


             if (e.CommandName == "readd")
                {

                    HiddenField hid = (HiddenField) (e.Item.FindControl("HiddenField1"));

                    Session["msgid"] = hid.Value;
                    Response.Redirect("Message.aspx");

                }


            }
            catch (Exception ee)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ee.Message;
            }
        }
    }
}