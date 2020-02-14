using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models.AddressSetupClass;
using DMS.Models.EntitySetupClass;
using DMS.Models;
using System.Data;

namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for Customer
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Customer : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        BindADOResultset CommonManger = new BindADOResultset();
        //[WebMethod]
        //public Dictionary<string, object> BindCustData(string LoadData, string SearchValue)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "GetCustomers", LoadData);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //        else
        //        {
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "@SearchValue", "SearchCustomer", LoadData, SearchValue);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindPartners(string LoadData, string SearchValue)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "BindPartners", LoadData);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //        else
        //        {
        //            // var result = JsonConvert.ToObject(SearchValue);
        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@SearchValue", "SerarchBindPartners", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindDropDownCustType()
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "getCustType");
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> SavePartners(string PartnerType, string PartnerName, string Contact, string Location, string UserId, string partnerId)
        //{
        //    try
        //    {
        //        if (partnerId == "")
        //        {
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@PartnerType", "@PartnerName", "@Contact", "@Location", "@UserId", "SavePartners", PartnerType, PartnerName, Contact, Location, UserId);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //        else
        //        {
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@PartnerType", "@PartnerName", "@Contact", "@Location", "@UserId", "@PartnerId", "UpdatePartners", PartnerType, PartnerName, Contact, Location, UserId, partnerId);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindCountry(string entity)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@entityId", "BindDropDown", entity);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindVendorDropDown(string entity)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@entityId", "BindVendorDropDown", entity);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindTaxDropDowns(string entityId, string CountryId, string PartnerId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@entityId", "@countryId", "@PartId", "BindTaxdata", entityId, CountryId, PartnerId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> UpdatePartnerGroup(string PartnerType, string PartnerDescription, string AccountId, string dblclickGroupId, string userId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@AccountId", "@groupName", "@Description", "@groupId", "@UserId", "UpdatePartnerGroup", AccountId, PartnerType, PartnerDescription, dblclickGroupId, userId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}

        //[WebMethod]
        //public Dictionary<string, object> BindTaxDropDownsForVendor(string entityId, string CountryId, string VendorId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@entityId", "@countryId", "@PartId", "BindTaxdataVendor", entityId, CountryId, VendorId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindEntity()
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "BindEntity");
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SavePartnerGroup(string JsonFields, string EntityId, string CountryId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@JsonFields", "@countryId", "@entityId", "SavePartnerGroup", JsonFields, CountryId, EntityId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SaveVendorGroup(string JsonFields, string EntityId, string CountryId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@JsonFields", "@countryId", "@entityId", "SaveVendorGroup", JsonFields, CountryId, EntityId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindPartnerGroup(string SearchValue, string LoadData, string CountryId, string EntityId)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "@countryId", "@entityId", "BindPartnerGroup", LoadData, CountryId, EntityId);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //        else
        //        {
        //            // var result = JsonConvert.ToObject(SearchValue);
        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@SearchValue", "SerarchBindPartners", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindVendorGroup(string SearchValue, string LoadData, string CountryId, string EntityId)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "@countryId", "@entityId", "BindVendorGroup", LoadData, CountryId, EntityId);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //        else
        //        {
        //            // var result = JsonConvert.ToObject(SearchValue);
        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@SearchValue", "SerarchBindVendors", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        [WebMethod]
        public Dictionary<string, object> BindPAddressFields(string EntityId, string CountryId)
        {
            try
            {
                
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindPAddressFields>().With<GetTablename>()
                          .Execute("@QueryType", "@countryId", "@entityId", "BindPAddressFields", CountryId, EntityId));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

            }
        [WebMethod]
        public Dictionary<string, object> BindFieldsddl(string TableName)
        {
            try
            {
                string Query = "Select * from " + TableName + " where IsActive=1 and IsDeleted=0";
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@Query", "@TableName", "BindFieldddl", Query, TableName);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        //[WebMethod]
        //public Dictionary<string, object> BindPartnerCode()
        //{
        //    try
        //    {

        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "BindPartnerCode");
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindVendorCode()
        //{
        //    try
        //    {

        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "BindVendorCode");
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SavePartner(List<Object> AddressJson, string PGroup, string PType, string PDescription, string Status, string CreatedBy, string entityid, string PCode, string PName, string PRepresetative, string EntityCountryId, string jsonExistingLocdata)
        //{

        //    DataSet ds = new DataSet();
        //    try
        //    {

        //        DataTable dt = CommonManger.FillDatatableWithParam("DMS_Customers", "@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "savePartner", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId);
        //        if (dt.Rows.Count > 0)
        //        {
        //            string Tablename = "";
        //            string countryId = "";
        //            string Query = "";
        //            string columns = "";
        //            string partnerId = Convert.ToString(dt.Rows[0]["Response"]);
        //            if (AddressJson.Count != 0)
        //            {
        //                for (int i = 0; i < AddressJson.Count; i++)
        //                {

        //                    List<string> COLUMN = new List<string>();
        //                    string Address = Convert.ToString(AddressJson[i]);
        //                    string[] Address1 = Address.Split('&');
        //                    string Jsondata = Address1[1];
        //                    string Table = Address1[0];
        //                    string[] tabs = Table.Split(' ');
        //                    Tablename = "";
        //                    Tablename = tabs[0];
        //                    countryId = "";
        //                    countryId = tabs[1];

        //                    JArray ar = JArray.Parse(Address1[1]);
        //                    foreach (JObject content in ar.Children<JObject>())
        //                    {
        //                        foreach (JProperty prop in content.Properties())
        //                        {

        //                            COLUMN.Add(prop.Name);
        //                        }
        //                    }
        //                    columns = "";
        //                    columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
        //                    for (int c = 0; c < COLUMN.Count; c++)
        //                    {

        //                        columns += COLUMN[c] + " " + "[varchar](250) NULL" + ",";

        //                    }
        //                    columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[PartnerId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[LocationFlag] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
        //                    columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
        //                    columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
        //                    columns += "[IsDeleted] [bit]" + ' ' + "NULL";

        //                    string InsertColumn = "";
        //                    string selectJson = "select ";
        //                    Query = "";
        //                    for (int d = 0; d < COLUMN.Count; d++)
        //                    {
        //                        InsertColumn += COLUMN[d] + ",";
        //                        selectJson += " max(case when name='" + COLUMN[d] + "' then convert(nvarchar(100),StringValue) else '' end) as " + COLUMN[d] + ",";

        //                    }

        //                    string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
        //                    string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
        //                    Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,PartnerId,CreatedBy,CountryId,EntityId,LocationFlag)" + selectJson + " 1,0,getdate()," + partnerId + "," + CreatedBy + "," + countryId + "," + entityid + ",2 FROM parseJSON(" + "'" + Jsondata + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";

        //                    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "@ExistingLocation", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId, jsonExistingLocdata);


        //                }

        //            }
        //            else
        //            {

        //                ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "@ExistingLocation", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId, jsonExistingLocdata);

        //            }
        //        }
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}

        //[WebMethod]
        //public Dictionary<string, object> UpdatePartner(List<Object> AddressJson, List<Object> AddressJsonUpdate, string PGroup, string PType, string PDescription, string Status, string CreatedBy, string entityid, string PCode, string PName, string PRepresetative, string EntityCountryId, string PartnerId)
        //{

        //    DataSet ds = new DataSet();
        //    try
        //    {

        //        DataTable dt = CommonManger.FillDatatableWithParam("DMS_Customers", "@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "@PartnerId", "UpdatePartner", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId, PartnerId);
        //        if (dt.Rows.Count > 0)
        //        {
        //            if (AddressJson.Count != 0)
        //            {
        //                string Tablename = "";
        //                string countryId = "";
        //                string Query = "";
        //                string columns = "";
        //                for (int i = 0; i < AddressJson.Count; i++)
        //                {

        //                    List<string> COLUMN = new List<string>();
        //                    string Address = Convert.ToString(AddressJson[i]);
        //                    string[] Address1 = Address.Split('&');
        //                    string Jsondata = Address1[1];
        //                    string Table = Address1[0];
        //                    string[] tabs = Table.Split(' ');
        //                    Tablename = "";
        //                    Tablename = tabs[0];
        //                    countryId = "";
        //                    countryId = tabs[1];

        //                    JArray ar = JArray.Parse(Address1[1]);
        //                    foreach (JObject content in ar.Children<JObject>())
        //                    {
        //                        foreach (JProperty prop in content.Properties())
        //                        {

        //                            COLUMN.Add(prop.Name);
        //                        }
        //                    }
        //                    columns = "";
        //                    columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
        //                    for (int c = 0; c < COLUMN.Count; c++)
        //                    {

        //                        columns += COLUMN[c] + " " + "[varchar](250) NULL" + ",";

        //                    }
        //                    columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[PartnerId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[LocationFlag] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
        //                    columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
        //                    columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
        //                    columns += "[IsDeleted] [bit]" + ' ' + "NULL";

        //                    string InsertColumn = "";
        //                    string selectJson = "select ";
        //                    Query = "";
        //                    for (int d = 0; d < COLUMN.Count; d++)
        //                    {
        //                        InsertColumn += COLUMN[d] + ",";
        //                        selectJson += " max(case when name='" + COLUMN[d] + "' then convert(nvarchar(100),StringValue) else '' end) as " + COLUMN[d] + ",";

        //                    }

        //                    string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
        //                    string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
        //                    Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,PartnerId,CreatedBy,CountryId,EntityId,LocationFlag)" + selectJson + " 1,0,getdate()," + PartnerId + "," + CreatedBy + "," + countryId + "," + entityid + ",2 FROM parseJSON(" + "'" + Jsondata + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";

        //                    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, PartnerId);


        //                }

        //            }


        //            string Tablename1 = "";
        //            string countryId1 = "";
        //            string Query1 = "";
        //            string columns1 = "";
        //            // string partnerId = Convert.ToString(dt.Rows[0]["Response"]);
        //            if (AddressJsonUpdate.Count != 0)
        //            {
        //                for (int i = 0; i < AddressJsonUpdate.Count; i++)
        //                {
        //                    string COLUMN = "";
        //                    string Address = Convert.ToString(AddressJsonUpdate[i]);
        //                    string[] Address1 = Address.Split('&');
        //                    string Jsondata = Address1[1];
        //                    string[] data = Jsondata.Split('#');
        //                    string autoId = data[1];
        //                    string Table = Address1[0];
        //                    string[] tabs = Table.Split(' ');
        //                    Tablename1 = "";
        //                    Tablename1 = tabs[0];
        //                    countryId1 = "";
        //                    countryId1 = tabs[1];

        //                    JArray ar = JArray.Parse(data[0]);
        //                    foreach (JObject content in ar.Children<JObject>())
        //                    {
        //                        foreach (JProperty prop in content.Properties())
        //                        {

        //                            COLUMN += prop.Name + "=" + "'" + prop.Value + "'" + " ,";
        //                        }
        //                    }

        //                    Query1 = "Update " + Tablename1 + " set" + COLUMN + "UpdatedBy=" + CreatedBy + ",PartnerId=" + PartnerId + ",UpdatedOn=getdate()" + ",CountryId=" + countryId1 + ",EntityId=" + entityid + " where AutoId=" + autoId;

        //                    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@InsertQuery", "@TableName", "UpdatePartnerAddress", Query1, Tablename1);


        //                }

        //            }
        //            //else
        //            //{

        //            //    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId",  "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId);

        //            //}
        //        }
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}

        //[WebMethod]
        //public Dictionary<string, object> SaveVendor(List<Object> AddressJson, string PGroup, string PType, string PDescription, string Status, string CreatedBy, string entityid, string PCode, string PName, string PRepresetative, string EntityCountryId)
        //{

        //    DataSet ds = new DataSet();
        //    try
        //    {

        //        DataTable dt = CommonManger.FillDatatableWithParam("DMS_Customers", "@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "saveVendor", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId);
        //        if (dt.Rows.Count > 0)
        //        {
        //            string Tablename = "";
        //            string countryId = "";
        //            string Query = "";
        //            string columns = "";
        //            string partnerId = Convert.ToString(dt.Rows[0]["Response"]);
        //            if (AddressJson.Count != 0)
        //            {
        //                for (int i = 0; i < AddressJson.Count; i++)
        //                {

        //                    List<string> COLUMN = new List<string>();
        //                    string Address = Convert.ToString(AddressJson[i]);
        //                    string[] Address1 = Address.Split('&');
        //                    string Jsondata = Address1[1];
        //                    string Table = Address1[0];
        //                    string[] tabs = Table.Split(' ');
        //                    Tablename = "";
        //                    Tablename = tabs[0];
        //                    countryId = "";
        //                    countryId = tabs[1];

        //                    JArray ar = JArray.Parse(Address1[1]);
        //                    foreach (JObject content in ar.Children<JObject>())
        //                    {
        //                        foreach (JProperty prop in content.Properties())
        //                        {

        //                            COLUMN.Add(prop.Name);
        //                        }
        //                    }
        //                    columns = "";
        //                    columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
        //                    for (int c = 0; c < COLUMN.Count; c++)
        //                    {

        //                        columns += COLUMN[c] + " " + "[varchar](250) NULL" + ",";

        //                    }
        //                    columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[VendorId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[LocationFlag] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
        //                    columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
        //                    columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
        //                    columns += "[IsDeleted] [bit]" + ' ' + "NULL";

        //                    string InsertColumn = "";
        //                    string selectJson = "select ";
        //                    Query = "";
        //                    for (int d = 0; d < COLUMN.Count; d++)
        //                    {
        //                        InsertColumn += COLUMN[d] + ",";
        //                        selectJson += " max(case when name='" + COLUMN[d] + "' then convert(nvarchar(100),StringValue) else '' end) as " + COLUMN[d] + ",";

        //                    }

        //                    string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
        //                    string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
        //                    Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,VendorId,CreatedBy,CountryId,EntityId,LocationFlag)" + selectJson + " 1,0,getdate()," + partnerId + "," + CreatedBy + "," + countryId + "," + entityid + ",2 FROM parseJSON(" + "'" + Jsondata + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";

        //                    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "SaveAddressVendor", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId);


        //                }

        //            }
        //            //else
        //            //{

        //            //    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId",  "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId);

        //            //}
        //        }
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}


        //[WebMethod]
        //public Dictionary<string, object> UpdateVendor(List<Object> AddressJson, List<Object> AddressJsonUpdate, string PGroup, string PType, string PDescription, string Status, string CreatedBy, string entityid, string PCode, string PName, string PRepresetative, string EntityCountryId, string VendorId)
        //{

        //    DataSet ds = new DataSet();
        //    try
        //    {

        //        DataTable dt = CommonManger.FillDatatableWithParam("DMS_Customers", "@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "@VendorId", "UpdateVendor", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId, VendorId);
        //        if (dt.Rows.Count > 0)
        //        {
        //            if (AddressJson.Count != 0)
        //            {
        //                string Tablename = "";
        //                string countryId = "";
        //                string Query = "";
        //                string columns = "";
        //                for (int i = 0; i < AddressJson.Count; i++)
        //                {

        //                    List<string> COLUMN = new List<string>();
        //                    string Address = Convert.ToString(AddressJson[i]);
        //                    string[] Address1 = Address.Split('&');
        //                    string Jsondata = Address1[1];
        //                    string Table = Address1[0];
        //                    string[] tabs = Table.Split(' ');
        //                    Tablename = "";
        //                    Tablename = tabs[0];
        //                    countryId = "";
        //                    countryId = tabs[1];

        //                    JArray ar = JArray.Parse(Address1[1]);
        //                    foreach (JObject content in ar.Children<JObject>())
        //                    {
        //                        foreach (JProperty prop in content.Properties())
        //                        {

        //                            COLUMN.Add(prop.Name);
        //                        }
        //                    }
        //                    columns = "";
        //                    columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
        //                    for (int c = 0; c < COLUMN.Count; c++)
        //                    {

        //                        columns += COLUMN[c] + " " + "[varchar](250) NULL" + ",";

        //                    }
        //                    columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[VendorId] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[LocationFlag] [bigint]" + ' ' + " NULL" + ',';
        //                    columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
        //                    columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
        //                    columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
        //                    columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
        //                    columns += "[IsDeleted] [bit]" + ' ' + "NULL";

        //                    string InsertColumn = "";
        //                    string selectJson = "select ";
        //                    Query = "";
        //                    for (int d = 0; d < COLUMN.Count; d++)
        //                    {
        //                        InsertColumn += COLUMN[d] + ",";
        //                        selectJson += " max(case when name='" + COLUMN[d] + "' then convert(nvarchar(100),StringValue) else '' end) as " + COLUMN[d] + ",";

        //                    }

        //                    string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
        //                    string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
        //                    Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,VendorId,CreatedBy,CountryId,EntityId,LocationFlag)" + selectJson + " 1,0,getdate()," + VendorId + "," + CreatedBy + "," + countryId + "," + entityid + ",2 FROM parseJSON(" + "'" + Jsondata + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";

        //                    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "SaveAddressVendor", countryId, entityid, CreatedBy, Query, Tablename, columns, VendorId);


        //                }

        //            }


        //            string Tablename1 = "";
        //            string countryId1 = "";
        //            string Query1 = "";
        //            string columns1 = "";
        //            // string partnerId = Convert.ToString(dt.Rows[0]["Response"]);
        //            if (AddressJsonUpdate.Count != 0)
        //            {
        //                for (int i = 0; i < AddressJsonUpdate.Count; i++)
        //                {
        //                    string COLUMN = "";
        //                    string Address = Convert.ToString(AddressJsonUpdate[i]);
        //                    string[] Address1 = Address.Split('&');
        //                    string Jsondata = Address1[1];
        //                    string[] data = Jsondata.Split('#');
        //                    string autoId = data[1];
        //                    string Table = Address1[0];
        //                    string[] tabs = Table.Split(' ');
        //                    Tablename1 = "";
        //                    Tablename1 = tabs[0];
        //                    countryId1 = "";
        //                    countryId1 = tabs[1];

        //                    JArray ar = JArray.Parse(data[0]);
        //                    foreach (JObject content in ar.Children<JObject>())
        //                    {
        //                        foreach (JProperty prop in content.Properties())
        //                        {

        //                            COLUMN += prop.Name + "=" + "'" + prop.Value + "'" + " ,";
        //                        }
        //                    }

        //                    Query1 = "Update " + Tablename1 + " set" + COLUMN + "UpdatedBy=" + CreatedBy + ",VendorId=" + VendorId + ",UpdatedOn=getdate()" + ",CountryId=" + countryId1 + ",EntityId=" + entityid + " where AutoId=" + autoId;

        //                    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@InsertQuery", "@TableName", "UpdateVendorAddress", Query1, Tablename1);


        //                }

        //            }
        //            //else
        //            //{

        //            //    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId",  "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId);

        //            //}
        //        }
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}

        //[WebMethod]
        //public Dictionary<string, object> saveTaxInfo(string TaxData)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@TaxJson", "SaveTaxInfo", TaxData);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> saveTaxInfoVendor(string TaxData)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@TaxJson", "SaveTaxInfoVendor", TaxData);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindExistingLocation(string Entity, string Country)
        //{
        //    try
        //    {

        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@entityId", "@countryid", "BindExistingLocation", Entity, Country);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindPartner(string LoadData, string SearchValue)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "Bindpartner", LoadData);
        //            return ClsJson.JsonMethods.ToJson(dt);
        //        }
        //        else
        //        {

        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "@SearchValue", "Bindpartner", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindVendor(string LoadData, string SearchValue)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "bindVendor", LoadData);
        //            return ClsJson.JsonMethods.ToJson(dt);
        //        }
        //        else
        //        {

        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@LoadMore", "@SearchValue", "Bindpartner", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindPartnerOndblClick(string PartnerId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@PartId", "BindpartnerOndblClick", PartnerId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}

        //[WebMethod]
        //public Dictionary<string, object> BindVendorOndblClick(string VendorId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@PartId", "BindVendorOndblClick", VendorId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindTaxGroup(string EntityId, string CountryId, string PartnerId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@EntityId", "@CountryId", "@PartId", "GetTaxGrp", EntityId, CountryId, PartnerId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}

        //[WebMethod]
        //public Dictionary<string, object> BindTaxGroupVendor(string EntityId, string CountryId, string VendorId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@EntityId", "@CountryId", "@PartId", "GetTaxGrpForVendor", EntityId, CountryId, VendorId);
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
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@jsonData", "SaveTaxGroupWithItem", TaxGrpjson);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SaveTaxGroupVendor(string TaxGrpjson)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@jsonData", "SaveTaxGroupWithVendor", TaxGrpjson);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}

        //[WebMethod]
        //public Dictionary<string, object> BindAccount(string EntityId, string CountryId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@EntityId", "@CountryId", "BindAccount", EntityId, CountryId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}

    }
}
