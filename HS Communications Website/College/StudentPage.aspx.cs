using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.College
{
    public partial class StudentPage : System.Web.UI.Page
    {

        string sql = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
        //private string fullname;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Stud"] != null)
            {
                if (Request.IsAuthenticated)
                {
                    if (!Page.IsPostBack)
                        DropDownList1.SelectedValue = Session["per"].ToString();

                    using (SqlConnection con11 = new SqlConnection(sql))
                    {
                        con11.Open();
                        SqlCommand com3 = new SqlCommand("Select studno,firstname,middle,lastname,course,gr_yr from students where studno='" + Convert.ToInt32(Session["Stud"].ToString()) + "'", con11);
                        SqlDataReader dd = com3.ExecuteReader();

                        if (dd.Read())
                        {
                            FirstNameLbl.Text = dd.GetValue(1).ToString();//6
                            MiddleInitLbl.Text = dd.GetValue(2).ToString();//8
                            lastNameLbl.Text = dd.GetValue(3).ToString();//9
                            courseLbl.Text = dd.GetValue(4).ToString(); //26
                            yearlbl.Text = dd.GetValue(5).ToString();
                            //  fullname = FirstNameLbl.Text + " " + MiddleInitLbl.Text + " " + lastNameLbl.Text;
                        }
                    }
                    errorPanelChange.Visible = false;

                }
                else
                {
                    Response.Redirect("~/Home.aspx");
                }
            }
            else
            {
                Session.Abandon();
                Session.Clear();
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("~/Home.aspx");
            }
        }

        protected void ChangePass_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using (SqlConnection con = new SqlConnection(sql))
                {
                    string has;

                    //SqlCommand com = new SqlCommand("Select * from students where studno = @studno " +
                    //                                "and password = @password ", con);
                    //// com.Parameters.AddWithValue("username", TxtboxUsername.Text);
                    //com.Parameters.Add("@studno", SqlDbType.Int, 10);
                    //com.Parameters["@studno"].Value = TextBox1.Text;

                    //com.Parameters.Add("@password", SqlDbType.VarChar,100);
                    //com.Parameters["@password"].Value = TextBox2.Text;


                    SqlCommand studsearch1 = new SqlCommand("Select studno,password from useraccounts where studno = @studno", con);
                    studsearch1.Parameters.Add("@studno", SqlDbType.Int, 10);
                    studsearch1.Parameters["@studno"].Value = Convert.ToInt32(Session["Stud"].ToString());

                    try
                    {
                        con.Open();
                        SqlDataReader read = studsearch1.ExecuteReader();

                        if (read.Read())
                        {
                            has = read.GetString(1);

                            if (ValidatePassword(oldpassTxtbox.Text, has))
                            {
                                con.Close();
                                con.Open();
                                string hashed = CreateHash(newpassTxtbox.Text);
                                SqlCommand chnge = new SqlCommand("update userAccounts set password = '" + hashed + "' where studno = '" + Convert.ToInt32(Session["Stud"].ToString()) + "'", con);
                                chnge.ExecuteNonQuery();
                                errorPanelChange.Visible = true;
                                Label2.Text = "Change Password Successful!";
                            }
                            else
                            {
                                errorPanelChange.Visible = true;
                                Label2.Text = "Incorrect Old Password";
                            }
                        }
                        else
                        {
                            errorPanelChange.Visible = true;
                            Label2.Text = "Please Relog In";
                        }

                    }
                    catch (Exception ex)
                    {
                        errorPanelChange.Visible = true;
                        Label2.Text = ex.Message;
                    }

                    con.Close();
                }
            }
        }

        // The following constants may be changed without breaking existing hashes.
        public const int SALT_BYTES = 24;
        public const int HASH_BYTES = 24;
        public const int PBKDF2_ITERATIONS = 1000;

        public const int ITERATION_INDEX = 0;
        public const int SALT_INDEX = 1;
        public const int PBKDF2_INDEX = 2;

        /// <summary>
        /// Creates a salted PBKDF2 hash of the password.
        /// </summary>
        /// <param name="password">The password to hash.</param>
        /// <returns>The hash of the password.</returns>
        /// 


        public static string CreateHash(string password)
        {
            // Generate a random salt
            RNGCryptoServiceProvider csprng = new RNGCryptoServiceProvider();
            byte[] salt = new byte[SALT_BYTES];
            csprng.GetBytes(salt);

            // Hash the password and encode the parameters
            byte[] hash = PBKDF2(password, salt, PBKDF2_ITERATIONS, HASH_BYTES);
            return PBKDF2_ITERATIONS + ":" +
                Convert.ToBase64String(salt) + ":" +
                Convert.ToBase64String(hash);

        }

        public static bool ValidatePassword(string password, string goodHash)
        {
            // Extract the parameters from the hash
            char[] delimiter = { ':' };
            string[] split = goodHash.Split(delimiter);
            int iterations = Int32.Parse(split[ITERATION_INDEX]);
            byte[] salt = Convert.FromBase64String(split[SALT_INDEX]);
            byte[] hash = Convert.FromBase64String(split[PBKDF2_INDEX]);

            byte[] testHash = PBKDF2(password, salt, iterations, hash.Length);
            return SlowEquals(hash, testHash);
        }

        private static bool SlowEquals(byte[] a, byte[] b)
        {
            uint diff = (uint)a.Length ^ (uint)b.Length;
            for (int i = 0; i < a.Length && i < b.Length; i++)
                diff |= (uint)(a[i] ^ b[i]);
            return diff == 0;
        }

        private static byte[] PBKDF2(string password, byte[] salt, int iterations, int outputBytes)
        {
            Rfc2898DeriveBytes pbkdf2 = new Rfc2898DeriveBytes(password, salt);
            pbkdf2.IterationCount = iterations;
            return pbkdf2.GetBytes(outputBytes);
        }
        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Abandon();
            Session.Clear();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void print1_Click(object sender, EventArgs e)
        {
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-disposition", "attachment;filename=OnlineGrade.pdf");
            //Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //StringWriter s_w = new StringWriter();
            //HtmlTextWriter h_w = new HtmlTextWriter(s_w);
            //GridView1.AllowPaging = false;
            //GridView1.DataBind();
            //GridView1.RenderControl(h_w);
            //GridView1.HeaderRow.Style.Add("width", "15%");
            //GridView1.HeaderRow.Style.Add("font-size", "10px");
            //GridView1.Style.Add("text-decoration", "none");
            //GridView1.Style.Add("font-family", "Arial, Helvetica, sans-serif;");
            //GridView1.Style.Add("font-size", "8px");
            //StringReader sr = new StringReader(s_w.ToString());
            //Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
            //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //pdfDoc.Open();
            ////  pdfDoc.Add(new Paragraph("Name:  " + fullname + "        Course: " + courseLbl.Text + "        Period: " + periodlbl.Text + "        Year Level: " + yearlbl.Text));
            //pdfDoc.Add(new Paragraph(Environment.NewLine));
            //htmlparser.Parse(sr);
            //pdfDoc.Close();
            //Response.Write(pdfDoc);
            //Response.End();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //m Value="1">First Semester</asp:ListItem>
            //            <asp:ListItem Value="2">Second Semester</
            if (DropDownList1.SelectedValue == "1")
            {
                Session["prd"] = 1;
            }
            else if (DropDownList1.SelectedValue == "2")
            {
                Session["prd"] = 2;
            }
            else
            {
                Session["prd"] = 3;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrintGrades.aspx");
        }
    }
}