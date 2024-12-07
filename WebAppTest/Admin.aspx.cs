using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Xml.Linq;

namespace WebAppTest
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VisUkeMenyAdmin();
        }

        protected void ButtonLagre_Click(object sender, EventArgs e)
        {
            var connectionString = ConfigurationManager.ConnectionStrings["ConnCms"].ConnectionString;
            //DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("Update UkeMeny (Rett, pris) VALUES (@0, @1) where Id = @2;", conn);
                command.Parameters.Add(new SqlParameter("@0", "ost"));
                command.Parameters.Add(new SqlParameter("@1", 10));
                command.Parameters.Add(new SqlParameter("@2", 1));
                command.CommandType = CommandType.Text;

                command.ExecuteNonQuery();


                conn.Close();
            }


        }

        private void VisUkeMenyAdmin()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["ConnCms"].ConnectionString;
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("Select rett, pris From UkeMeny", conn);
                cmd.CommandType = CommandType.Text;

                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
                reader.Close();
                conn.Close();
            }


            TBrettMan.Text = dt.Rows[0][0].ToString();
            TBrettTir.Text = dt.Rows[1][0].ToString();
            TBrettOns.Text = dt.Rows[2][0].ToString();
            TBrettTor.Text = dt.Rows[3][0].ToString();
            TBrettFre.Text = dt.Rows[4][0].ToString();


            TBprisMan.Text = dt.Rows[0][1].ToString();
            TBprisTir.Text = dt.Rows[1][1].ToString();
            TBprisOns.Text = dt.Rows[2][1].ToString();
            TBprisTor.Text = dt.Rows[3][1].ToString();
            TBprisFre.Text = dt.Rows[4][1].ToString();
        }
    }

}