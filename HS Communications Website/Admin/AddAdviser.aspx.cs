using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Admin
{
    public partial class AddAdviser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
         protected void AdviserBtn_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            ErrorPanel.Visible = false;
            var strcon = ConfigurationManager.ConnectionStrings["HsDbConnectionString"];
            string conString = strcon.ConnectionString;
            
            SqlConnection con = new SqlConnection(conString);

            con.Close();
            con.Open();

            //insert all parent/student
            SqlCommand update2 =
                new SqlCommand("Update section set AdviserFcode = '"+DropDownList3.SelectedValue+"' where Sectno = '"+DropDownList2.Text+"'", con);
            update2.ExecuteNonQuery();

            con.Close();

            con.Open();

            SqlCommand update1 = new SqlCommand("Update FacTbl set Adviser = 'true', Advisory = '" + DropDownList2.SelectedValue + "' where fCode = '" + DropDownList3.SelectedValue + "'", con);
            update1.ExecuteNonQuery();

            Label1.Text = "Adviser Successfully Assigned!";
            Panel1.Visible = true;
        }
        }
    }
