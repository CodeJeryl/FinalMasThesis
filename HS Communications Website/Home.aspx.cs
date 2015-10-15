using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
            }

            errorPanel.Visible = false;
            errorPanel1.Visible = false;
            errorPanelForgot.Visible = false;
        }

        private string sql = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
        private string hsSql = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(sql))
            {
                if (TextBox1.Text == "" || TextBox2.Text == "")
                {
                    errorPanel.Visible = true;
                    ErrorLbl.Text = "Input Username/Password.";
                }
                else
                {

                    string has;
                    string url = "";
                    FormsAuthenticationTicket tkt;
                    string cookiestr;
                    HttpCookie ck;

                    //SqlCommand com = new SqlCommand("Select * from students where studno = @studno " +
                    //                                "and password = @password ", con);
                    //// com.Parameters.AddWithValue("username", TxtboxUsername.Text);
                    //com.Parameters.Add("@studno", SqlDbType.Int, 10);
                    //com.Parameters["@studno"].Value = TextBox1.Text;

                    //com.Parameters.Add("@password", SqlDbType.VarChar,100);
                    //com.Parameters["@password"].Value = TextBox2.Text;

                    try
                    {
                        if (TextBox1.Text.StartsWith("5"))
                        {
                            //hs
                            SqlConnection conek1 = new SqlConnection(hsSql);

                            conek1.Close();
                            conek1.Open();

                            SqlCommand comsearch1 =
                                new SqlCommand(
                                    "Select * From LoginView where username = @userName and activated = 1",
                                    conek1);
                            comsearch1.Parameters.Add("@userName", SqlDbType.VarChar, 50);
                            comsearch1.Parameters["@userName"].Value = TextBox1.Text;
                            //   comsearch1.Parameters.Add("@password", SqlDbType.VarChar, 50); and password = @password
                          //  comsearch1.Parameters["@password"].Value = TextBox2.Text;

                            SqlDataReader rd1 = comsearch1.ExecuteReader();
                            if (rd1.Read())
                            {
                                has = rd1.GetString(3);

                                if (ValidatePassword(TextBox2.Text, has))
                                {
                                    char last = TextBox1.Text[TextBox1.Text.Length - 1];
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

                                        tkt = new FormsAuthenticationTicket(1, TextBox1.Text, DateTime.Now,
                                                                            DateTime.Now.AddMinutes(60), false, "");
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
                                        tkt = new FormsAuthenticationTicket(1, TextBox1.Text, DateTime.Now,
                                                                            DateTime.Now.AddMinutes(60), false, "");
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
                                    errorPanel.Visible = true;
                                    ErrorLbl.Text = "Incorrect Username/Password";
                                }
                            }
                            else
                            {
                                errorPanel.Visible = true;
                                ErrorLbl.Text = "Incorrect Username/Password or Account not yet activated";
                            }

                            conek1.Close();
                            rd1.Close();

                        }
                        else if (TextBox1.Text.StartsWith("4"))
                        {
                            SqlCommand studsearch = new SqlCommand("Select * from userAccounts where studno = @studno",
                                                                   con);
                            studsearch.Parameters.Add("@studno", SqlDbType.Int, 10);
                            studsearch.Parameters["@studno"].Value = TextBox1.Text;

                            con.Open();
                            SqlDataReader read = studsearch.ExecuteReader();

                            if (read.Read())
                            {
                                has = read.GetString(1);

                                if (ValidatePassword(TextBox2.Text, has))
                                {
                                    using (SqlConnection con1 = new SqlConnection(sql))
                                    {
                                        con1.Open();
                                        SqlCommand com2 = new SqlCommand("select * from periodTbl", con1);
                                        SqlDataReader rd = com2.ExecuteReader();

                                        if (rd.Read())
                                        {
                                            string per;
                                            Session["prd"] = rd.GetInt32(0).ToString();

                                            if (rd.GetInt32(0).ToString() == "1")
                                            {
                                                per = "1";
                                            }
                                            else if (rd.GetInt32(0).ToString() == "2")
                                            {
                                                per = "2";
                                            }
                                            else
                                            {
                                                per = "3";
                                            }
                                            Session["per"] = per;
                                        }
                                    }

                                    Session["Stud"] = read.GetInt32(0).ToString();
                                    System.Web.Security.FormsAuthentication.SetAuthCookie(TextBox1.Text, false);
                                    url = "College/StudentPage.aspx";
                                    // url = "Student.aspx";
                                    Response.Redirect(url,true);
                                   }
                                else
                                {
                                    errorPanel.Visible = true;
                                    ErrorLbl.Text = "Username/Password Incorrect";
                                }
                            }
                            else
                            {
                                errorPanel.Visible = true;
                                ErrorLbl.Text = "Account not yet activated. Click link below.";
                            }
                        }
                        else
                        {
                            errorPanel.Visible = true;
                            ErrorLbl.Text = "Student ID is not valid, Please try Again.";
                        }

                    }                
                    catch (Exception ex)
                    {
                        errorPanel.Visible = true;
                        ErrorLbl.Text = ex.Message;
                    }

                    con.Close();

                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                //if (Page.IsValid)
                //{
                if (studNumberTxtbox.Text.StartsWith("5"))
                {
                    errorPanel1.Visible = false;
                    SqlConnection con = new SqlConnection(hsSql);
                    SqlConnection con1 = new SqlConnection(hsSql);
                    SqlConnection conP = new SqlConnection(hsSql);
                    SqlConnection conPins = new SqlConnection(hsSql);

                    con.Close();
                    con.Open();

                    SqlCommand search = new SqlCommand("Select * from students where studentno = '" + studNumberTxtbox.Text + "'  and activated = '0'", con);
                    //and email = '" + emailAddTxtb.Text + "'
                    SqlDataReader red = search.ExecuteReader();

                    if (red.Read())
                    {
                        string midname = red.GetString(5) + red.GetString(6)[0];
                        Random x = new Random();
                        int y = x.Next();
                        int z = x.Next();

                        string hashed = CreateHash(y.ToString());
                        string hashed1 = CreateHash(z.ToString());
                        // password = "123";
                        // send password to email and insert into useraccounts
                        con1.Close();
                        con1.Open();
                        string fulln = red.GetString(4) + " " + red.GetString(6);
                        string lastn = red.GetString(6);
                        string ParentName = "Mr./Mrs. " + red.GetString(6);
                        SqlCommand ins = new SqlCommand("Insert into useraccounts values('" + studNumberTxtbox.Text + "','" + fulln + "','" + hashed + "','" + studNumberTxtbox.Text + "','" + midname + "'), ('" + studNumberTxtbox.Text + "P" + "','" + ParentName + "','" + hashed1 + "','" + studNumberTxtbox.Text + "','" + midname + "')", con1);
                        ins.ExecuteNonQuery();

                        conP.Close();
                        conP.Open();

                        SqlCommand upd = new SqlCommand("update students set activated = '1',email = '" + emailAddTxtb.Text + "' where StudentNo = '" + studNumberTxtbox.Text + "'", conP);
                        upd.ExecuteNonQuery();
                        conP.Close();

                        //insert to pdetails table
                        conPins.Close();
                        conPins.Open();
                        SqlCommand ins2 = new SqlCommand("Insert into pDetailsTbl(studno) values('" + studNumberTxtbox.Text + "')", conPins);
                        ins2.ExecuteNonQuery();
                        conPins.Close();

                        string mess = this.PopulateBodyHS(fulln, y.ToString(), studNumberTxtbox.Text, z.ToString());
                        // string mess = "Your Password: " + y.ToString() + "<br/> you can change your password after logging in.";

                        sendEmail("JerylSuarez@letranbataan.edu.ph", emailAddTxtb.Text, "", "", "Letran Bataan Student Portal Account Activation", mess);

                        errorPanel1.Visible = true;
                        Label1.Text = "Your Password has been sent to your email. If you did not receive any email, Use the Forgot Password. Thank you!";
                        //   SucLbl.Text = "Student Account and Parent Account is Successfully Activated";
                    }
                    else
                    {
                        errorPanel1.Visible = true;
                        Label1.Text = "Incorrect StudentID or already Activated!";
                    }
                }
                else if (studNumberTxtbox.Text.StartsWith("4"))
                {

                    using (SqlConnection con = new SqlConnection(sql))
                    {
                        Random x = new Random();
                        int y = x.Next();

                        con.Close();
                        con.Open();

                        SqlCommand newcom = new SqlCommand("Select * from students where studno =  @studno", con);
                        newcom.Parameters.Add("@studno", SqlDbType.Int, 10);
                        newcom.Parameters["@studno"].Value = studNumberTxtbox.Text;

                        //newcom.Parameters.Add("@bday", SqlDbType.Date);
                        //newcom.Parameters["@bday"].Value = Convert.ToDateTime(bdayTxtbox.Text);
                        SqlDataReader red = newcom.ExecuteReader();

                        if (red.Read())
                        {
                            //if (red.GetValue(24) != "") //emailadd
                            //{
                            bool val = red[40] as bool? ?? default(bool);
                            if (val)
                            {
                                errorPanel1.Visible = true;
                                Label1.Text = "Your Account is already Activated, Please Login";
                            }
                            else
                            {
                                string midname = red.GetString(7) + red.GetString(9)[0];
                                if (midname.ToUpper() == midActivateTxtbox.Text.ToUpper())
                                {
                                    errorPanel1.Visible = true;

                                    Button2.Enabled = false;
                                    SqlConnection con2 = new SqlConnection(sql);
                                    con2.Close();
                                    con2.Open();
                                    string hashed = CreateHash(y.ToString());

                                    SqlCommand ins =
                                        new SqlCommand(
                                            "Insert into userAccounts values('" + Convert.ToInt32(studNumberTxtbox.Text) +
                                            "','" + hashed + "','" + emailAddTxtb.Text + "','" + midname + "')", con2);
                                    ins.ExecuteNonQuery();


                                    SqlConnection con1 = new SqlConnection(sql);
                                    con1.Close();
                                    con1.Open();

                                    SqlCommand up =
                                        new SqlCommand(
                                            "update students set itcValidated = '" + true + "' where studno = '" +
                                            Convert.ToInt32(studNumberTxtbox.Text) + "'", con1);
                                    up.ExecuteNonQuery();
                                    string mess = this.PopulateBody(red.GetString(6), y.ToString());
                                    // string mess = "Your Password: " + y.ToString() + "<br/> you can change your password after logging in.";

                                    sendEmail("JerylSuarez@letranbataan.edu.ph", emailAddTxtb.Text, "", "",
                                              "Letran Bataan Student Portal Account Activation", mess);
                                    errorPanel1.Visible = true;
                                    Label1.Text =
                                        "Your Password has been sent to your email. If you did not receive any email, Use the Forgot Password. Thank you!";
                                    con1.Close();
                                }
                                else
                                {
                                    errorPanel1.Visible = true;
                                    Label1.Text = "Wrong Middle Name and First Character of Last name Combination";
                                }
                            }
                            //}
                            //else
                            //{
                            //    errorPanel1.Visible = true;
                            //    Label1.Text = "Call ITC, we need your Email to Activate!";
                            //}

                        }
                        else
                        {
                            errorPanel1.Visible = true;
                            Label1.Text = "Wrong Student Number";
                        }

                        con.Close();
                    }
                }
                else
                {
                    errorPanel.Visible = true;
                    ErrorLbl.Text = "Student ID is not valid, Please try Again.";
                }
                //}
            }
            catch (Exception ex1)
            {

                errorPanel1.Visible = true;
                Label1.Text = ex1.Message;
            }

        }

        private string PopulateBody(string name, string password)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Mail/CollegeSend.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{name}", name);
            body = body.Replace("{password}", password);
            return body;
        }

        private string PopulateBodyHS(string name, string password, string id, string parentpass)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Mail/Send.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{name}", name);
            body = body.Replace("{password}", password);
            body = body.Replace("{id}", id);
            body = body.Replace("{parentpass}", parentpass);
            return body;
        }


        protected void forgot1_Click(object sender, EventArgs e)
        {
            try
            {
                if (studNumberTxtbox.Text.StartsWith("5"))
                {
                    //di pa gawa,, ayusin to..
                    using (SqlConnection con = new SqlConnection(hsSql))
                    {
                        Random x = new Random();
                        int y = x.Next();

                        con.Close();
                        con.Open();

                        SqlCommand newcom =
                            new SqlCommand("Select * from userAccounts where username =  @studno and forgotp = @midname", con);
                        newcom.Parameters.Add("@studno", SqlDbType.Int, 10);
                        newcom.Parameters["@studno"].Value = studTxt3.Text;

                        newcom.Parameters.Add("@midname", SqlDbType.VarChar);
                        newcom.Parameters["@midname"].Value = midnameTxtbox.Text;

                        SqlDataReader red1 = newcom.ExecuteReader();

                        if (red1.Read())
                        {
                            //bool val = red1[41] as bool? ?? default(bool);
                            //if (val)
                            //{
                            errorPanelForgot.Visible = true;

                            Button3.Enabled = false;
                            SqlConnection con1 = new SqlConnection(hsSql);
                            con1.Close();
                            con1.Open();
                            string hashed = CreateHash(y.ToString());
                            SqlCommand up1 =
                                new SqlCommand(
                                    "update userAccounts set password = '" + hashed + "' where username = '" + Convert.ToInt32(studTxt3.Text) + "'", con1);
                            up1.ExecuteNonQuery();
                            string mess = this.PopulateBody(red1.GetInt32(0).ToString(), y.ToString());
                            //  string mess = "Your New Password: " + y.ToString() + "<br/> you can change your password after logging in.";

                            sendEmail("JerylSuarez@letranbataan.edu.ph", red1.GetString(2), "", "", "Letran Bataan Student Portal: Forgot Password", mess);
                            errorPanelForgot.Visible = true;
                            Label2.Text = "Your New Password has been sent to your email. Email will arrive within 24 hours. Thank you!";
                            con1.Close();
                            //jerylsuarez@gmail.com
                            //}
                            //else
                            //{
                            //    errorPanelForgot.Visible = true;
                            //    Label2.Text = "Validate your Account First!";
                            //}
                        }
                        else
                        {
                            errorPanelForgot.Visible = true;
                            Label2.Text = "Student Number & Middle Name did not Match!";
                        }

                        con.Close();
                    }


                }
                else if (studNumberTxtbox.Text.StartsWith("4"))
                {
                    using (SqlConnection con = new SqlConnection(sql))
                    {
                        Random x = new Random();
                        int y = x.Next();

                        con.Close();
                        con.Open();

                        SqlCommand newcom =
                            new SqlCommand("Select * from userAccounts where studno =  @studno and forgotpass = @midname", con);
                        newcom.Parameters.Add("@studno", SqlDbType.Int, 10);
                        newcom.Parameters["@studno"].Value = studTxt3.Text;

                        newcom.Parameters.Add("@midname", SqlDbType.VarChar);
                        newcom.Parameters["@midname"].Value = midnameTxtbox.Text;

                        SqlDataReader red1 = newcom.ExecuteReader();

                        if (red1.Read())
                        {
                            //bool val = red1[41] as bool? ?? default(bool);
                            //if (val)
                            //{
                            errorPanelForgot.Visible = true;

                            Button3.Enabled = false;
                            SqlConnection con1 = new SqlConnection(sql);
                            con1.Close();
                            con1.Open();
                            string hashed = CreateHash(y.ToString());
                            SqlCommand up1 =
                                new SqlCommand(
                                    "update userAccounts set password = '" + hashed + "' where studno = '" +
                                    Convert.ToInt32(studTxt3.Text) + "'", con1);
                            up1.ExecuteNonQuery();
                            string mess = this.PopulateBody(red1.GetInt32(0).ToString(), y.ToString());
                            //  string mess = "Your New Password: " + y.ToString() + "<br/> you can change your password after logging in.";

                            sendEmail("JerylSuarez@letranbataan.edu.ph", red1.GetString(2), "", "", "Letran Bataan Student Portal: Forgot Password", mess);
                            errorPanelForgot.Visible = true;
                            Label2.Text =
                                "Your New Password has been sent to your email. Email will arrive within 24 hours. Thank you!";
                            con1.Close();
                            //jerylsuarez@gmail.com
                            //}
                            //else
                            //{
                            //    errorPanelForgot.Visible = true;
                            //    Label2.Text = "Validate your Account First!";

                            //}
                        }
                        else
                        {
                            errorPanelForgot.Visible = true;
                            Label2.Text = "Student Number & Middle Name did not Match!";
                        }

                        con.Close();
                    }

                }
            }
            catch (Exception ex1)
            {
                errorPanelForgot.Visible = true;
                Label2.Text = ex1.Message;
            }


        }

        public static void sendEmail(string sender, string recepient, string bcc, string cc, string subject, string body)
        {
            MailMessage email = new MailMessage();
            email.From = new MailAddress(sender);
            email.To.Add(new MailAddress(recepient));
            if (bcc != null && bcc != "") email.Bcc.Add(new MailAddress(bcc));
            if (cc != null && bcc != "") email.CC.Add(new MailAddress(cc));

            email.Subject = subject;
            email.Body = body;
            email.IsBodyHtml = true;
            email.Priority = MailPriority.Normal;
            SmtpClient client = new SmtpClient();
            // client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential(sender, "qwerqwer21");
            client.Port = 25;
            client.Host = "mail.letranbataan.com";
            client.Send(email);

            //client.Credentials = new System.Net.NetworkCredential(sender, "");
            //client.Port = 587;
            //client.Host = "smtp.gmail.com";
            //client.Send(email);
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
    }
}