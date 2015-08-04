using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Portal
{
    public partial class GradesViewer : System.Web.UI.Page
    {
  
                     
        string conss = System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con1 = new SqlConnection(conss);

                con1.Close();
                con1.Open();

                SqlCommand avg = new SqlCommand("Select AVG(Convert(decimal,LEFT(first, 2))),avg(Convert(decimal,LEFT(second, 2))),avg(Convert(decimal,LEFT(third, 2))),avg(Convert(decimal,LEFT(fourth, 2))) from gradesviewer where studno = '" + Session["studno"] + "'", con1);
                SqlDataReader rd = avg.ExecuteReader();

                
                if(rd.Read())
                {
             if (!rd.IsDBNull(0))  firstAve.Text = rd.GetDecimal(0).ToString("#.##");
             if (!rd.IsDBNull(1)) secondAve.Text = rd.GetDecimal(1).ToString("#.##");
             if (!rd.IsDBNull(2)) thirdAve.Text = rd.GetDecimal(2).ToString("#.##");
             if (!rd.IsDBNull(3)) fourthAve.Text = rd.GetDecimal(3).ToString("#.##");
  
                    if(!rd.IsDBNull(0) && !rd.IsDBNull(1) && !rd.IsDBNull(2) && !rd.IsDBNull(3))
                        genAve.Text = ((rd.GetDecimal(0) + rd.GetDecimal(1) + rd.GetDecimal(2) + rd.GetDecimal(3)) / 4).ToString("#.##");
                }

                con1.Close();


                //con1.Open();
                //SqlCommand check = new SqlCommand("Select d1,d2,d3,d4 from smtr", con1);
                //SqlDataReader er = check.ExecuteReader();

                //if (er.Read())
                //{



                //}
                
            }
            catch (Exception ex)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ex.Message;
            }


        }

        protected void ListView1_ItemCreated(object sender, ListViewItemEventArgs e)
        {
            try
            {
                

                SqlConnection con = new SqlConnection(conss);

                con.Close();
                con.Open();
                SqlCommand check = new SqlCommand("Select d1,d2,d3,d4 from smtr", con);
                SqlDataReader er = check.ExecuteReader();

                if (er.Read())
                {
                    Label lab1 = (Label)(e.Item.FindControl("firstLabel"));
                    Label lab2 = (Label)(e.Item.FindControl("secondLabel"));
                    Label lab3 = (Label)(e.Item.FindControl("thirdLabel"));
                    Label lab4 = (Label)(e.Item.FindControl("fourthLabel"));
                    Label lab5 = (Label)(e.Item.FindControl("Label1"));

                    
                    
                    lab1.Visible = Convert.ToBoolean(er.GetString(0));
                    lab2.Visible = Convert.ToBoolean(er.GetString(1));
                    lab3.Visible = Convert.ToBoolean(er.GetString(2));
                    lab4.Visible = Convert.ToBoolean(er.GetString(3));
                    lab5.Visible = Convert.ToBoolean(er.GetString(3));

                    q.Visible =Convert.ToBoolean(er.GetString(0));
                    w.Visible = Convert.ToBoolean(er.GetString(1));
                    ee.Visible = Convert.ToBoolean(er.GetString(2));
                    r.Visible = Convert.ToBoolean(er.GetString(3));
                    t.Visible = Convert.ToBoolean(er.GetString(3));

                    firstAve.Visible = Convert.ToBoolean(er.GetString(0));
                    secondAve.Visible = Convert.ToBoolean(er.GetString(1));
                    thirdAve.Visible = Convert.ToBoolean(er.GetString(2));
                    fourthAve.Visible = Convert.ToBoolean(er.GetString(3));
                    genAve.Visible = Convert.ToBoolean(er.GetString(3)); 

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