using System;

namespace Cake_ordering_asp_project
{
    public partial class AdminLogout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Remove("AdminId");
            Session.Remove("AdminUsername");
            Session.Remove("AdminName");

            Response.Redirect("AdminLogin.aspx");
        }
    }
}