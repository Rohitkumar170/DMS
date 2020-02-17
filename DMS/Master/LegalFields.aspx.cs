using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMS.Master
{
    public partial class LegalFields : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"].ToString() == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {

                lblUserId.InnerText = Session["UserId"].ToString();
            }
        }
    }
}