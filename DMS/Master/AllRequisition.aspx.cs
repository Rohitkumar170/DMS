using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DMS.Master
{
    public partial class AllRequisition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserId"] == null)
            {
                Response.Redirect("../login.aspx");
            }
            if (!IsPostBack)
            {

                //lblUserName.InnerText = Convert.ToString(Session["UserName"]);
                lblUserId.InnerText = Convert.ToString(Session["UserId"]);
                //lblwarehouseid.InnerText = Convert.ToString(Session["WareHouseId"]);

            }

        }
    }
}