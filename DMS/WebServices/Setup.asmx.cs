using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models.AddressSetupClass;
using DMS.Models.EntitySetupClass;
using DMS.Models.PartnerClasses;
using DMS.Models;
using System.Data;
using Newtonsoft.Json.Linq;

namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for Setup
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Setup : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        BindADOResultset CommonManger = new BindADOResultset();

        [WebMethod]
        public Dictionary<string, object> BindFieldDetails()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAllFields>().With<BindCountry>().With<BindEntityForAddress>()
                           .Execute("@QueryType", "BindAllFields"));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindAddesssetUp()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindEntityForAddress>().With<DdlFielsSetup>()
                          .Execute("@QueryType", "BindAddressSetup"));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindDataType()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAddressDataType>()
                              .Execute("@QueryType", "BindDataType"));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindDataTypeOrgParam(string OrgFlag)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrganizationdataType>()
                       .Execute("@QueryType", "@Orgflag", "BindOrganizationdataType", OrgFlag));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindFieldAddressGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAddressFieldGrid>().With<Count>().With<BindAddressField>().With<BindAddressClass>()
                           .Execute("@QueryType", "@LoadMore", "BindAddressFieldGrid", LoadData));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<SerarchBindAddressFieldGrid>().With<Count>()
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
        public Dictionary<string, object> BindFieldSetupGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindFieldSetupGrid>().With<Count>()
                              .Execute("@QueryType", "@LoadMore", "BindFieldSetupGrid", LoadData));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindFieldSetupGrid>().With<Count>()
                             .Execute("@QueryType", "@LoadMore", "@SearchValue", "BindFieldSetupGrid", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> SaveAddressFields(string JsonFields, string editFlag, List<Object> dbcolumns, string entityid, string countryid)
        {

            string columns = "";
            string tablename = "";
            string[] col;
            Dictionary<string, object> results = new Dictionary<string, object>();
            try
            {
                #region For Fields Name Insertion Details

                var results1 = context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                          .Execute("@QueryType", "@JsonFields", "@entityid", "@countryid", "SaveAddressFields", JsonFields, entityid, countryid);

                if (results1.Count > 0)
                {
                    #region For Table Creation
                    for (int i = 0; i < dbcolumns.Count; i++)
                    {
                        columns = ""; tablename = "";
                        col = Convert.ToString(dbcolumns[i]).Split(',');
                        for (int x = 0; x < col.Length - 1; x++)
                        {
                            if (x == 0)
                            {
                                tablename = col[x].ToString();
                            }
                            else if (x == 1)
                            {
                                string identitycol = col[x].ToString() + "Autoid";
                                columns += identitycol + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";

                            }
                            else
                            {
                                columns += col[x].ToString() + ",";
                            }
                        }
                        columns += "[ParentValue] [bigint]" + ' ' + " NULL" + ',';
                        columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
                        columns += "[ParentId] [bigint]" + ' ' + " NULL" + ',';
                        columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
                        columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
                        columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
                        columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
                        columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
                        columns += "[IsDeleted] [bit]" + ' ' + "NULL";
                        DMSNEWEntities context = new DMSNEWEntities();

                        results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                          .Execute("@QueryType", "@TableName", "@ColumnName", "@countryid", "@entityid", "Createtable", tablename, columns, countryid, entityid));



                    }

                    #endregion
                }
                return Common.Getdata(results1);

                #endregion
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SaveFieldAssigned(string JsonFieldItems, string countryid, string entityid, string CreatedBy)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                         .Execute("@QueryType", "@JsonFields", "@countryid", "@entityid", "@CreatedBy", "SaveFieldAssigned", JsonFieldItems, countryid, entityid, CreatedBy));
                return results;
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
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAddressFieldGrid>().With<Flag>()
                              .Execute("@QueryType", "@countryid", "@entityid", "DeleteEntity", Country, Entity));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> DeleteFieldEntity(string Country, string Entity)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                          .Execute("@QueryType", "@countryid", "@entityid", "DeleteFieldsEntity", Country, Entity));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindFieldOnRowDoubleClick(string FieldId)
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindFieldOndblClick>().With<AddressFields>().With<BindCountry>().With<BindEntityForAddress>()
                              .Execute("@QueryType", "@Fieldid", "UpdateFieldSetup", FieldId));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindFieldSetupList(string entityId, string countryId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindDataSetupField>()
                             .Execute("@QueryType", "@CountryId", "@entityid", "BindDataSetupField", countryId, entityId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> GetTableColumn(string TableName)
        {


            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@TableName", "GetDynamicTableColumn", TableName);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }




        }
        [WebMethod]
        public Dictionary<string, object> SaveRecord(string JsonFieldItems, string TableName, string parentid, string entityid, string CreatedBy, List<Object> Column)
        {
            try
            {
                string InsertColumn = "";
                string selectJson = "select ";
                string Query = "";
                string CheckExist = "";
                for (int i = 0; i < Column.Count; i++)
                {
                    InsertColumn += Column[i] + ",";
                    selectJson += " max(case when name=''" + Column[i] + "'' then convert(nvarchar(100),StringValue) else '''' end) as " + Column[i] + ",";

                }
                string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
                string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
                Query = "insert Into " + TableName + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,EntityId,ParentId,CreatedBy)" + selectJson + " 1,0,getdate()," + entityid + "," + parentid + "," + CreatedBy + " FROM parseJSON(" + "''" + JsonFieldItems + "''" + ") where ValueType = ''string'' OR  ValueType = ''int''group by parent_ID ";

                //  CheckExist = NewselectJson + "into #temp" + TableName + "" + " FROM parseJSON(" + "'" + JsonFieldItems + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";

                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                          .Execute("@QueryType", "@InsertQuery", "InsertRecord", Query));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindParentddl(string TableName, string ColumnName)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Bindparentddl>()
                          .Execute("@QueryType", "@ta", "@Column", "BindParentddl", TableName, ColumnName));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //public static DataTable Tabulate(string json)
        //{
        //    var jsonLinq = JObject.Parse(json);

        //    // Find the first array using Linq
        //    var srcArray = jsonLinq.Descendants().Where(d => d is JArray).First();
        //    var trgArray = new JArray();
        //    foreach (JObject row in srcArray.Children<JObject>())
        //    {
        //        var cleanRow = new JObject();
        //        foreach (JProperty column in row.Properties())
        //        {
        //            // Only include JValue types
        //            if (column.Value is JValue)
        //            {
        //                cleanRow.Add(column.Name, column.Value);
        //            }
        //        }

        //        trgArray.Add(cleanRow);
        //    }

        //    return JsonConvert.DeserializeObject<DataTable>(trgArray.ToString());
        //}
        [WebMethod]
        public Dictionary<string, object> saveOrganizationParameter(string JsonFields, string editFlag, List<Object> dbcolumns, string entityid, string countryid, string OrgFlag)
        {
            string columns = "";
            string tablename = "";
            string[] col;
            Dictionary<string, object> results = new Dictionary<string, object>();
            try
            {
                var results1 = context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                         .Execute("@QueryType", "@JsonFields", "@entityid", "@countryid", "@Orgflag", "SavaOrganizationPara", JsonFields, entityid, countryid, OrgFlag);

                if (results1.Count > 0)
                {
                    for (int i = 0; i < dbcolumns.Count; i++)
                    {
                        columns = ""; tablename = "";
                        col = Convert.ToString(dbcolumns[i]).Split(',');
                        for (int x = 0; x < col.Length - 1; x++)
                        {
                            if (x == 0)
                            {
                                tablename = col[x].ToString();
                            }
                            else if (x == 1)
                            {
                                string identitycol = col[x].ToString() + "Autoid";
                                columns += identitycol + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";

                            }
                            else
                            {
                                columns += col[x].ToString() + ",";
                            }
                        }
                        columns += "[ParameterId] [nvarchar](100)" + ' ' + " NULL" + ',';
                        columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
                        columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
                        columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
                        columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
                        columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
                        columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
                        columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
                        columns += "[IsDeleted] [bit]" + ' ' + "NULL";
                        DMSNEWEntities context1 = new DMSNEWEntities();
                        results = Common.Getdata(context1.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                    .Execute("@QueryType", "@TableName", "@ColumnName", "@countryid", "@entityid", "@Orgflag", "CreatetableOrgPara", tablename, columns, countryid, entityid, OrgFlag));


                    }


                }
                return Common.Getdata(results1);


            }
            catch (Exception ex)
            {
                throw ex;
            }



        }
        [WebMethod]
        public Dictionary<string, object> BinOrgParaGrid(string LoadData, string SearchValue, string OrgFlag)
        {

            try
            {
                if (SearchValue == "")
                {

                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrgParaGrid>().With<Count>().With<BindOrgFields
     >().With<BindDataType>()
                                 .Execute("@QueryType", "@LoadMore", "@Orgflag", "BindOrgParaGrid", LoadData, OrgFlag));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrgParaGrid>().With<Count>().With<BindOrgFields
>().With<BindDataType>()
                          .Execute("@QueryType", "@LoadMore", "@Orgflag", "BindOrgParaGrid", LoadData, OrgFlag));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindOrgParaddl(string CountryId, string EntityId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrgParaddl>()
                           .Execute("@QueryType", "@countryid", "@entityid", "BindOrgParaddl", CountryId, EntityId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindParaParaddl(string CountryId, string EntityId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindParaParaddl>()
                          .Execute("@QueryType", "@countryid", "@entityid", "BindParaParaddl", CountryId, EntityId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> Assigneditemtopartner(string CountryId, string EntityId,string searchtxt)
        {
            try
            {
                string replacestring = searchtxt.Replace("$", "'");
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@countryid", "@entityid", "@SearchValue", "AssignedItmtopartner", CountryId, EntityId, replacestring);
                return ClsJson.JsonMethods.ToJson(ds);
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindLocationwisedata(string CountryId, string EntityId, string Partnerlocation, string Partner)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@countryid", "@entityid", "@PartnerId", "@Location", "BindAssigneditem", CountryId, EntityId, Partner,Partnerlocation);
                return ClsJson.JsonMethods.ToJson(ds);
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> DisableLocation(string entityid, string CountryId, string Columnid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                              .Execute("@QueryType", "@countryid", "@entityid", "@Columnid", "Disableaddress", CountryId, entityid, Columnid));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> BindPartners(string CountryId, string EntityId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAssignPartner>()
                         .Execute("@QueryType", "@countryid", "@entityid", "BindPartner", CountryId, EntityId));
                return results;
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }

        //[WebMethod]
        //public Dictionary<string, object> BindAssigneditemVendor(string CountryId, string EntityId)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@countryid", "@entityid", "BindAssignedVendor", CountryId, EntityId);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        [WebMethod]
        public Dictionary<string, object> BindPartnerLocation(string PartnerId, string Entityid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Transaction]").With<BindLocation>()
                       .Execute("@QueryType", "@Partid", "@Entityid", "ItemassignedtoPartnerLocation", PartnerId, Entityid));
                return results;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //[WebMethod]
        //public Dictionary<string, object> BindVendorLocation(string PartnerId, string Entityid, string countryId)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_Transaction", "@QueryType", "@Partid", "@Entityid", "@countryId", "BindVendorLocation", PartnerId, Entityid, countryId);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        [WebMethod]
        public Dictionary<string, object> Binditems(string Assignedid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Transaction]").With<BindItems>()
                      .Execute("@QueryType", "@Assigneditemid", "BindItems", Assignedid));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //[WebMethod]
        //public Dictionary<string, object> VendorBinditems(string Assignedid)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_Transaction", "@QueryType", "@Assigneditemid", "VendorBindItems", Assignedid);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        [WebMethod]
        public Dictionary<string, object> GetOrgFieldName(string TableName)
        {
            try
            {
                //Ef not posible
                DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@TableName", "GetOrgColumn", TableName);
                return ClsJson.JsonMethods.ToJson(dt);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SaveParaLocation(string Jsondata)
        {
            try
            {

                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                         .Execute("@QueryType", "@jsonData", "SaveParalocaton", Jsondata));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> UpdateAssigneditem( string Jsonitems,string Assignedid)
        {
            try
            {
              
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                           .Execute("@QueryType","@JsonFields", "@Assigneid", "UpdateAssignedItem", Jsonitems,Assignedid));
                    return results;
                
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SaveAssigneditem(string Jsondata, string Jsonitems)
        {
            try
            {
               
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                            .Execute("@QueryType", "@jsonData", "@JsonFields", "SaveAssignedItem", Jsondata, Jsonitems));
                    return results;
                
              
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        //[WebMethod]
        //public Dictionary<string, object> SaveAssigneditemVendor(string Jsondata, string Jsonitems)
        //{
        //    try
        //    {
        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@jsonData", "@JsonFields", "SaveAssignedItemVendor", Jsondata, Jsonitems);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        [WebMethod]
        public Dictionary<string, object> SaveLocation(List<Object> AddressJson, string CreatedBy, string entityid, string CountryId, string Tablename)
        {
            try
            {
                string Jsondata = "[";
                string jsonString = "";
                for (int k = 0; k < AddressJson.Count; k++)
                {
                    string a = Convert.ToString(AddressJson[k]).Trim();
                    string str = a.Remove(a.Length - 1, 1);
                    string finalstr = str.Remove(0, 1);

                    jsonString += finalstr + ",";

                }
                string str1 = jsonString.Remove(jsonString.Length - 1, 1);
                str1 += "]";
                Jsondata += str1;

                List<string> COLUMN = new List<string>();
                string Address = Convert.ToString(AddressJson[0]);
                string[] Address1 = Address.Split('&');
                JArray ar = JArray.Parse(Address1[0]);
                foreach (JObject content in ar.Children<JObject>())
                {
                    foreach (JProperty prop in content.Properties())
                    {

                        COLUMN.Add(prop.Name);
                    }
                }
                string columns = "";
                columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
                for (int c = 0; c < COLUMN.Count; c++)
                {

                    // columns +="["+ COLUMN[c] +"]" + " " + "[varchar](250) NULL" + ",";
                    columns += COLUMN[c].Trim() + " " + "[varchar](250) NULL" + ",";

                }
                columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
                columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
                columns += "[PartnerId] [bigint]" + ' ' + " NULL" + ',';
                columns += "[LocationFlag] [bigint]" + ' ' + " NULL" + ',';
                columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
                columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
                columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
                columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
                columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
                columns += "[IsDeleted] [bit]" + ' ' + "NULL";

                string InsertColumn = "";
                string selectJson = "select ";
                string Query = "";

                for (int d = 0; d < COLUMN.Count; d++)
                {
                    InsertColumn += COLUMN[d].Trim()  + ",";
                    selectJson += "max(case when name=''" + COLUMN[d].Trim() + "'' then convert(nvarchar(100),StringValue) else '''' end) as " + COLUMN[d].Trim() + ",";

                }
                string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
                string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
                Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,EntityId,CreatedBy,CountryId,LocationFlag)" + selectJson.Trim() + " 1,0,getdate()," + entityid + "," + CreatedBy + "," + CountryId + ",1 FROM parseJSON(" + "''" +Jsondata.Trim()+ "''" + ") where ValueType = ''string'' OR  ValueType = ''int''group by parent_ID ";
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                          .Execute("@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "SaveLocation", CountryId, entityid, CreatedBy, Query, Tablename, columns));
                return results;
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> UpdateLocation(List<Object> AddressJson, string CreatedBy, string entityid, string CountryId, string Tablename)
        {
            try
            {
                Dictionary<string, object> results = new Dictionary<string, object>();
                string Query = "";
                for (int i = 0; i < AddressJson.Count; i++)
                {
                    string COLUMN = "";
                    string Address = Convert.ToString(AddressJson[i]);
                    string[] Address1 = Address.Split('&');
                    string autoId = Address1[0];   
                    JArray ar = JArray.Parse(Address1[1]);
                    foreach (JObject content in ar.Children<JObject>())
                    {
                        foreach (JProperty prop in content.Properties())
                        {

                            COLUMN += prop.Name + "=" + "''" + prop.Value + "''" + " ,";
                        }
                    }


                    Query = "Update " + Tablename + " set" + COLUMN + "UpdatedBy=" + CreatedBy + ",UpdatedOn=getdate()" + ",CountryId=" + CountryId + ",EntityId=" + entityid + " where AutoId=" + autoId;
                    DMSNEWEntities context = new DMSNEWEntities();
                    results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                              .Execute("@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "UpdateLocation", CountryId, entityid, CreatedBy, Query, Tablename));

                }
                return results;
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SaveParameterData(string JsonFieldItems, string TableName, string entityid, string CreatedBy, List<Object> Column, string CountryId, string ParameterId)
        {
            try
            {
                string InsertColumn = "";
                string selectJson = "select ";
                string Query = "";
                string CheckExist = "";
                for (int i = 0; i < Column.Count; i++)
                {
                    InsertColumn += Column[i] + ",";
                    selectJson += " max(case when name=''" + Column[i] + "'' then convert(nvarchar(100),StringValue) else '''' end) as " + Column[i] + ",";

                }
                string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
                string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
                Query = "insert Into " + TableName + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,EntityId,CreatedBy,CountryId,ParameterId)" + selectJson + " 1,0,getdate()," + entityid + "," + CreatedBy + " ," + CountryId + "," + "'" + ParameterId + "'" + " FROM parseJSON(" + "''" + JsonFieldItems + "''" + ") where ValueType = ''string'' OR  ValueType = ''int''group by parent_ID ";

                CheckExist = NewselectJson + "into #temp" + TableName + "" + " FROM parseJSON(" + "'" + JsonFieldItems + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                           .Execute("@QueryType", "@InsertQuery", "SaveParameterData", Query));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindOrgDataSetupGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrgDataSetupGrid>().With<Count>()
                          .Execute("@QueryType", "@LoadMore", "BindOrgDataSetupGrid", LoadData));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrgDataSetupGrid>().With<Count>()
                          .Execute("@QueryType", "@LoadMore", "@SearchValue", "BindOrgDataSetupGrid", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindParaDataSetupGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrgDataSetupGrid>().With<Count>()
                         .Execute("@QueryType", "@LoadMore", "BindParaDataSetupGrid", LoadData));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindOrgDataSetupGrid>().With<Count>()
                        .Execute("@QueryType", "@LoadMore", "@SearchValue", "BindParaDataSetupGrid", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindAssignedDataSetupGrid(string LoadData, string SearchValue, string EntityId)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAssignedDataSetupGrid>().With<Count>()
                      .Execute("@QueryType", "@LoadMore", "@entityid", "BindAssignedDataSetupGrid", LoadData, EntityId));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAssignedDataSetupGrid>().With<Count>()
                     .Execute("@QueryType", "@LoadMore", "@SearchValue", "BindAssignedDataSetupGrid", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //[WebMethod]
        //public Dictionary<string, object> BindAssignedDataSetupGridVendor(string LoadData, string SearchValue, string EntityId)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@entityid", "BindAssignedDataSetupGridVendor", LoadData, EntityId);
        //            return ClsJson.JsonMethods.ToJson(dt);
        //        }
        //        else
        //        {

        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@SearchValue", "BindAssignedDataSetupGrid", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        [WebMethod]
        public Dictionary<string, object> DisplayOrgLocation(string DataType, string entityId, string countryId)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@dataType", "@entityid", "@countryid", "BindDataOndblclick", DataType, entityId, countryId);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindParaOndblClick(string FieldId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindParaDataSetupdblClick>()
                       .Execute("@QueryType", "@fieldId", "BindParaDataSetupdblClick", FieldId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
