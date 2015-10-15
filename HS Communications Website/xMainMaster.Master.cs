using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                
                //SqlConnection con = new SqlConnection(conString);
                //con.Close();
                //con.Open();
                //SqlCommand se = new SqlCommand("SELECT Data,status FROM headerTbl WHERE status = 'active'",con);

                //SqlDataReader rd = se.ExecuteReader();

                //if (rd.Read())
                //{
                //    byte[] bytes = (byte[])rd.GetSqlBinary(0);
                //    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                //    Image1.ImageUrl = "data:image/png;base64," + base64String;
                //}
                //con.Close();
            }
            catch (Exception ex)
            {
                ErrorPanel.Visible = true;
                errorLbl.Text = ex.Message;
            }

        }
        

        FormsAuthenticationTicket tkt;
        string cookiestr;
        HttpCookie ck;
  
        string conString = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
        protected void loginBtn_Click(object sender, EventArgs e)
        {

          
            ErrorPanel.Visible = false;

            SqlConnection conek = new SqlConnection(conString);
            SqlConnection conek1 = new SqlConnection(conString);
          //  SqlConnection conek2 = new SqlConnection(conString);

            try
            {
                conek.Close();
                conek.Open();
                
                
                SqlCommand comsearch =
                    new SqlCommand(
                        "Select * From facTbl where empID = @userName and password = @password and disabled = 'false'", conek);
                comsearch.Parameters.Add("@userName", SqlDbType.VarChar, 50);
                comsearch.Parameters["@userName"].Value = usernameTxtbox.Text;
                comsearch.Parameters.Add("@password", SqlDbType.VarChar, 50);
                comsearch.Parameters["@password"].Value = passTxtbox.Text;
              
                SqlDataReader rd = comsearch.ExecuteReader();
                
                if (rd.Read())
                {
                    //  has = rd.GetString(2);
                    Session["fcode"] = rd.GetInt32(0);
                    Session["level"] = rd.GetString(3);
                    Session["name"] = rd.GetString(4);
                    Session["admin"] = rd.GetBoolean(5);
                    Session["adviser"] = rd.GetBoolean(7);
                    Session["advisory"] = rd.GetString(8);
                    Session["section"] = "faculty";

                    if (rd.GetBoolean(5))
                    {
                      //Admin Code Here

                   
                        //conek1.Close();
                        //conek1.Open();

                        //SqlCommand com = new SqlCommand("update adminol set online = '" + 1 + "'", conek1);

                        // com.ExecuteNonQuery();
                        tkt = new FormsAuthenticationTicket(1, usernameTxtbox.Text, DateTime.Now, DateTime.Now.AddMinutes(60),false,"");
                        cookiestr = FormsAuthentication.Encrypt(tkt);
                        ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                        ck.Expires = tkt.Expiration;
                        ck.Path = FormsAuthentication.FormsCookiePath;
                        Response.Cookies.Add(ck);

                        string strRedirect;
                      strRedirect = "~/Admin/AdminHomepage.aspx";
                        Response.Redirect(strRedirect, true);

                        //System.Web.Security.FormsAuthentication.RedirectFromLoginPage(usernameTxtbox.Text, false);
                        //System.Web.Security.FormsAuthentication.SetAuthCookie(usernameTxtbox.Text, false);
                        //System.Web.Security.FormsAuthentication.GetAuthCookie(usernameTxtbox.Text, false);

                        //Response.Redirect("~/Admin/AdminHomepage.aspx", false);
                    }
                    else
                    {
                        //not admin code here

                        //Session["customerID"] = rd.GetInt32(0);
                        //Session["email"] = rd.GetString(1);
                        //Session["name"] = rd.GetString(3);
                        //Session["address"] = rd.GetString(9);
                        tkt = new FormsAuthenticationTicket(1, usernameTxtbox.Text, DateTime.Now, DateTime.Now.AddMinutes(60), false, "");
                        cookiestr = FormsAuthentication.Encrypt(tkt);
                        ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                        ck.Expires = tkt.Expiration;
                        ck.Path = FormsAuthentication.FormsCookiePath;
                        Response.Cookies.Add(ck);

                        string strRedirect;
                      strRedirect = "~/Faculty/Fhomepage.aspx";
                        Response.Redirect(strRedirect, true);

                        //System.Web.Security.FormsAuthentication.RedirectFromLoginPage(usernameTxtbox.Text, false);
                        //System.Web.Security.FormsAuthentication.SetAuthCookie(usernameTxtbox.Text, false);
                        //System.Web.Security.FormsAuthentication.GetAuthCookie(usernameTxtbox.Text, false);

                        //Response.Redirect("~/Faculty/Fhomepage.aspx", false);
                    }
                }
                else
                {
                    conek1.Close();
                    conek1.Open();

                    rd.Close();

                    SqlCommand comsearch1 =
                        new SqlCommand(
                            "Select * From LoginView where username = @userName and password = @password and activated = 1", conek1);
                    comsearch1.Parameters.Add("@userName", SqlDbType.VarChar, 50);
                    comsearch1.Parameters["@userName"].Value = usernameTxtbox.Text;
                    comsearch1.Parameters.Add("@password", SqlDbType.VarChar, 50);
                    comsearch1.Parameters["@password"].Value = passTxtbox.Text;

                    SqlDataReader rd1 = comsearch1.ExecuteReader();
                    if (rd1.Read())
                    {
                        char last = usernameTxtbox.Text[usernameTxtbox.Text.Length - 1];
                        if (last.ToString().ToUpper() == "P")
                        {
                            //parent code here

                            Session["studno"] = rd1.GetInt32(0);
                            Session["name"] = rd1.GetString(1);
                            Session["username"] = rd1.GetString(2);
                            Session["section"] = rd1.GetString(4);
                            Session["year"] = rd1.GetInt32(5);
                            Session["parent"] = "true";

                            //conek1.Close();
                            //conek1.Open();
                            //SqlCommand com = new SqlCommand("update adminol set online = '" + 1 + "'", conek1);

                            // com.ExecuteNonQuery();

                            tkt = new FormsAuthenticationTicket(1, usernameTxtbox.Text, DateTime.Now, DateTime.Now.AddMinutes(60), false, "");
                            cookiestr = FormsAuthentication.Encrypt(tkt);
                            ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                            ck.Expires = tkt.Expiration;
                            ck.Path = FormsAuthentication.FormsCookiePath;
                            Response.Cookies.Add(ck);

                            string strRedirect;
                           strRedirect = "~/Portal/Phomepage.aspx";
                            Response.Redirect(strRedirect, true);

                            //System.Web.Security.FormsAuthentication.RedirectFromLoginPage(usernameTxtbox.Text, false);
                            //System.Web.Security.FormsAuthentication.SetAuthCookie(usernameTxtbox.Text, false);
                            //System.Web.Security.FormsAuthentication.GetAuthCookie(usernameTxtbox.Text, false);

                            //Response.Redirect("~/Portal/Phomepage.aspx", false);
                        }
                        else
                        {
                            //student code here

                            Session["studno"] = rd1.GetInt32(0);
                            Session["name"] = rd1.GetString(1);
                            Session["username"] = rd1.GetString(2);
                            Session["section"] = rd1.GetString(4);
                            Session["year"] = rd1.GetInt32(5);
                            Session["Parent"] = "false";

                            //conek1.Close();
                            //conek1.Open();
                            //SqlCommand com = new SqlCommand("update adminol set online = '" + 1 + "'", conek1);

                            // com.ExecuteNonQuery();
                            tkt = new FormsAuthenticationTicket(1, usernameTxtbox.Text, DateTime.Now, DateTime.Now.AddMinutes(60), false, "");
                            cookiestr = FormsAuthentication.Encrypt(tkt);
                            ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                            ck.Expires = tkt.Expiration;
                            ck.Path = FormsAuthentication.FormsCookiePath;
                            Response.Cookies.Add(ck);

                            string strRedirect;
                          strRedirect = "~/Portal/Phomepage.aspx";
                            Response.Redirect(strRedirect, true);
                            //System.Web.Security.FormsAuthentication.RedirectFromLoginPage(usernameTxtbox.Text, false);
                            //System.Web.Security.FormsAuthentication.SetAuthCookie(usernameTxtbox.Text, false);
                            //System.Web.Security.FormsAuthentication.GetAuthCookie(usernameTxtbox.Text, false);

                            //Response.Redirect("~/Portal/Phomepage.aspx", false);
                        }
                    }
                    else
                    {
                    ErrorPanel.Visible = true;
                        errorLbl.Text = "Incorrect Username/Password or Account not yet activated";
                    }
                }

            }
            catch (Exception ee)
            {
                errorLbl.Text = ee.Message;
            }
        }


    }
}