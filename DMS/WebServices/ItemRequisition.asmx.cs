using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models;
using System.Data;
using DMS.Models.PartnerClasses;
using DMS.Models.Requisition_Classes;

namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for ItemRequisition
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)] 
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class ItemRequisition : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        BindADOResultset CommonManger = new BindADOResultset();
        [WebMethod]
        public Dictionary<string, object> SaveRequest(string Reqjson)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_InsertRequisition]").With<Flag>()
                 .Execute("@QueryType", "@JsonRequisitionItems", "SaveRequisition", Reqjson));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> ApproveRequest(string JsonRequestionItems, string UpdatedBy, string JsonRequestionWarehouse)
        {
            try
            {
                DataSet dt = CommonManger.FillDatasetWithParam("DMS_RequestControl", "@QueryType", "@JsonRequestionItems", "@UpdatedBy", "@JsonRequestionWarehouse", "ApproveRequest", JsonRequestionItems, UpdatedBy, JsonRequestionWarehouse);
                return ClsJson.JsonMethods.ToJson(dt);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindItemRequestWise(string ItemRequestNo)
        {
            try
            {
                DataSet dt = CommonManger.FillDatasetWithParam("Sp_Itembatch", "@QueryType", "@RequestNo", "BindItemGrid", ItemRequestNo);
                return ClsJson.JsonMethods.ToJson(dt);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> CancelRequest(string RequisitionId, string UpdatedBy)
        {
            try
            {
                DataSet dt = CommonManger.FillDatasetWithParam("DMS_InsertRequisition", "@QueryType", "@RequisitionId", "@UpdatedBy", "CancelRequest", RequisitionId, UpdatedBy);
                return ClsJson.JsonMethods.ToJson(dt);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> UpdateRequest(string RequisitionId, string JsonUpdateRequestItems, string UpdatedBy)
        {
            try
            {
                DataSet dt = CommonManger.FillDatasetWithParam("DMS_InsertRequisition", "@QueryType", "@RequisitionId", "@JsonUpdateRequestItems", "@UpdatedBy", "UpdateRequest", RequisitionId, JsonUpdateRequestItems, UpdatedBy);
                return ClsJson.JsonMethods.ToJson(dt);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        //public Dictionary<string, object> BindRequestHeader(string LoadData)
        public Dictionary<string, object> BindRequestHeader(string LoadData)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_InsertRequisition", "@QueryType", "@loadMore", "RequisitionHeader", LoadData);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> SearchBindRequestHeader(string SearchValue, string LoadData)
        {
            if (SearchValue == "")
            {
                try
                {
                    DataSet dt = CommonManger.FillDatasetWithParam("GetRequestHeader", "@QueryType", "@loadMore", "RequisitionHeader", LoadData);
                    return ClsJson.JsonMethods.ToJson(dt);
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
            else
            {
                try
                {
                    DataSet dt = CommonManger.FillDatasetWithParam("GetRequestHeader", "@QueryType", "@SearchValue", "SearchRequisitionHeader", SearchValue);
                    return ClsJson.JsonMethods.ToJson(dt);
                }
                catch (Exception ex)
                {
                    throw;
                }

            }
        }
        [WebMethod]
        public Dictionary<string, object> BindRequestHeaderRC(string LoadData)
        {
            try
            {
                LoadData = "4";
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_RequestControl", "@QueryType", "@loadMore", "RequisitionHeaderRC", LoadData);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> SearchBindRequestHeaderRC(string SearchValue, string LoadData)
        {
            if (SearchValue == "")
            {
                try
                {
                    DataSet dt = CommonManger.FillDatasetWithParam("GetRequestHeader", "@QueryType", "@loadMore", "RequisitionHeaderRC", LoadData);
                    return ClsJson.JsonMethods.ToJson(dt);
                }
                catch (Exception ex)
                {
                    throw;
                }
            }
            else
            {
                try
                {
                    DataSet dt = CommonManger.FillDatasetWithParam("GetRequestHeader", "@QueryType", "@SearchValue", "SearchRequisitionHeaderRC", SearchValue);
                    return ClsJson.JsonMethods.ToJson(dt);
                }
                catch (Exception ex)
                {
                    throw;
                }

            }
        }
        [WebMethod]
        public Dictionary<string, object> BindRequestOwnDetails(string RequisitionId, string Recallstatus)
        {

            try
            {
                if (Recallstatus != "1")
                {
                    DataSet ds = CommonManger.FillDatasetWithParam("DMS_InsertRequisition", "@QueryType", "@RequisitionId", "RequestOwnDetails", RequisitionId);
                    return ClsJson.JsonMethods.ToJson(ds);
                }
                else
                {
                    DataSet ds = CommonManger.FillDatasetWithParam("DMS_InsertRequisition", "@QueryType", "@RequisitionId", "RecallRequestOwnDetails", RequisitionId);
                    return ClsJson.JsonMethods.ToJson(ds);
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindRecallRequestOwnDetails(string RequisitionId)
        {

            try
            {

                DataSet ds = CommonManger.FillDatasetWithParam("GetRequestOwnDetails", "@QueryType", "@RequisitionId", "RequestOwnDetails", RequisitionId);
                return ClsJson.JsonMethods.ToJson(ds);

            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindRequestDetails(string RequisitionId)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_RequestControl", "@QueryType", "@RequisitionId", "RequestDetails", RequisitionId);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindRequestHistoryDetails(string RequisitionHeaderId)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("GetRequestDetails", "@QueryType", "@RequisitionId", "RequestHeaderDetails", RequisitionHeaderId);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindRequestNumber()
        {
            try
            {
                DataSet dt = CommonManger.FillDatasetWithParam("DMS_GETAUTOGENERATENo", "@QueryType", "BindRequestNumber");
                return ClsJson.JsonMethods.ToJson(dt);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindItem(string entityId, string CountryId, string PartnerId, string LocationId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_InsertRequisition]").With<BindItemddl>()
                    .Execute("@QueryType", "@EntityId", "@CountryId", "@PartnerId", "@LocationId", "BindItem", entityId, CountryId, PartnerId,LocationId));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [WebMethod]
        public Dictionary<string, object> BindLocation(string entityId, string CountryId, string PartnerId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_InsertRequisition]").With<BindAddressForTax>()
                   .Execute("@QueryType", "@EntityId", "@CountryId", "@Partner", "BindLocation", entityId, CountryId, PartnerId));
                return results;


            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [WebMethod]
        public Dictionary<string, object> BindItemSku(string ItemId)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_GetItemMaster", "@QueryType", "@ItemId", "ItemMasterSKU", ItemId);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindOnhandSkuWise(string itemId, string SkuId)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_GetItemMaster", "@QueryType", "@ItemId", "@SkuId", "BindSKUWiseOnhand", itemId, SkuId);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [WebMethod]
        public Dictionary<string, object> BindWareHouseOnhand(string itemId, string reqid)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_RequestControl", "@QueryType", "@itemId", "@RequisitionId", "BindItemWareHouseWise", itemId, reqid);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        // [WebMethod]
        //public Dictionary<string, object> BindWareHouseOnhand(string itemId,string wareHouseId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_RequestControl", "@QueryType", "@itemId", "@wareHouseId", "BindWareHouseOnhand", itemId, wareHouseId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        [WebMethod]
        public Dictionary<string, object> BindItemWiseData(string Itemid)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_GetItemMaster", "@QueryType", "@ITEMId", "ItemWiseDetail", Itemid);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> WarehouseCounting(string fromdate, string Todate, string LoadData)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("Sp_Itembatch", "@QueryType", "@Countingdatefrom", "@Countingdateto", "@loadMore", "Warehousecounting", fromdate, Todate, LoadData);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BranchCounting(string fromdate, string Todate, string warehouse, string LoadData)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("Sp_Itembatch", "@QueryType", "@Countingdatefrom", "@Countingdateto", "@BranchID", "@loadMore", "Branchwisecounting", fromdate, Todate, warehouse, LoadData);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindRequestWarehouse(string UserType)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_GetItemMaster", "@QueryType", "@UserType", "WareHouseDetail", UserType);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

    }
}
