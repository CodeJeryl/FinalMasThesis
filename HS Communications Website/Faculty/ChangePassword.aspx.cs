﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Faculty
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Panel1.Visible = false;
                ErrorPanel.Visible = false;

                var constring =
                   System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"];
                string conss = constring.ConnectionString;

                SqlConnection con = new SqlConnection(conss);
                SqlConnection con1 = new SqlConnection(conss);
                con1.Close();
                con1.Open();
                SqlCommand check = new SqlCommand("Select * from factbl where fCode = '" + Session["fcode"].ToString() + "' and password = '" + oldpassTxtbox.Text + "'", con1);
                SqlDataReader er = check.ExecuteReader();

                if (er.Read())
                {

                    con.Close();
                    con.Open();

                    SqlCommand change = new SqlCommand("Update factbl set password = '" + new1pass.Text + "' where fCode = '" + Session["fcode"] + "'", con);
                    change.ExecuteNonQuery();

                    Panel1.Visible = true;
                }
                else
                {
                    ErrorPanel.Visible = true;
                    ErrorLabel.Text = "Incorrect Old Password, Please Try Again";
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