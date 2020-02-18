using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models.ItemSetupClass;
using DMS.Models;
using DMS.Models.EntitySetupClass;

namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for ItemSetup
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class ItemSetup : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();

        [WebMethod]
        public Dictionary<string, object> BindEntitydDetails()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_ItemSetup]").With<Country>().With<BindEntity>()
                       .Execute("@QueryType", "BindEntitydetail"));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        
        [WebMethod]
        public Dictionary<string, object> SaveGroupFields(string JsonFields, string EntityId, string CountryId, string CreatedBy)
        {
            try
            {
              
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_ItemSetup]").With<Flag>()
                     .Execute("@QueryType", "@jsonData", "@Countryid", "@Entityid", "@CreatedBy", "SaveGroupField", JsonFields, CountryId, EntityId, CreatedBy));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindFieldGroupGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_ItemSetup]").With<BindItemGroupGrid>().With<Count>().With<BindItemGroupData>()
                               .Execute("@QueryType", "@LoadMore", "BindAddressGroupGrid", LoadData));
                    return results;
                }
                else
                {
                    //code not working
                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_ItemSetup]").With<BindItemGroupGrid>().With<Count>()
                             .Execute("@QueryType", "@LoadMore", "@SearchValue", "SerarchBindAddressFieldGrid", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> DeleteEntity(string Country, string Entity)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_ItemSetup]").With<BindItemGroupGrid>().With<Count>()
                             .Execute("@QueryType", "@countryid", "@entityid", "DeleteEntity", Country, Entity));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
