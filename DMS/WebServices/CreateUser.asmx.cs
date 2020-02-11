using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models.EntitySetupClass;
using DMS.Models.LoginClass;
using DMS.Models;
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
        DMSNEWEntities context;
        [WebMethod]
        public Dictionary<string, object> BindCountry()
        {
           context  = new DMSNEWEntities();
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_UserSetup]").With<Country>()
                            .Execute("@QueryType","BindCountry"));
            return results;
        }

        [WebMethod]
        public Dictionary<string, object> SaveEntity(string EntityDataJson)
        {
            try
            {
                context = new DMSNEWEntities();
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_UserSetup]").With<Flag>()
                          .Execute("@QueryType", "@EntityDataJson", "SaveEntity", EntityDataJson));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        [WebMethod]
        public Dictionary<string, object> BindEntityGrid(string LoadData, string SearchValue)
        {
            try
            {
                context = new DMSNEWEntities();
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_UserSetup]").With<BindEntity>().With<Count>()
                         .Execute("@QueryType","@loaddata", "@searchvalue", "BindEntityGrid", LoadData, SearchValue));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> UpdateEntity(string EntityDataJson)
        {
            try
            {
                context = new DMSNEWEntities();
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_UserSetup]").With<Flag>()
                    .Execute("@QueryType", "@EntityDataJson", "UpdateEntity", EntityDataJson));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        [WebMethod]
        public Dictionary<string, object> BindUserGrid(string LoadData, string SearchValue)
        {
            try
            {
                context = new DMSNEWEntities();
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_UserSetup]").With<BindUsers>().With<Count>()
                    .Execute("@QueryType", "@loaddata", "@searchvalue", "BindUserGrid", LoadData, SearchValue));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
    }
}
