using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Admin
{
    public partial class ManageEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void update_click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {

                    if (StudTxt.Text.StartsWith("5"))
                    {
                        var constr =
                           System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"].
                               ConnectionString;

                        SqlConnection con = new SqlConnection(constr);
                        SqlConnection con1 = new SqlConnection(constr);

                        con.Close();
                        con.Open();
                        SqlCommand check =
                            new SqlCommand(
                                "select Username,forgotp from userAccounts where username = '" +
                                Convert.ToInt32(StudTxt.Text) + "' and forgotp = '" + TextBox1.Text + "'", con);
                        SqlDataReader rdd = check.ExecuteReader();

                        if (rdd.Read())
                        {
                            Random x = new Random();
                            int y = x.Next();
                            string mess = this.PopulateBody(rdd.GetInt32(0).ToString(), y.ToString());
                            con.Close();
                            string hashed = CreateHash(y.ToString());
                            SqlCommand upd =
                                new SqlCommand(
                                    "update students set email = '" + StudEmailTxt.Text + "' where studentNo = '" + Convert.ToInt32(StudTxt.Text) + "'", con);
                            con.Open();
                            upd.ExecuteNonQuery();
                           
                            SqlCommand upd1 = new SqlCommand("update UserAccounts set password = '" + hashed + "' where userName = '" + Convert.ToInt32(StudTxt.Text) + "'", con1);
                            con1.Open();
                            upd1.ExecuteNonQuery();

                            sendEmail("JerylSuarez@letranbataan.edu.ph", StudEmailTxt.Text, "", "",
                                      "Letran Bataan Student Portal: New Password", mess);
                            
                            Panel1.Visible = true;
                            errorLabel.Text = "Student/Parent Number: " + StudTxt.Text +
                                              " Email Address has <br/> been  changed to " + StudEmailTxt.Text +
                                              " and password has been sent to email!";
                        }
                        else
                        {
                            Panel1.Visible = true;
                            errorLabel.Text = "Student Number not yet Activated or ForgotPassword did not match, <br/> Please Try Again!";
                        }
                    }
                    else if (StudTxt.Text.StartsWith("4"))
                    {
                        var constr =
                            System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].
                                ConnectionString;

                        SqlConnection conek = new SqlConnection(constr);
                        conek.Close();
                        conek.Open();
                        SqlCommand check =
                            new SqlCommand(
                                "select studno,forgotpass from userAccounts where studno = '" +
                                Convert.ToInt32(StudTxt.Text) + "' and forgotpass = '" + TextBox1.Text + "'", conek);
                        SqlDataReader rdd = check.ExecuteReader();

                        if (rdd.Read())
                        {
                            Random x = new Random();
                            int y = x.Next();
                            string mess = this.PopulateBody(rdd.GetInt32(0).ToString(), y.ToString());
                            conek.Close();
                            string hashed = CreateHash(y.ToString());
                            SqlCommand upd =
                                new SqlCommand(
                                    "update useraccounts set email = '" + StudEmailTxt.Text + "', password = '" + hashed +
                                    "' where studno = '" + Convert.ToInt32(StudTxt.Text) + "'", conek);
                            conek.Open();
                            upd.ExecuteNonQuery();

                            sendEmail("JerylSuarez@letranbataan.edu.ph", StudEmailTxt.Text, "", "",
                                      "Letran Bataan Student Portal: New Password", mess);
                            
                            Panel1.Visible = true;
                            errorLabel.Text = "Student Number: " + StudTxt.Text +
                                              " Email Address has <br/> been  changed to " + StudEmailTxt.Text +
                                              " and password has been sent to email!";
                        }
                        else
                        {
                            Panel1.Visible = true;
                            errorLabel.Text = "Student Number not Found, <br/> Please Try Again!";
                        }
                    }
                }
            }
            catch (Exception eex)
            {
                Panel1.Visible = true;
                errorLabel.Text = eex.Message;
            }
        }

        protected void StudTxt_TextChanged(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            errorLabel.Text = "";
        }


        private string PopulateBody(string name, string password)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Mail/Send.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{name}", name);
            body = body.Replace("{password}", password);
            return body;
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