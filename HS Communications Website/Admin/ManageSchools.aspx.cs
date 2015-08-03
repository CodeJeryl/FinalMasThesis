using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace HS_Communications_Website.Admin
{
    public partial class ManageSchools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        string conss = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(conss);
                SqlConnection con1 = new SqlConnection(conss);

                con1.Close();
                con1.Open();
                SqlCommand sea = new SqlCommand("Select school from schoolTbl where school = '"+TextBox1.Text+"'",con1);
                SqlDataReader rd = sea.ExecuteReader();

                if(rd.Read())
                {
                    Panel1.Visible = false;
                    ErrorPanel.Visible = true;
                    ErrorLabel.Text = TextBox1+ " - School already exist!";

                    TextBox1.Text = "";
                    TextBox2.Text = "";
                }
                else
                {
                    ErrorPanel.Visible = false;
                con.Close();
                con.Open();

                SqlCommand com = new SqlCommand("Insert into schoolTbl values('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
                com.ExecuteNonQuery();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    ListView1.DataBind();
                Panel1.Visible = true;
                }
            }
            catch (Exception ex)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ex.Message;
            }
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(conss); 
            HiddenField hid = (HiddenField)(e.Item.FindControl("HiddenField1"));
            if (e.CommandName == "del")
            {
                con.Close();
                con.Open();

                SqlCommand qw = new SqlCommand("delete from schoolTbl where ID = '" + hid.Value + "'", con);
                qw.ExecuteNonQuery();
                ErrorPanel.Visible = true;
                ErrorLabel.Text = "School successfully Deleted!";
                //   SyllaUploadListview.DataBind();
                ListView1.DataBind();
                //  dataload();

            }
        }
    }
}