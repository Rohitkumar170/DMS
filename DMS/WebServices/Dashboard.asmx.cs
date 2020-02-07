using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace DealerManagementSystem.WebServices
{
    /// <summary>
    /// Summary description for Dashboard
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Dashboard : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public void Logout()
        {

            System.Web.HttpContext.Current.Session["UserID"] = null;
            Session.Abandon();
            Session.Clear();


        }
    }
}
