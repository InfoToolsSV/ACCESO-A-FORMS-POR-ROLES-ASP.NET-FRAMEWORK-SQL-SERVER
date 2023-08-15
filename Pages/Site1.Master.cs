using INFOTOOLSSV.Helpers;
using System;
using System.Web.Security;

namespace INFOTOOLSSV.Pages
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string currentUser = Session["Username"].ToString();
                string currentFormName = System.IO.Path.GetFileNameWithoutExtension(Request.Url.AbsolutePath);

                if (!PermissionHelper.HasPermission(currentUser, currentFormName))

                    Response.Redirect("~/Pages/UnauthorizedAccess.aspx");
            }
            //AGREGADO EL ELSE PARA DENEGAR ACCESO A USUARIOS NO AUTENTICADOS
            else
                Response.Redirect("~/Pages/Login.aspx");

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                FormsAuthentication.SignOut();
                Session.Clear();
                Session.Abandon();

                Response.Redirect("~/Pages/Login.aspx");
            }
        }
    }
}