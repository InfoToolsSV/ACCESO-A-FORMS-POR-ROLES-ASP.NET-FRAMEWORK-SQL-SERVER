using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;

namespace INFOTOOLSSV.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            using(SqlConnection con= new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetUserByCredentials", con))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        FormsAuthentication.SetAuthCookie(username, false);
                        Session["Username"] = username;

                        Response.Redirect("~/Pages/Index.aspx");
                    }
                    else
                    {
                        reader.Close();
                        lblErrorMessage.Text = "Invalid username or password.";
                    }
                }
            }
        }
    }
}