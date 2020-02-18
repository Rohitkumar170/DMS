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
using System.Data;

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
        BindADOResultset CommonManger = new BindADOResultset();
        [WebMethod]
        public Dictionary<string, object> BindEntitydDetails()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Country>().With<EntityName>().With<ItemGroup>().With<ItemType>().With<ItemUnit>().With<ItemUnit>().With<ItemTrack>()
                       .Execute("@QueryType", "BindEntitydetail"));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindVariantDetails(string EntityID, string CountryId, string Itemid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<tblVariantHeader>().With<VariantLine>()
                     .Execute("@QueryType", "@Entityid", "@Countryid", "@Itemsid", "BindVariantDetails", EntityID, CountryId, Itemid));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindSKU(string EntityId, string CountryId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Sequence>()
                         .Execute("@QueryType", "@Entityid", "@Countryid", "BindSKUNUM", EntityId, CountryId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> Insertitem(string Itemjson, string Otherunit, string BaseUnit)
        {

            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Flag>()
                           .Execute("@QueryType", "@ItemJson", "@OtherUnitJson", "@BaseUnit", "SaveItem", Itemjson, Otherunit, BaseUnit));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SkuInsertitem(string Skujson, string itemid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Flag>().With<GetItemSKU>()
                         .Execute("@QueryType", "@SkuJson", "@Itemsid", "SaveSku", Skujson, itemid));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> Binddoubleclickdata(string Itemid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Country>().With<EntityName>().With<ItemGroup>().With<ItemType>().With<ItemUnit>().With<ItemUnit>().With<ItemDetails>().With<BaseUnitss>().With<Otherunits>().With<GetItemSKU>().With<ItemTrack>().With<Otherunits>()
                       .Execute("@QueryType", "@Itemsid", "BindItems", Itemid));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindItemGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<ShortItemdetails>().With<Count>()
                      .Execute("@QueryType", "@LoadMore", "BindItemGrid", LoadData));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    DataSet ds = CommonManger.FillDatasetWithParam("DMS_Item", "@QueryType", "@LoadMore", "@SearchValue", "SerarchBindItemGrid", LoadData, replacestring);
                    return ClsJson.JsonMethods.ToJson(ds);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
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
                throw ex;
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
                throw ex;
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
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindUnitConversion(string ItemId)
        {
            try
            { 
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<UnitConvertion>()
                          .Execute("@QueryType", "@Itemsid", "BindUnitsConversion", ItemId));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       

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
                throw ex;
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
                throw ex;
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
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindTaxGroup(string EntityId, string CountryId, string ItemId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Taxgroup>().With<AssignedTaxGroup>()
                           .Execute("@QueryType", "@Entityid", "@Countryid", "@ItemIddbl", "GetTaxGrp", EntityId, CountryId, ItemId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> SaveTaxGroup(string TaxGrpjson)
        {
            try
            {
              
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Item]").With<Flag>()
                        .Execute("@QueryType", "@jsonData", "SaveTaxGroupWithItem", TaxGrpjson));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

    }
}
