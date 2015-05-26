using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Portal
{
    public partial class Inbox : System.Web.UI.Page
    {
        string conString =
             ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
   
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);

            try
            {
                HiddenField hid = (HiddenField)(e.Item.FindControl("HiddenField1"));

                if (e.CommandName == "read")
                {
                    con.Close();
                    con.Open();

                    SqlCommand qw =
                        new SqlCommand("update personalMsgtbl set status = 'read' where msgID = '" + hid.Value + "'",
                                       con);
                    qw.ExecuteNonQuery();

                    con.Close();
                    Session["msgid"] = hid.Value;
                    Response.Redirect("ReplyMessage.aspx");

                }

                if (e.CommandName == "del")
                {
                    con.Close();
                    con.Open();

                    SqlCommand qw = new SqlCommand("delete from personalMsgTbl where ID = '" + hid.Value + "'", con);
                    qw.ExecuteNonQuery();
                    ErrorPanel.Visible = true;
                    ErrorLabel.Text = "Message successfully Deleted!";


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