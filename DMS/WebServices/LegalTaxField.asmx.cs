using System;
using System.Collections.Generic;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models;
using DMS.Models.TaxSetupClass;
using DMS.Models.AddressSetupClass;
using System.Data;
using DMS.Models.EntitySetupClass;
using System.Text;

namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for LegalTaxField
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class LegalTaxField : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        BindADOResultset CommonManger = new BindADOResultset();
        [WebMethod]
        public Dictionary<string, object> BindEntity()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<BindEntity>()
                            .Execute("@QueryType", "BindEntityForLegalTax"));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public Dictionary<string, object> BindCountry(string EntityId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<BindCountry>()
                           .Execute("@QueryType", "@entityId", "BindCountryForLegalTax", EntityId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> SaveLegalTaxField(string jsondata, string countryid, string entityid, string CreatedBy, string TaxGroupIddblClick)
        {
            try
            {
                if (TaxGroupIddblClick == "0")
                {

                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Flag>()
                         .Execute("@QueryType", "@JsonTempData", "@countryid", "@entityid", "@CreatedBy", "SaveLegalTaxField", jsondata, countryid, entityid, CreatedBy));
                    return results;
                }
                else
                {

                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Flag>()
                        .Execute("@QueryType", "@JsonTempData", "@countryid", "@entityid", "@CreatedBy", "@TaxGroupIddblClick", "UpdateLegalTax", jsondata, countryid, entityid, CreatedBy, TaxGroupIddblClick));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public Dictionary<string, object> BindGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Legalfieldgrid>().With<Count>()
                        .Execute("@QueryType", "@LoadMore", "BindLegalFieldGrid", LoadData));
                    return results;
                }
                else
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Legalfieldgrid>().With<Count>()
                       .Execute("@QueryType", "@LoadMore", "BindLegalFieldGrid1", SearchValue));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public Dictionary<string, object> BindDataOnbblClick(string FieldId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<BindEntityCountry>().With<Bindlegalfieldvalue>()
                       .Execute("@QueryType", "@LegalHeadId", "BindLegalTaxdbl", FieldId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
