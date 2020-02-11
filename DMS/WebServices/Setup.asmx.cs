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
                throw;
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
                throw;
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
            throw;
        }

    }
    //[WebMethod]
    //public Dictionary<string, object> BindDataTypeOrgParam(string OrgFlag)
    //{
    //    try
    //    {
    //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@Orgflag", "BindOrganizationdataType", OrgFlag);
    //        return ClsJson.JsonMethods.ToJson(dt);
    //    }
    //    catch (Exception ex)
    //    {
    //        throw;
    //    }

    //}
    [WebMethod]
        public Dictionary<string, object> BindFieldAddressGrid(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<BindAddressFieldGrid>().With<Count>().With<BindAddressField>().With<BindAddressClass>()
                           .Execute("@QueryType", "@LoadMore","BindAddressFieldGrid",LoadData));
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
                throw;
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
                             .Execute("@QueryType", "@LoadMore", "@SearchValue", "BindFieldSetupGrid", LoadData,replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw;
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
                //DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@JsonFields", "@entityid", "@countryid", "SaveAddressFields", JsonFields, entityid, countryid);
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
                        //DataSet dt1 = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@TableName", "@ColumnName", "@countryid", "@entityid", "Createtable", tablename, columns, countryid, entityid);
                        results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Flag>()
                          .Execute("@QueryType", "@TableName", "@ColumnName", "@countryid", "@entityid", "Createtable", tablename, columns, countryid, entityid));
                      


                    }

                    #endregion
                }
                return results;

                #endregion
            }
            catch (Exception ex)
            {
                throw ex;
            }

            //DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@TableName", "@ColumnName", "Createtable", tablename, columns);
            //return ClsJson.JsonMethods.ToJson(dt);



            //try
            //{
            //    if (editFlag == "0")
            //    {
            //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@JsonFields", "SaveAddressFields", JsonFields);
            //        return ClsJson.JsonMethods.ToJson(dt);
            //    }
            //    else {
            //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@JsonFields", "UpdateAddressFields", JsonFields);
            //        return ClsJson.JsonMethods.ToJson(dt);
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw;
            //}
            //DataSet dt = CommonManger.FillDatasetWithParam("", "@QueryType", "@JsonFields", "UpdateAddressFields", JsonFields);
            //return ClsJson.JsonMethods.ToJson(dt);
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
                throw;
            }

            }
        //[WebMethod]
        //public Dictionary<string, object> SaveAddress(string AddressLineJson, string CountryJson)
        //{
        //    try
        //    {
        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@AddressLineJson", "@CountryJson", "SaveAddress", AddressLineJson, CountryJson);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
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
                throw;
            }

        }
        //[WebMethod]
        //public Dictionary<string, object> DeleteFieldEntity(string Country, string Entity)
        //{
        //    try
        //    {
        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@countryid", "@entityid", "DeleteFieldsEntity", Country, Entity);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
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
                throw;
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
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> GetTableColumn(string TableName)
        {

          
                try
                {
                    DataSet ds =CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@TableName", "GetDynamicTableColumn", TableName);
                    return ClsJson.JsonMethods.ToJson(ds);
                }
                catch (Exception ex)
                {
                    throw;
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
                throw;
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
                throw;
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
        //[WebMethod]
        //public Dictionary<string, object> saveOrganizationParameter(string JsonFields, string editFlag, List<Object> dbcolumns, string entityid, string countryid, string OrgFlag)
        //{


        //    string columns = "";
        //    string tablename = "";
        //    string[] col;
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@JsonFields", "@entityid", "@countryid", "@Orgflag", "SavaOrganizationPara", JsonFields, entityid, countryid, OrgFlag);
        //        if (dt.Tables[0].Rows.Count > 0)
        //        {

        //            for (int i = 0; i < dbcolumns.Count; i++)
        //            {
        //                columns = ""; tablename = "";
        //                col = Convert.ToString(dbcolumns[i]).Split(',');
        //                for (int x = 0; x < col.Length - 1; x++)
        //                {
        //                    if (x == 0)
        //                    {
        //                        tablename = col[x].ToString();
        //                    }
        //                    else if (x == 1)
        //                    {
        //                        string identitycol = col[x].ToString() + "Autoid";
        //                        columns += identitycol + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";

        //                    }
        //                    else
        //                    {
        //                        columns += col[x].ToString() + ",";
        //                    }
        //                }
        //                columns += "[ParameterId] [nvarchar](100)" + ' ' + " NULL" + ',';
        //                columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
        //                columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
        //                columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
        //                columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
        //                columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
        //                columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
        //                columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
        //                columns += "[IsDeleted] [bit]" + ' ' + "NULL";

        //                DataSet dt1 = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@TableName", "@ColumnName", "@countryid", "@entityid", "@Orgflag", "CreatetableOrgPara", tablename, columns, countryid, entityid, OrgFlag);


        //            }


        //        }
        //        return ClsJson.JsonMethods.ToJson(dt);


        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }



        //}
        //[WebMethod]
        //public Dictionary<string, object> BinOrgParaGrid(string LoadData, string SearchValue, string OrgFlag)
        //{

        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@Orgflag", "BindOrgParaGrid", LoadData, OrgFlag);
        //            return ClsJson.JsonMethods.ToJson(dt);
        //        }
        //        else
        //        {

        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@SearchValue", "@Orgflag", "BindOrgParaGrid1", LoadData, replacestring, OrgFlag);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindOrgParaddl(string CountryId, string EntityId)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@countryid", "@entityid", "BindOrgParaddl", CountryId, EntityId);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindParaParaddl(string CountryId, string EntityId)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@countryid", "@entityid", "BindParaParaddl", CountryId, EntityId);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindAssigneditem(string CountryId, string EntityId)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@countryid", "@entityid", "BindAssigned", CountryId, EntityId);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
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
        //[WebMethod]
        //public Dictionary<string, object> BindPartnerLocation(string PartnerId, string Entityid)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_Transaction", "@QueryType", "@Partid", "@Entityid", "BindPartnerLocation", PartnerId, Entityid);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
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
        //[WebMethod]
        //public Dictionary<string, object> Binditems(string Assignedid)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_Transaction", "@QueryType", "@Assigneditemid", "BindItems", Assignedid);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
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
        //[WebMethod]
        //public Dictionary<string, object> GetOrgFieldName(string TableName)
        //{
        //    try
        //    {
        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@TableName", "GetOrgColumn", TableName);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SaveParaLocation(string Jsondata)
        //{
        //    try
        //    {
        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@jsonData", "SaveParalocaton", Jsondata);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SaveAssigneditem(string Jsondata, string Jsonitems)
        //{
        //    try
        //    {
        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@jsonData", "@JsonFields", "SaveAssignedItem", Jsondata, Jsonitems);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}

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
        //[WebMethod]
        //public Dictionary<string, object> SaveLocation(List<Object> AddressJson, string CreatedBy, string entityid, string CountryId, string Tablename)
        //{
        //    try
        //    {
        //        string Jsondata = "[";
        //        string jsonString = "";
        //        for (int k = 0; k < AddressJson.Count; k++)
        //        {
        //            string a = Convert.ToString(AddressJson[k]);
        //            string str = a.Remove(a.Length - 1, 1);
        //            string finalstr = str.Remove(0, 1);

        //            jsonString += finalstr + ",";

        //        }
        //        string str1 = jsonString.Remove(jsonString.Length - 1, 1);
        //        str1 += "]";
        //        Jsondata += str1;

        //        List<string> COLUMN = new List<string>();
        //        string Address = Convert.ToString(AddressJson[0]);
        //        string[] Address1 = Address.Split('&');
        //        JArray ar = JArray.Parse(Address1[0]);
        //        foreach (JObject content in ar.Children<JObject>())
        //        {
        //            foreach (JProperty prop in content.Properties())
        //            {

        //                COLUMN.Add(prop.Name);
        //            }
        //        }
        //        string columns = "";
        //        columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
        //        for (int c = 0; c < COLUMN.Count; c++)
        //        {

        //            columns += COLUMN[c] + " " + "[varchar](250) NULL" + ",";

        //        }
        //        columns += "[CountryId] [bigint]" + ' ' + " NULL" + ',';
        //        columns += "[EntityId] [bigint]" + ' ' + " NULL" + ',';
        //        columns += "[PartnerId] [bigint]" + ' ' + " NULL" + ',';
        //        columns += "[LocationFlag] [bigint]" + ' ' + " NULL" + ',';
        //        columns += "[CreatedOn] [Datetime]" + ' ' + "NULL" + ',';
        //        columns += "[UpdatedOn] [varchar](100)" + ' ' + "NULL" + ',';
        //        columns += "[CreatedBy] [bigint]" + ' ' + "NULL" + ',';
        //        columns += "[UpdatedBy] [int]" + ' ' + "NULL" + ',';
        //        columns += "[IsActive] [bit]" + ' ' + "NULL" + ',';
        //        columns += "[IsDeleted] [bit]" + ' ' + "NULL";

        //        string InsertColumn = "";
        //        string selectJson = "select ";
        //        string Query = "";

        //        for (int d = 0; d < COLUMN.Count; d++)
        //        {
        //            InsertColumn += COLUMN[d] + ",";
        //            selectJson += " max(case when name='" + COLUMN[d] + "' then convert(nvarchar(100),StringValue) else '' end) as " + COLUMN[d] + ",";

        //        }
        //        string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
        //        string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
        //        Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,EntityId,CreatedBy,CountryId,LocationFlag)" + selectJson + " 1,0,getdate()," + entityid + "," + CreatedBy + "," + CountryId + ",1 FROM parseJSON(" + "'" + Jsondata + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";


        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "SaveLocation", CountryId, entityid, CreatedBy, Query, Tablename, columns);
        //        return ClsJson.JsonMethods.ToJson(ds);

        //    }

        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> SaveParameterData(string JsonFieldItems, string TableName, string entityid, string CreatedBy, List<Object> Column, string CountryId, string ParameterId)
        //{
        //    try
        //    {
        //        string InsertColumn = "";
        //        string selectJson = "select ";
        //        string Query = "";
        //        string CheckExist = "";
        //        for (int i = 0; i < Column.Count; i++)
        //        {
        //            InsertColumn += Column[i] + ",";
        //            selectJson += " max(case when name='" + Column[i] + "' then convert(nvarchar(100),StringValue) else '' end) as " + Column[i] + ",";

        //        }
        //        string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
        //        string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
        //        Query = "insert Into " + TableName + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,EntityId,CreatedBy,CountryId,ParameterId)" + selectJson + " 1,0,getdate()," + entityid + "," + CreatedBy + " ," + CountryId + "," + "'" + ParameterId + "'" + " FROM parseJSON(" + "'" + JsonFieldItems + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";

        //        CheckExist = NewselectJson + "into #temp" + TableName + "" + " FROM parseJSON(" + "'" + JsonFieldItems + "'" + ") where ValueType = 'string' OR  ValueType = 'int'group by parent_ID ";
        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@InsertQuery", "SaveParameterData", Query);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindOrgDataSetupGrid(string LoadData, string SearchValue)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "BindOrgDataSetupGrid", LoadData);
        //            return ClsJson.JsonMethods.ToJson(dt);
        //        }
        //        else
        //        {

        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@SearchValue", "BindOrgDataSetupGrid", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindParaDataSetupGrid(string LoadData, string SearchValue)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "BindParaDataSetupGrid", LoadData);
        //            return ClsJson.JsonMethods.ToJson(dt);
        //        }
        //        else
        //        {

        //            string replacestring = SearchValue.Replace("$", "'");
        //            DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@SearchValue", "BindParaDataSetupGrid", LoadData, replacestring);
        //            return ClsJson.JsonMethods.ToJson(ds);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }
        //}
        //[WebMethod]
        //public Dictionary<string, object> BindAssignedDataSetupGrid(string LoadData, string SearchValue, string EntityId)
        //{
        //    try
        //    {
        //        if (SearchValue == "")
        //        {
        //            DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@LoadMore", "@entityid", "BindAssignedDataSetupGrid", LoadData, EntityId);
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
        //[WebMethod]
        //public Dictionary<string, object> DisplayOrgLocation(string DataType, string entityId, string countryId)
        //{
        //    try
        //    {
        //        DataSet ds = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@dataType", "@entityid", "@countryid", "BindDataOndblclick", DataType, entityId, countryId);
        //        return ClsJson.JsonMethods.ToJson(ds);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
        //[WebMethod]
        //public Dictionary<string, object> BindParaOndblClick(string FieldId)
        //{
        //    try
        //    {

        //        DataSet dt = CommonManger.FillDatasetWithParam("DMS_AdminSetUp", "@QueryType", "@fieldId", "BindParaDataSetupdblClick", FieldId);
        //        return ClsJson.JsonMethods.ToJson(dt);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw;
        //    }

        //}
    }
}
