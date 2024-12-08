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
            // Check if user is authenticated
            if (Session["Authenticated"] == null || !(bool)Session["Authenticated"])
            {
                if (Request.HttpMethod == "POST")
                {
                    // Handle password submission
                    string password = Request.Form["password"];

                    if (password == "1") // Replace with actual password logic
                    {
                        Session["Authenticated"] = true; // Mark user as authenticated
                        Response.Redirect(Request.RawUrl); // Reload page to continue without the password form
                    }
                    else
                    {
                        Response.Write("<p style='color:red;'>Feil passord.</p>");
                    }
                }
                else
                {
                    // Render password form
                    Response.Write(@"
                                    <form method='post'>
                                        <label for='password'>Skriv in passord:</label>
                                        <input type='password' id='password' name='password' />
                                        <input type='Submit' value='OK' />
                                    </form>
                                 ");
                }

                Response.End(); // Stop further processing of the page
            }

            // Continue processing the page for authenticated users
            if (!Page.IsPostBack)
            {
                VisUkeMenyAdmin();
            }
        }

        protected void ButtonLagre_Click(object sender, EventArgs e)
        {
            var connectionString = ConfigurationManager.ConnectionStrings["ConnCms"].ConnectionString;
            //DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                LagreDag(conn, 1, TBrettMan.Text, TBprisMan.Text);
                LagreDag(conn, 2, TBrettTir.Text, TBprisTir.Text);
                LagreDag(conn, 3, TBrettOns.Text, TBprisOns.Text);
                LagreDag(conn, 4, TBrettTor.Text, TBprisTor.Text);
                LagreDag(conn, 5, TBrettFre.Text, TBprisFre.Text);

                conn.Close();
            }

        }

        private static void LagreDag(SqlConnection conn, int Dag, string strRett, string strPris)
        {
            SqlCommand command = new SqlCommand($"Update UkeMeny SET Rett = '{strRett}', pris = {strPris} where Id = {Dag};", conn);

            command.CommandType = CommandType.Text;

            command.ExecuteNonQuery();
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