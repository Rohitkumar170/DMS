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
    /// Summary description for Item
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Item : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        //[WebMethod]
        //public Dictionary<string, object> BindEntitydDetails()
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "BindEntitydetail");
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindVariantDetails(string EntityID, string CountryId, string Itemid)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@Entityid", "@Countryid", "@Itemsid", "BindVariantDetails", EntityID, CountryId, Itemid);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindSKU(string EntityId, string CountryId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@Entityid", "@Countryid", "BindSKUNUM", EntityId, CountryId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> Insertitem(string Itemjson, string Otherunit, string BaseUnit)
        //{

        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@ItemJson", "@OtherUnitJson", "@BaseUnit", "SaveItem", Itemjson, Otherunit, BaseUnit);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SkuInsertitem(string Skujson, string itemid)
        //{

        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@SkuJson", "@Itemsid", "SaveSku", Skujson, itemid);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> Binddoubleclickdata(string Itemid)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@Itemsid", "BindItems", Itemid);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindItemGrid(string LoadData, string SearchValue)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@LoadMore", "BindItemGrid", LoadData);
        //            return ClsJson.JsonMethods.ToJson(dt);
        //        }
        //        else
        //        {

        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@LoadMore", "@SearchValue", "SerarchBindAddressFieldGrid", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        [WebMethod]
        public Dictionary<string, object> saveUnits(string UnitJson)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Flag>()
                             .Execute("@QueryType", "@Unit", "InsertUnit", UnitJson));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SaveUnitConversion(string UnitConversionJson)
        {
            try
            {
               
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Flag>()
                           .Execute("@QueryType", "@ConvertedvalueJson", "SaveUnitConversion", UnitConversionJson));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindUnits(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                    {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<BindUnit>().With<Count>()
                              .Execute("@QueryType", "@LoadMore", "BindUnit", LoadData));
                return results;
            }
                else
                {
                    //code is not working
                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<BindUnit>().With<Count>()
                             .Execute("@QueryType", "@LoadMore", "@SearchValue", "SerarchBindAddressFieldGrid", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        //[WebMethod]
        //public Dictionary<string, object> BindUnitConversion(string ItemId)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@Itemsid", "BindUnitsConversion", ItemId);
        //        return ClsJson.JsonMethods.ToJson(dt);

        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        [WebMethod]
        public Dictionary<string, object> BindUnitClass()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<BindItemclass>()
                            .Execute("@QueryType",  "BindItemclass"));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindUnitClassWise(string UnitId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<BindDataClassWise>().With<Count>()
                            .Execute("@QueryType", "@Unitclass", "BindDataClassWise", UnitId));
                return results;

            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindShowUnitConversion(string UnitClassId)
        {
            try
            {

                
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<BindUnitConversion>().With<Count>()
                           .Execute("@QueryType", "@Unitclass", "BindUnitConversion", UnitClassId));
                return results;

            }
            catch (Exception ex)
            {
                throw;
            }
        }
        //[WebMethod]
        //public Dictionary<string, object> BindTaxGroup(string EntityId, string CountryId, string ItemId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@Entityid", "@Countryid", "@ItemIddbl", "GetTaxGrp", EntityId, CountryId, ItemId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}

        //[WebMethod]
        //public Dictionary<string, object> SaveTaxGroup(string TaxGrpjson)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@jsonData", "SaveTaxGroupWithItem", TaxGrpjson);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}

    }
}
