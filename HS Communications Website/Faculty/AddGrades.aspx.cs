using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Faculty
{
    public partial class AddGrades : System.Web.UI.Page
    {
        private bool a1;
        private bool b2;
        private bool c3;
        private bool d4;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (!IsPostBack)
                    subLbl.Text = Session["subcode"].ToString();
                secLbl.Text = Session["sectno"].ToString();
                //    teachLbl.Text = Session["teachername"].ToString();

                var constring =
                       System.Configuration.ConfigurationManager.ConnectionStrings["HsDbConnectionString"];
                string conss = constring.ConnectionString;

                SqlConnection con = new SqlConnection(conss);

                con.Close();
                con.Open();
                SqlCommand check = new SqlCommand("Select d1,d2,d3,d4 from smtr", con);
                SqlDataReader er = check.ExecuteReader();

                if (er.Read())
                {

                    a1 = !Convert.ToBoolean(er.GetString(0));
                    b2 = !Convert.ToBoolean(er.GetString(1));
                    c3 = !Convert.ToBoolean(er.GetString(2));
                    d4 = !Convert.ToBoolean(er.GetString(3));

                }
                con.Close();
                con.Open();

                SqlDataAdapter dap = new SqlDataAdapter("Select fromGrades from gradeRangeTbl", con);

                dap.Fill(ds);

                codeA = (int)ds.Tables[0].Rows[0][0];
                codeB = (int)ds.Tables[0].Rows[1][0];
                codeC = (int)ds.Tables[0].Rows[2][0];
                codeD = (int)ds.Tables[0].Rows[3][0];

            }
            catch (Exception ex)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ex.Message;
            }
        }

        private DataSet ds = new DataSet();
        private int codeA;
        private int codeB;
        private int codeC;
        private int codeD;

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            ErrorPanel.Visible = false;
           
            InsertEqui.Visible = true;
            UpdateButton.Visible = false;
            updatebtn();
        }

        private void updatebtn()
        {
            originalDataTable = (System.Data.DataTable)ViewState["originalValuesDataTable"];

            foreach (GridViewRow r in GridView1.Rows)
                if (IsRowModified(r))
                {
                    GridView1.UpdateRow(r.RowIndex, false);
                }

            // Rebind the Grid to repopulate the original values table.
            tableCopied = false;
            GridView1.DataBind();
        }

        protected bool IsRowModified(GridViewRow r)
        {
            int currentID;
            string first;
            string second;
            string third;
            string fourth;

            currentID = Convert.ToInt32(GridView1.DataKeys[r.RowIndex].Value);

            first = ((TextBox)r.FindControl("firstTxtbox")).Text;
            second = ((TextBox)r.FindControl("secondTxtbox")).Text;
            third = ((TextBox)r.FindControl("thirdTxtbox")).Text;
            fourth = ((TextBox)r.FindControl("fourthTxtbox")).Text;


            System.Data.DataRow row =
                originalDataTable.Select(String.Format("SMTRID = {0}", currentID))[0];

            if (!first.Equals(row["first"].ToString())) { return true; }
            if (!second.Equals(row["second"].ToString())) { return true; }
            if (!third.Equals(row["third"].ToString())) { return true; }
            if (!fourth.Equals(row["fourth"].ToString())) { return true; }

            return false;
        }

        private bool tableCopied = false;
        private System.Data.DataTable originalDataTable;

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {

                e.Row.Cells[1].Enabled = a1;
                e.Row.Cells[2].Enabled = b2;
                e.Row.Cells[3].Enabled = c3;
                e.Row.Cells[4].Enabled = d4;



                if (e.Row.RowType == DataControlRowType.DataRow)
                    if (!tableCopied)
                    {
                        originalDataTable = ((System.Data.DataRowView)e.Row.DataItem).Row.Table.Copy();
                        ViewState["originalValuesDataTable"] = originalDataTable;
                        tableCopied = true;
                    }
                
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DataRow dr = ((DataRowView)e.Row.DataItem).Row;

                    int a;
                    bool isNumeric = int.TryParse(dr["first"].ToString(), out a);
                    if (a > 1 && a < 70)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                    else if (a > 100)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                    if (isNumeric)
                    {
                        if (a >= codeA)
                        {
                            ((TextBox)e.Row.FindControl("firstTxtbox")).Text = dr["first"] + "(A)";
                        }
                        else if (a >= codeB)
                        {
                            ((TextBox)e.Row.FindControl("firstTxtbox")).Text = dr["first"] + "(P)";
                        }
                        else if (a >= codeC)
                        {
                            ((TextBox)e.Row.FindControl("firstTxtbox")).Text = dr["first"] + "(AP)";
                        }
                        else if (a >= codeD)
                        {
                            ((TextBox)e.Row.FindControl("firstTxtbox")).Text = dr["first"] + "(D)";
                        }
                        else
                        {
                            ((TextBox)e.Row.FindControl("firstTxtbox")).Text = dr["first"] + "(B)";
                        }
                    }

                    int b;
                    bool isNumeric2 = int.TryParse(dr["second"].ToString(), out b);
                    if (b > 1 && b < 70)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                    else if (b > 100)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                    if (isNumeric2)
                    {
                        if (b >= codeA)
                        {
                            ((TextBox)e.Row.FindControl("secondTxtbox")).Text = dr["second"] + "(A)";
                        }
                        else if (b >= codeB)
                        {
                            ((TextBox)e.Row.FindControl("secondTxtbox")).Text = dr["second"] + "(P)";
                        }
                        else if (b >= codeC)
                        {
                            ((TextBox)e.Row.FindControl("secondTxtbox")).Text = dr["second"] + "(AP)";
                        }
                        else if (b >= codeD)
                        {
                            ((TextBox)e.Row.FindControl("secondTxtbox")).Text = dr["second"] + "(D)";
                        }
                        else
                        {
                            ((TextBox)e.Row.FindControl("secondTxtbox")).Text = dr["second"] + "(B)";
                        }
                    }

                    int c;
                    bool isNumeric3 = int.TryParse(dr["third"].ToString(), out c);
                    if (c > 1 && c < 70)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                    else if (c > 100)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                
                    if (isNumeric3)
                    {
                        if (c >= codeA)
                        {
                            ((TextBox)e.Row.FindControl("thirdTxtbox")).Text = dr["third"] + "(A)";
                        }
                        else if (c >= codeB)
                        {
                            ((TextBox)e.Row.FindControl("thirdTxtbox")).Text = dr["third"] + "(P)";
                        }
                        else if (c >= codeC)
                        {
                            ((TextBox)e.Row.FindControl("thirdTxtbox")).Text = dr["third"] + "(AP)";
                        }
                        else if (c >= codeD)
                        {
                            ((TextBox)e.Row.FindControl("thirdTxtbox")).Text = dr["third"] + "(D)";
                        }
                        else
                        {
                            ((TextBox)e.Row.FindControl("thirdTxtbox")).Text = dr["third"] + "(B)";
                        }
                    }

                    int d;
                    bool isNumeric4 = int.TryParse(dr["fourth"].ToString(), out d);
                    if (d > 1 && d < 70)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                    else if (d > 100)
                    {
                        ErrorPanel.Visible = true;
                        ErrorLabel.Text = "Enter grades between 70-100 only. ";
                        InsertEqui.Visible = true;
                        UpdateButton.Visible = false;
                        return;
                    }
                    if (isNumeric4)
                    {
                        if (d >= codeA)
                        {
                            ((TextBox)e.Row.FindControl("fourthTxtbox")).Text = dr["fourth"] + "(A)";
                        }
                        else if (d >= codeB)
                        {
                            ((TextBox)e.Row.FindControl("fourthTxtbox")).Text = dr["fourth"] + "(P)";
                        }
                        else if (d >= codeC)
                        {
                            ((TextBox)e.Row.FindControl("fourthTxtbox")).Text = dr["fourth"] + "(AP)";
                        }
                        else if (d >= codeD)
                        {
                            ((TextBox)e.Row.FindControl("fourthTxtbox")).Text = dr["fourth"] + "(D)";
                        }
                        else
                        {
                            ((TextBox)e.Row.FindControl("fourthTxtbox")).Text = dr["fourth"] + "(B)";
                        }
                    }
                }
            }
            catch (Exception ee)
            {
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ee.Message;
            }
        }
        protected void InsertEqui_Click(object sender, EventArgs e)
        {
            ErrorPanel.Visible = false;
            UpdateButton.Visible = true;
            InsertEqui.Visible = false;
            updatebtn();
        }
    }
}