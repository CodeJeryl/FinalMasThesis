﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Admin
{
    public partial class Message : System.Web.UI.Page
    {

        string conss =
          ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;

        Boolean parent;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["msgid"] == null)
                {
                    Response.Redirect("AdminHomepage.aspx");
                }
                else
                {
                    SqlConnection con = new SqlConnection(conss);

                    con.Close();
                    con.Open();
                    SqlCommand check = new SqlCommand("Select * from personalMsgTbl where MsgId = '" + Convert.ToInt32(Session["msgid"].ToString()) + "'", con);
                    SqlDataReader er = check.ExecuteReader();

                    if (er.Read())
                    {
                        titleLbl.Text = er.GetString(3);
                        bodyLbl.Text = er.GetString(4).Replace(Environment.NewLine, "<br/>");
                        fromLbl.Text = er.GetString(2);
                        dateLbl.Text = er.GetDateTime(5).ToString();
                        parent = er.GetBoolean(8);
                    }
                    else
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Please choose a message from Inbox";
                    }
                }
            }
            catch (Exception ee)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ee.Message;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Panel1.Visible = false;
                ErrorPanel.Visible = false;

                SqlConnection con = new SqlConnection(conss);
                SqlConnection con1 = new SqlConnection(conss);

                string titl = "RE: " + titleLbl.Text;
                con.Close();
                con.Open();

                //insert all parent/student
                SqlCommand ins =
                    new SqlCommand(
                        "Insert into personalMsgTbl values('" + Session["studid"] + "','" + Session["name"].ToString() + "','" +
                         titl + "','" + repTxtbox.Text + "',@datee,'true','Unread','"+ parent +"')", con);
                ins.Parameters.Add("@datee", SqlDbType.DateTime).Value = DateTime.Now;
                ins.ExecuteNonQuery();

                con.Close();

                Panel1.Visible = true;

                repTxtbox.Text = "";
                con.Close();

                con1.Open();
                SqlCommand qw1 = new SqlCommand("update personalMsgtbl set status = 'replied' where msgID = '" + Convert.ToInt32(Session["msgid"].ToString()) + "'", con1);
                qw1.ExecuteNonQuery();

                con1.Close();


            }
            catch (Exception ex)
            {

                ErrorPanel.Visible = true;
                ErrorLabel.Text = ex.Message;

            }
        }
    }
}