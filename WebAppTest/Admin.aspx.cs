using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppTest
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VisUkeMenyAdmin();
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