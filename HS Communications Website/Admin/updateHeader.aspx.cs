using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HS_Communications_Website.Admin
{
    public partial class updateHeader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string conString = ConfigurationManager.ConnectionStrings["HsDbConnectionString"].ConnectionString;
        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            ErrorPanel.Visible = false;

            string filePath = FileUpload1.PostedFile.FileName;

            string filename = Path.GetFileName(filePath);

            string ext = Path.GetExtension(filename);

            string contenttype = String.Empty;



            //Set the contenttype based on File Extension

            switch (ext)
            {

               
                case ".png":

                    contenttype = "image/png";

                    break;

            }

            if (contenttype != String.Empty)
            {



                Stream fs = FileUpload1.PostedFile.InputStream;

                BinaryReader br = new BinaryReader(fs);

                Byte[] bytes = br.ReadBytes((Int32)fs.Length);



                //insert the file into database

                string strQuery = "insert into headerTbl(ContentType, Data, status)" +

                   " values (@ContentType, @Data, 'active')";

                SqlCommand cmd = new SqlCommand(strQuery);
                
                cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value

                  = contenttype;

                cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;

                SqlConnection con1 = new SqlConnection(conString);

                con1.Close();
                con1.Open();
                SqlCommand up = new SqlCommand("Update headertbl set status = 'inactive'",con1);
                up.ExecuteNonQuery();
                con1.Close();

                InsertUpdateData(cmd);

                Panel1.Visible = true; 

            }

            else
            {

                ErrorPanel.Visible = true;
                ErrorLabel.Text = "File format not recognized. Upload Png format only";


            }
        }



        private Boolean InsertUpdateData(SqlCommand cmd)
        {

            SqlConnection con = new SqlConnection(conString);

            cmd.CommandType = CommandType.Text;

            cmd.Connection = con;

            try
            {

                con.Open();

                cmd.ExecuteNonQuery();

                return true;

            }

            catch (Exception ex)
            {

               
                ErrorPanel.Visible = true;
                ErrorLabel.Text = ex.Message;
                return false;

            }

            finally
            {

                con.Close();

                con.Dispose();

            }

        }

    }
}