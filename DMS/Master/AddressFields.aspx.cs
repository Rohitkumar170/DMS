using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMS.Master
{
    public partial class AddressFields : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                lblUserId.InnerText = Convert.ToString(Session["UserId"]);


            }

        }
    }
}