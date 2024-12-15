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
using System.Web.Services.Description;
using System.Collections;

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
                VisFasteVarerAdmin();


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
            SqlCommand command = new SqlCommand($"Update UkeMeny SET Rett = @strRett, pris = @strPris where Id = @Dag;", conn);

            command.Parameters.AddWithValue("@strRett", strRett);
            command.Parameters.AddWithValue("@strPris", strPris);
            command.Parameters.AddWithValue("@Dag", Dag);

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

        private void VisFasteVarerAdmin()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["ConnCms"].ConnectionString;
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("SELECT name, pris, Id from Meny", conn);
                cmd.CommandType = CommandType.Text;

                SqlDataReader reader = cmd.ExecuteReader();
                dt.Load(reader);
                reader.Close();
                conn.Close();
            }

            lvFastevarerAdmin.DataSource = dt;
            lvFastevarerAdmin.DataBind();
        }
        protected void LagreFasteVarer(SqlConnection conn, string name, float pris, int Id)
        {

            string query = "UPDATE Meny SET name=@name, pris=@pris WHERE Id=@Id";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Id", Id);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@pris", pris);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        protected void LeggTilFasteVarer(SqlConnection conn, string name, float pris)
        {

            string query = "Insert into Meny([name],[pris]) Values(@name, @pris)";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@pris", pris);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        protected void lvFastevarerAdmin_ItemEditing(Object sender, ListViewEditEventArgs e)
        {
            lvFastevarerAdmin.EditIndex = e.NewEditIndex;
            VisFasteVarerAdmin();
        }

        protected void lvFastevarerAdmin_ItemCanceling(Object sender, ListViewCancelEventArgs e)
        {
            lvFastevarerAdmin.EditIndex = -1;
            VisFasteVarerAdmin();
        }
        protected void lvFastevarerAdmin_ItemUpdating(Object sender, ListViewUpdateEventArgs e)
        {

            var name = e.NewValues["Name"].ToString();
            var Id = lvFastevarerAdmin.EditIndex + 1; //index i db begynner på 1
            float pris;
            if (!float.TryParse(e.NewValues["Pris"].ToString(), out pris)) pris = 0;

            var connectionString = ConfigurationManager.ConnectionStrings["ConnCms"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                LagreFasteVarer(conn, name, pris, Id);
            }

            lvFastevarerAdmin.EditIndex = -1;
            VisFasteVarerAdmin();
        }
        protected void lvFastevarerAdmin_OnItemDeleting(Object sender, ListViewDeleteEventArgs e) 
        {

            /*int id = e.ItemIndex - 1;*/  //index i db begynner på 1
            var id = e.Values["Id"].ToString();
            var connectionString = ConfigurationManager.ConnectionStrings["ConnCms"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Meny WHERE Id=@Id";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            VisFasteVarerAdmin();
        }
        protected void lvFastevarerAdmin_ItemInserting(Object sender, ListViewInsertEventArgs e)
        {
            var name = e.Values["Name"].ToString();
            float pris;
            if (!float.TryParse(e.Values["Pris"].ToString(), out pris)) pris = 0;

            var connectionString = ConfigurationManager.ConnectionStrings["ConnCms"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                LeggTilFasteVarer(conn, name, pris);
            }

            lvFastevarerAdmin.EditIndex = -1;
            VisFasteVarerAdmin();
        }
    }
}
