using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models;
using System.Data;

namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for AxPosting
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AxPosting : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        BindADOResultset CommonManger = new BindADOResultset();
        // [WebMethod]
        //    public Dictionary<string, object> Shipping(string JsonRequestionItems, string UpdatedBy, string ReqNo, string reqwarehouseId)
        //    {
        //        try
        //        {
        //        //    DMSService.CallContext Cct = new DMSService.CallContext();
        //        //    DMSService.Iace_DMSServiceClient obj = new DMSService.Iace_DMSServiceClient();
        //        //    string conn = ConfigurationManager.ConnectionStrings["Conn"].ToString();
        //        //    SqlConnection Conn = new SqlConnection(conn);
        //        //    SqlCommand cmd1 = new SqlCommand("Sp_AxWebserviceIntegration", Conn);
        //        //    cmd1.CommandType = CommandType.StoredProcedure;
        //        //    DataSet sdAX = new DataSet();
        //        //    SqlDataAdapter sd = new SqlDataAdapter();
        //        //    sd.SelectCommand = cmd1;
        //        //    sd.Fill(sdAX);
        //        //    obj.ClientCredentials.Windows.ClientCredential.Domain = Convert.ToString(sdAX.Tables[0].Rows[0]["Domain"]);
        //        //    obj.ClientCredentials.Windows.ClientCredential.UserName = Convert.ToString(sdAX.Tables[0].Rows[0]["Username"]);
        //        //    obj.ClientCredentials.Windows.ClientCredential.Password = Convert.ToString(sdAX.Tables[0].Rows[0]["Password"]);
        //        //    Cct.Company = Convert.ToString(sdAX.Tables[0].Rows[0]["Company"]);
        //        //    Cct.Language = Convert.ToString(sdAX.Tables[0].Rows[0]["Language"]);
        //        //    //json data 
        //        //    DataTable dt = JsonStringToDataTable(JsonRequestionItems);
        //        //    List<ShipingRequest> list = new List<ShipingRequest>();
        //        //    DataView view = new DataView(dt);
        //        //    //distinct data from Json 
        //        //    DataTable dt2 = view.ToTable(true, "FromLocation", "ToLocation", "RequestNo");
        //        //    string TONum = "";
        //        //    for (int i = 0; i < dt2.Rows.Count; i++)
        //        //    {
        //        //        string fromlocation = Convert.ToString(dt2.Rows[i]["FromLocation"]);
        //        //        string ToLocation = Convert.ToString(dt2.Rows[i]["ToLocation"]);
        //        //        string RequestNo = Convert.ToString(dt2.Rows[i]["RequestNo"]);
        //        //        // This Methode Return TransferOrderNo
        //        //        TONum = obj.InsertTransferHeader(Cct, RequestNo, fromlocation, ToLocation);

        //        //        DataTable filteredTable = (from n in dt.AsEnumerable()
        //        //                                   where n.Field<string>("FromLocation").Contains(Convert.ToString(dt2.Rows[i]["FromLocation"]))
        //        //                                   select n).CopyToDataTable();
        //        //        for (int j = 0; j < filteredTable.Rows.Count; j++)
        //        //        {
        //        //            string itemId = Convert.ToString(filteredTable.Rows[j]["ItemId"]);
        //        //            decimal qty = Convert.ToDecimal(filteredTable.Rows[j]["ApprovedQty"]);
        //        //            string batch = Convert.ToString(filteredTable.Rows[j]["ItemId"]);
        //        //            ShipingRequest s = new ShipingRequest();
        //        //            s.ItemId = itemId;
        //        //            s.RequestDetId = Convert.ToString(filteredTable.Rows[j]["RequestDetId"]);
        //        //            s.TransferOrderNo = TONum;
        //        //            s.ShippedQty = Convert.ToString(qty);
        //        //            s.RequisitionId = Convert.ToString(filteredTable.Rows[j]["RequisitionId"]);
        //        //            list.Add(s);
        //        //            // This Method Insert line Of The request In AX table
        //        //            obj.InsertTransferOrderLines(Cct, TONum, itemId, qty);
        //        //        }

        //        //        // This Method Use To Ship the Request by using TransferOrderNo
        //        //        // obj.ShipOrder(Cct, TONum);


        //        //    }
        //        //    string JSONResponse = JsonConvert.ToJson(list);

        //        //    DataSet tbl = CommonManger.FillDatasetWithParam("DMS_RequestControl", "@QueryType", "@updatedBy", "@JsonRequestionItems", "Shipping", UpdatedBy, JSONResponse);
        //        //    return ClsJson.JsonMethods.ToJson(tbl);
        //        //}
        //        //catch (Exception ex)
        //        //{
        //        //    throw;
        //        //}
        //    }
        //    public DataTable JsonStringToDataTable(string jsonString)
        //    {
        //        DataTable dt = new DataTable();
        //        string[] jsonStringArray = Regex.Split(jsonString.Replace("[", "").Replace("]", ""), "},{");
        //        List<string> ColumnsName = new List<string>();
        //        foreach (string jSA in jsonStringArray)
        //        {
        //            string[] jsonStringData = Regex.Split(jSA.Replace("{", "").Replace("}", ""), ",");
        //            foreach (string ColumnsNameData in jsonStringData)
        //            {
        //                try
        //                {
        //                    int idx = ColumnsNameData.IndexOf(":");
        //                    string ColumnsNameString = ColumnsNameData.Substring(0, idx - 1).Replace("\"", "");
        //                    if (!ColumnsName.Contains(ColumnsNameString))
        //                    {
        //                        ColumnsName.Add(ColumnsNameString);
        //                    }
        //                }
        //                catch (Exception ex)
        //                {
        //                    throw new Exception(string.Format("Error Parsing Column Name : {0}", ColumnsNameData));
        //                }
        //            }
        //            break;
        //        }
        //        foreach (string AddColumnName in ColumnsName)
        //        {
        //            dt.Columns.Add(AddColumnName);
        //        }
        //        foreach (string jSA in jsonStringArray)
        //        {
        //            string[] RowData = Regex.Split(jSA.Replace("{", "").Replace("}", ""), ",");
        //            DataRow nr = dt.NewRow();
        //            foreach (string rowData in RowData)
        //            {
        //                try
        //                {
        //                    int idx = rowData.IndexOf(":");
        //                    string RowColumns = rowData.Substring(0, idx - 1).Replace("\"", "");
        //                    string RowDataString = rowData.Substring(idx + 1).Replace("\"", "");
        //                    nr[RowColumns] = RowDataString;
        //                }
        //                catch (Exception ex)
        //                {
        //                    continue;
        //                }
        //            }
        //            dt.Rows.Add(nr);
        //        }
        //        return dt;
        //    }


        //}
    }
    public class ShipingRequest
    {

        public string ItemId { get; set; }
        public string ShippedQty { get; set; }
        public string RequisitionId { get; set; }
        public string RequestDetId { get; set; }
        public string TransferOrderNo { get; set; }

    }
}
