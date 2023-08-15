using System;
using System.Configuration;
using System.Data.SqlClient;

namespace INFOTOOLSSV.Pages
{
    public partial class FormsControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegisterForm_Click(object sender, EventArgs e)
        {
            string formPath = txtFormPath.Text;
            string formName = txtFormName.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

            if (Session["Username"] != null)
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("InsertForm", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@FormPath", formPath);
                        cmd.Parameters.AddWithValue("@FormName", formName);
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        con.Close();

                        if (rowsAffected > 0)
                            lblMessage.Text = "Form registrado exitosamente!";
                        else
                            lblMessage.Text = "Form no registrado!";
                    }
                }
            }
            //AGREGADO PARA VACIAR CAMPOS DE TEXTO DESPUES DE EJECUTAR EVENTO
            txtFormName.Text = "";
            txtFormPath.Text = "";
        }
    }
}