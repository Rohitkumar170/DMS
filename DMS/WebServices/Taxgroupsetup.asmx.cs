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
    /// Summary description for Taxgroupsetup
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Taxgroupsetup : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        BindADOResultset CommonManger = new BindADOResultset();
        [WebMethod]
        public Dictionary<string, object> BindGst(string Countryid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<BindGST>().With<Taxsetupcompo>().With<Taxtype1>()
                    .With<Invoicecomponent>().With<InvoiceCMP>()
                       .Execute("@QueryType", "@Countryid", "BindAllTax", Countryid));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public string DeleteTempformula(string ParentId, string TaxState)
        {
            if (ParentId == "")
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]")
                     .Execute("@QueryType", "DeleteTempformula1"));
                return "sucess";
            }
            else
            { 
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]")
                    .Execute("@QueryType", "@ParentId", "@TaxState", "DeleteTempformula", ParentId, TaxState));
                return "sucess";
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindEntityCountrydDetails()
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<BindCountry>().With<BindEntityForAddress>()
                     .Execute("@QueryType", "BindEntityCountrydDetails"));
            return results;
        }

        [WebMethod]
        public Dictionary<string, object> saveTempFormula(string Json)
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<Flag>()
                   .Execute("@QueryType", "@JsonTempData", "SaveTempdata", Json));
            return results;
        }

        [WebMethod]
        public Dictionary<string, object> SaveTaxGroup(string Json, string Fromdate, string Todate)
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<Flag>()
                  .Execute("@QueryType", "@JsonTempData", "@Fromdate", "@Todate", "SaveTexGroup", Json, Fromdate, Todate));
            return results;
        }

        [WebMethod]
        public Dictionary<string, object> BindTaxSetupgrd(string LoadData, string SearchValue)
        {

            if (SearchValue == "")
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<Taxgroupdata>().With<Count>()
                 .Execute("@QueryType", "@loadmore", "BindTaxSetupgrd", LoadData));
                return results;
            }
            else
            {
                DataSet ds1 = new DataSet();
                return ClsJson.JsonMethods.ToJson(ds1);
            }
        }

        [WebMethod]
        public Dictionary<string, object> BinddataOndblClick(string TaxgroupId)
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<Taxgroupgrid>().With<Taxgroupgridline>()
                .Execute("@QueryType", "@TaxGroup", "BindDatadblclick", TaxgroupId));
            return results;
        }
        [WebMethod]
        public Dictionary<string, object> UpdateRecord(string GroupId, string UpdatedBy, string Fromdate, string Todate)
        {
          
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<Flag>()
               .Execute("@QueryType", "@TaxGroup", "@UpdatedBy", "@Fromdate", "@Todate", "UpdateRecord", GroupId, UpdatedBy, Fromdate, Todate));
            return results;
        }

        [WebMethod]
        public Dictionary<string, object> BindTaxHistoryGrd(string LoadData, string SearchValue, string groupid)
        {

            if (SearchValue == "")
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<BindFormulahistorygrid>().With<Count>()
                   .Execute("@QueryType", "@loadmore", "@TaxGroup", "BindFormulaHistorygrd", LoadData, groupid));
                return results;
            }
            else
            {
                DataSet ds1 = new DataSet();
                return ClsJson.JsonMethods.ToJson(ds1);
            }
        }


        [WebMethod]
        public Dictionary<string, object> BindFormula(string TaxGroupId)
        {
        
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Taxgroupsetup]").With<BindFormula>().With<Bindformula1>()
                  .Execute("@QueryType", "@TaxGroup", "BindFormulaForTest", TaxGroupId));
            return results;
        }

        [WebMethod]
        public Dictionary<string, object> Getoutputval(string Json, string Taxgroupid, string Subcomponentid, string Taxstateid)
        {
         
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_BINDCALCULATOR]").With<Calculatorout>()
                .Execute("@QueryType", "@Json", "@TaxGroupId", "@SubCompId", "@TaxState", "BindFormulaOutput", Json, Taxgroupid, Subcomponentid, Taxstateid));
            return results;
        }
    }
}
