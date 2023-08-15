using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace INFOTOOLSSV.Pages
{
    public partial class FormsAccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rptRoles.DataSource = GetRoles();
                rptRoles.DataBind();
            }
        }
        string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        private object GetRoles()
        {
            DataTable rolesTable = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetRoles", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(rolesTable);
            }
            return rolesTable;
        }

        protected void rptRoles_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView rowView = e.Item.DataItem as DataRowView;
                int roleId = Convert.ToInt32(rowView["RoleId"]);

                Repeater rptForms = e.Item.FindControl("rptForms") as Repeater;
                rptForms.DataSource = GetForms();
                rptForms.DataBind();

                foreach (RepeaterItem formItem in rptForms.Items)
                {
                    int formId = Convert.ToInt32((formItem.FindControl("hdnFormId") as HiddenField).Value);
                    CheckBox chkFormPermission = formItem.FindControl("chkFormPermission") as CheckBox;

                    bool isAllowed = GetIsAllowedValue(roleId, formId);

                    chkFormPermission.Checked = isAllowed;
                }
            }
        }

        private bool GetIsAllowedValue(int roleId, int formId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("GetIsAllowed", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RoleId", roleId);
                    cmd.Parameters.AddWithValue("@FormId", formId);

                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToBoolean(result);
                    }
                }
            }
            return false;
        }

        private object GetForms()
        {
            DataTable formsTable = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetForms", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(formsTable);
                }
            }
            return formsTable.DefaultView;
        }

        protected void btnSavePermissions_Click(object sender, EventArgs e)
        {
            int totalUpdates = 0;
            if (Session["Username"] != null)
            {
                foreach (RepeaterItem roleItem in rptRoles.Items)
                {
                    int roleId = Convert.ToInt32((roleItem.FindControl("lblRoleId") as Label).Text);

                    foreach (RepeaterItem formItem in (roleItem.FindControl("rptForms") as Repeater).Items)
                    {
                        int formId = Convert.ToInt32((formItem.FindControl("hdnFormId") as HiddenField).Value);

                        CheckBox chkFormPermission = formItem.FindControl("chkFormPermission") as CheckBox;

                        bool isChecked = chkFormPermission.Checked;

                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            using (SqlCommand cmd = new SqlCommand("UpdateRolePermissionMapping", con))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("@IsAllowed", isChecked);
                                cmd.Parameters.AddWithValue("@RoleId", roleId);
                                cmd.Parameters.AddWithValue("@FormId", formId);

                                con.Open();
                                int rowsAffected = cmd.ExecuteNonQuery();
                                con.Close();

                                totalUpdates += rowsAffected;
                            }
                        }
                    }

                }
            }

            if (totalUpdates > 0)
            {
                lblMessage.Text = "Pemissions saved successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Error!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}