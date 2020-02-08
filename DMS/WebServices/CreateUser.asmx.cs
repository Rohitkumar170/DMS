using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models.EntitySetupClass;
namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for CreateUser
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class CreateUser : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        [WebMethod]
        public Dictionary<string, object> BindCountry()
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_UserSetup]").With<Country>()
                            .Execute("@QueryType","BindCountry"));
            return results;
        }
    }
}
