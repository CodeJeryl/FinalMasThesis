using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Faculty
{
    public partial class FacuMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();

            if (Session["level"] == "")
            {
                Session.Abandon();
                Session.Clear();
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("http://Workforce.LetranBataan.edu.ph/Homepage.aspx");
            }
            //try
            //{


            //    SqlConnection con = new SqlConnection(conString);
            //    con.Close();
            //    con.Open();
            //    SqlCommand se = new SqlCommand("SELECT Data,status FROM headerTbl WHERE status = 'active'", con);

            //    SqlDataReader rd = se.ExecuteReader();

            //    if (rd.Read())
            //    {
            //        byte[] bytes = (byte[])rd.GetSqlBinary(0);
            //        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            //        Image1.ImageUrl = "data:image/png;base64," + base64String;
            //    }
            //    con.Close();
            //}
            //catch (Exception ex)
            //{
               
            //}
        }
        string conString = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            System.Web.Security.FormsAuthentication.SignOut();

            Response.Redirect("http://Workforce.LetranBataan.edu.ph/Homepage.aspx");
        }
    }
}