using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace INFOTOOLSSV.Helpers
{
    public class PermissionHelper
    {
        internal static bool HasPermission(string currentUser, string currentFormName)
        {
            int roleId = GetRoleIdByUsername(currentUser);
            int formId = GetFormIdByName(currentFormName);

            if (roleId != -1 && formId != -1)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("GetPermissionCount", con))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@RoleId", roleId);
                        cmd.Parameters.AddWithValue("@FormId", formId);

                        int hasPermission = Convert.ToInt32(cmd.ExecuteScalar());

                        return hasPermission > 0;
                    }
                }
            }
            return false;
        }

        private static int GetFormIdByName(string currentFormName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("GetFormIdByName", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FormName", currentFormName);

                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToInt32(result);
                    }
                }
            }
            return -1;
        }

        private static int GetRoleIdByUsername(string currentUser)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("GetRoleIdByUserName", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", currentUser);

                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return Convert.ToInt32(result);
                    }
                }
            }
            return -1;
        }
    }
}