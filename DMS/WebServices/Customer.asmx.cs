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
using System.Text;
using System.Configuration;
using System.Net.Mail;

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
        [WebMethod]
        public Dictionary<string, object> BindCountry(string entity)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindCountry>().With<BindEntity>().With<BindPartGroup>().With<BindPartType>().With<BindPartStatus>()
                    .Execute("@QueryType", "@entityId", "BindDropDown", entity));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindTaxDropDowns(string entityId, string CountryId, string PartnerId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindTaxData>().With<BindAddressForTax>()
                     .Execute("@QueryType", "@entityId", "@countryId", "@PartId", "BindTaxdata", entityId, CountryId, PartnerId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> makeCredential(string Empid, string ImagePath, string CreatedBy ,string empemailId, string UserName)
        {
            try
            {
                Dictionary<string, object> results = new Dictionary<string, object>();
                string password = "";
                string passwordkey = "";
                if (SendMail(empemailId, UserName) == 1)
                {
                    string pwd = ConfigurationManager.AppSettings["DefaultPassword"];
                    password = DbSecurity.Encrypt(pwd, ref passwordkey);
                     results = Common.Getdata(context.MultipleResults("[dbo].[DMS_UserSetup]").With<Flag>()
                     .Execute("@QueryType", "@Password", "@PasswordKey", "@empid", "@createdby", "@imgpath", "makeemployeeCredential", password, passwordkey, Empid, CreatedBy,ImagePath));
                    return results;
                }
                else
                {
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> BindAddressDropDowns(string entityId, string CountryId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindAddressForTax>()
                     .Execute("@QueryType", "@entityId", "@countryId", "BindORGAddress", entityId, CountryId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> UpdatePartnerGroup(string PartnerType, string PartnerDescription, string AccountId, string dblclickGroupId, string userId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                 .Execute("@QueryType", "@AccountId", "@groupName", "@Description", "@groupId", "@UserId", "UpdatePartnerGroup", AccountId, PartnerType, PartnerDescription, dblclickGroupId, userId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> SavePartnerGroup(string JsonFields, string EntityId, string CountryId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                        .Execute("@QueryType", "@JsonFields", "@countryId", "@entityId", "SavePartnerGroup", JsonFields, CountryId, EntityId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindPartnerGroup(string SearchValue, string LoadData, string CountryId, string EntityId)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindPartnerGroup>().With<Count>()
                         .Execute("@QueryType", "@LoadMore", "@countryId", "@entityId", "BindPartnerGroup", LoadData, CountryId, EntityId));
                    return results;
                }
                else
                {
                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindPartnerGroup>().With<Count>()
                        .Execute("@QueryType", "@LoadMore", "@SearchValue", "SerarchBindPartners", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
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
                throw ex;
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
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindPartnerCode()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindPartnerCode>()
                        .Execute("@QueryType", "BindPartnerCode"));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindPartnerEmployee(string partnerId,string countryId,string entityId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<PartnerEmployee>().With<BindEmpAddress>()
                        .Execute("@QueryType", "@PartnerId", "@countryId", "@entityId", "BindpartnerEmployeeOndblClick",partnerId,countryId,entityId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> SaveEmployee(string Empjson,string EmpAddressjson)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                        .Execute("@QueryType", "@Empjson", "@EmpAddressjson", "SaveEmployeeData", Empjson,EmpAddressjson));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> UpdateEmployee(string Empjson, string EmpAddressjson)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                        .Execute("@QueryType", "@Empjson", "@EmpAddressjson", "UpdateEmployeeData", Empjson, EmpAddressjson));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [WebMethod]
        public Dictionary<string, object> SavePartner(List<Object> AddressJson, string PGroup, string PType, string PDescription, string Status, string CreatedBy, string entityid, string PCode, string PName, string PRepresetative, string EntityCountryId, string jsonExistingLocdata)
        {
            Dictionary<string, object> results = new Dictionary<string, object>();
            DataSet ds = new DataSet();
            try
            {
                string Resp = "";
                // DataTable dt = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "savePartner", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId);
                var results1 = context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                        .Execute("@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "savePartner", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId);


                foreach (List<Flag> cust in results1)
                {
                    Resp = cust.FirstOrDefault().Res;
                }

                if (results1.Count > 0)
                {
                    string Tablename = "";
                    string countryId = "";
                    string Query = "";
                    string columns = "";
                    string partnerId = Resp;
                    if (AddressJson.Count != 0)
                    {
                        for (int i = 0; i < AddressJson.Count; i++)
                        {

                            List<string> COLUMN = new List<string>();
                            string Address = Convert.ToString(AddressJson[i]).Trim();
                            string[] Address1 = Address.Split('&');
                            string Jsondata = Address1[1];
                            string Table = Address1[0];
                            string[] tabs = Table.Split(' ');
                            Tablename = "";
                            Tablename = tabs[0];
                            countryId = "";
                            countryId = tabs[1];

                            JArray ar = JArray.Parse(Address1[1]);
                            foreach (JObject content in ar.Children<JObject>())
                            {
                                foreach (JProperty prop in content.Properties())
                                {

                                    COLUMN.Add(prop.Name);
                                }
                            }
                            columns = "";
                            columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
                            for (int c = 0; c < COLUMN.Count; c++)
                            {

                                columns +=COLUMN[c].Trim()+ " " + "[varchar](250) NULL" + ",";

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
                            Query = "";
                            for (int d = 0; d < COLUMN.Count; d++)
                            {
                                InsertColumn += COLUMN[d].Trim()+",";
                                selectJson += " max(case when name=''"+ COLUMN[d].Trim()+ "'' then convert(nvarchar(100),StringValue) else '''' end) as " +COLUMN[d].Trim()+",";

                            }

                            string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
                            string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
                            Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,PartnerId,CreatedBy,CountryId,EntityId,LocationFlag)" + selectJson + " 1,0,getdate()," + partnerId + "," + CreatedBy + "," + countryId + "," + entityid + ",2 FROM parseJSON(" + "''" + Jsondata + "''" + ") where ValueType = ''string'' OR  ValueType = ''int'' group by parent_ID ";
                            DMSNEWEntities context = new DMSNEWEntities();
                            // ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "@ExistingLocation", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId, jsonExistingLocdata);
                            results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<PartnerSaveRes>()
                        .Execute("@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "@ExistingLocation", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId, jsonExistingLocdata));

                        }

                    }
                    else
                    {
                        DMSNEWEntities context = new DMSNEWEntities();
                        // ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "@ExistingLocation", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId, jsonExistingLocdata);
                        results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<PartnerSaveRes>()
                       .Execute("@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "@ExistingLocation", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId, jsonExistingLocdata));

                    }
                }
                return results;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public Dictionary<string, object> UpdatePartner(List<Object> AddressJson, List<Object> AddressJsonUpdate, string PGroup, string PType, string PDescription, string Status, string CreatedBy, string entityid, string PCode, string PName, string PRepresetative, string EntityCountryId, string PartnerId)
        {
            Dictionary<string, object> results = new Dictionary<string, object>();
            DataSet ds = new DataSet();
            try
            {

                //  DataTable dt = CommonManger.FillDatatableWithParam("DMS_Customers", "@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "@PartnerId", "UpdatePartner", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId, PartnerId);
                results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                       .Execute("@QueryType", "@PartnerCode", "@PartnerName", "@PartnerGroup", "@PartnerType", "@Description", "@PartnerRepresentative", "@entityId", "@PartnerStatus", "@CreatedBy", "@countryId", "@PartnerId", "UpdatePartner", PCode, PName, PGroup, PType, PDescription, PRepresetative, entityid, Status, CreatedBy, EntityCountryId, PartnerId));

                if (results.Count > 0)
                {
                    if (AddressJson.Count != 0)
                    {
                        string Tablename = "";
                        string countryId = "";
                        string Query = "";
                        string columns = "";
                        for (int i = 0; i < AddressJson.Count; i++)
                        {

                            List<string> COLUMN = new List<string>();
                            string Address = Convert.ToString(AddressJson[i]);
                            string[] Address1 = Address.Split('&');
                            string Jsondata = Address1[1];
                            string Table = Address1[0];
                            string[] tabs = Table.Split(' ');
                            Tablename = "";
                            Tablename = tabs[0];
                            countryId = "";
                            countryId = tabs[1];

                            JArray ar = JArray.Parse(Address1[1]);
                            foreach (JObject content in ar.Children<JObject>())
                            {
                                foreach (JProperty prop in content.Properties())
                                {

                                    COLUMN.Add(prop.Name);
                                }
                            }
                            columns = "";
                            columns += "AutoId" + " " + "[int] IDENTITY(1,1) NOT NULL" + ",";
                            for (int c = 0; c < COLUMN.Count; c++)
                            {

                                columns +="["+ COLUMN[c]+"]" + " " + "[varchar](250) NULL" + ",";

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
                            Query = "";
                            for (int d = 0; d < COLUMN.Count; d++)
                            {
                                InsertColumn += COLUMN[d] + ",";
                                selectJson += " max(case when name=''" + COLUMN[d] + "'' then convert(nvarchar(100),StringValue) else '''' end) as " + COLUMN[d] + ",";

                            }

                            string NewInsCols = InsertColumn.Remove(InsertColumn.Length - 1, 1);
                            string NewselectJson = selectJson.Remove(selectJson.Length - 1, 1);
                            Query = "insert Into " + Tablename + "(" + NewInsCols + ",IsActive,IsDeleted,CreatedOn,PartnerId,CreatedBy,CountryId,EntityId,LocationFlag)" + selectJson + " 1,0,getdate()," + PartnerId + "," + CreatedBy + "," + countryId + "," + entityid + ",2 FROM parseJSON(" + "''" + Jsondata + "''" + ") where ValueType = ''string'' OR  ValueType = ''int'' group by parent_ID ";
                            DMSNEWEntities context = new DMSNEWEntities();
                            //  ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, PartnerId);
                            results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<PartnerSaveRes>()
                        .Execute("@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId", "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, PartnerId));


                        }

                    }


                    string Tablename1 = "";
                    string countryId1 = "";
                    string Query1 = "";
                    string columns1 = "";
                    // string partnerId = Convert.ToString(dt.Rows[0]["Response"]);
                    if (AddressJsonUpdate.Count != 0)
                    {
                        for (int i = 0; i < AddressJsonUpdate.Count; i++)
                        {
                            string COLUMN = "";
                            string Address = Convert.ToString(AddressJsonUpdate[i]);
                            string[] Address1 = Address.Split('&');
                            string Jsondata = Address1[1];
                            string[] data = Jsondata.Split('#');
                            string autoId = data[1];
                            string Table = Address1[0];
                            string[] tabs = Table.Split(' ');
                            Tablename1 = "";
                            Tablename1 = tabs[0];
                            countryId1 = "";
                            countryId1 = tabs[1];

                            JArray ar = JArray.Parse(data[0]);
                            foreach (JObject content in ar.Children<JObject>())
                            {
                                foreach (JProperty prop in content.Properties())
                                {

                                    COLUMN += prop.Name + "=" + "''" + prop.Value + "''" + " ,";
                                }
                            }

                            Query1 = "Update " + Tablename1 + " set" + COLUMN + "UpdatedBy=" + CreatedBy + ",PartnerId=" + PartnerId + ",UpdatedOn=getdate()" + ",CountryId=" + countryId1 + ",EntityId=" + entityid + " where AutoId=" + autoId;
                            DMSNEWEntities context = new DMSNEWEntities();
                            // ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@InsertQuery", "@TableName", "UpdatePartnerAddress", Query1, Tablename1);
                            results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                        .Execute("@QueryType", "@InsertQuery", "@TableName", "UpdatePartnerAddress", Query1, Tablename1));


                        }

                    }
                    //else
                    //{

                    //    ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@countryid", "@entityid", "@CreatedBy", "@InsertQuery", "@TableName", "@ColumnName", "@PartnerId",  "SaveAddressPartner", countryId, entityid, CreatedBy, Query, Tablename, columns, partnerId);

                    //}
                }
                return results;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public Dictionary<string, object> saveTaxInfo(string TaxData)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                         .Execute("@QueryType", "@TaxJson", "SaveTaxInfo", TaxData));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        [WebMethod]
        public Dictionary<string, object> BindExistingLocation(string Entity, string Country)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindExistingLocation>()
                       .Execute("@QueryType", "@entityId", "@countryid", "BindExistingLocation", Entity, Country));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindPartner(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindPartnerGrid>().With<Count>()
                          .Execute("@QueryType", "@LoadMore", "Bindpartner", LoadData));
                    return results;
                }
                else
                {

                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindPartnerGrid>().With<Count>()
                         .Execute("@QueryType", "@LoadMore", "@SearchValue", "Bindpartner", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        [WebMethod]
        public Dictionary<string, object> BindPartnerOndblClick(string PartnerId)
        {
            try
            {
                DataSet ds = CommonManger.FillDatasetWithParam("DMS_Customers", "@QueryType", "@PartId", "BindpartnerOndblClick", PartnerId);
                return ClsJson.JsonMethods.ToJson(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        
        [WebMethod]
        public Dictionary<string, object> BindTaxGroup(string EntityId, string CountryId, string PartnerId)
        {
            try
            {
               
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindTaxGroup>().With<TaxtGroupId>()
                       .Execute("@QueryType", "@EntityId", "@CountryId", "@PartId", "GetTaxGrp", EntityId, CountryId, PartnerId));
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
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<Flag>()
                      .Execute("@QueryType", "@jsonData", "SaveTaxGroupWithItem", TaxGrpjson));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        

        [WebMethod]
        public Dictionary<string, object> BindAccount(string EntityId, string CountryId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Customers]").With<BindAccount>()
                       .Execute("@QueryType", "@EntityId", "@CountryId", "BindAccount", EntityId, CountryId));
                return results;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        private int SendMail( string emailid,string UserName)
        {
            string varifyedEmail = emailid;
            string randompass = "123456";

            #region For Admin User Mail
            if (varifyedEmail != "" && varifyedEmail != "0")
            {
                try
                {
                   // AdminEmail = Convert.ToString(dt.Tables[1].Rows[0]["EmailId"]);
                    StringBuilder sb = new StringBuilder();
                    string SMTPHost = ConfigurationManager.AppSettings["SMTPHost"].ToString();
                    string UserId = ConfigurationManager.AppSettings["UserId"].ToString();
                    string MailPassword = ConfigurationManager.AppSettings["MailPassword"].ToString();

                    string SMTPPort = ConfigurationManager.AppSettings["SMTPPort"].ToString();
                    string SMTPEnableSsl = ConfigurationManager.AppSettings["SMTPEnableSsl"].ToString();

                    sb.Append("Dear  " + UserName + ",<br> <br>");
                    sb.Append(" Your Default Password is: " + randompass + "<br> <br>");

                    sb.Append("<div><p style='font-size:16px; line-height:22px; color:#ed7d31; font-weight:bold; margin-bottom: 2px;'>Thanks & Regards</p> <div style='background-color:#e7e6e6; padding:6px 0px 15px 6px; border-right: 5px solid #dc9004; width:330px; margin-bottom: 15px;'><p style='font-size:18px; line-height:22px; color:#787878; font-weight:normal; margin-bottom: 5px;'>Support team</p><div><div style='display:inline-block; '><img src='../assets/img/globe-icon.png' style='border:none'/><p style='font-size:12px; color:#787878; text-decoration:underline; padding-left:5px; padding-right:7px; border-right: 1px solid #dc9004'>www.amysoftech.in</p> </div> <div style='display:inline-block; padding-left:4px'><img src='../assets/img/email-icon.png' style='border:none'/><p style='font-size:12px; color:#787878; text-decoration:underline; padding-left:5px'>support@amysoftech.in</p></div></div> </div> <p style=' margin-bottom: 0px; font-weight: bold; color: black; font-size: 16px; overflow: hidden; height: 15px;'>   ************************************************************************</p><p style=' font-size:14px; line-height:18px; color:#ed7d31; font-weight:normal; margin-bottom:0px; padding-bottom:5px'><strong>Note:</strong> This is a system generated email, do not reply on this email.</p><p style=' margin-bottom: 0px; font-weight: bold; color: black; font-size: 16px; overflow: hidden; height: 15px;'> ************************************************************************</p></div>");


                    SmtpClient smtpClient = new SmtpClient();

                    MailMessage mailmsg = new MailMessage();
                    MailAddress mailaddress = new MailAddress(UserId);

                   // mailmsg.To.Add(varifyedEmail);
                     mailmsg.To.Add("satyendaryadav093@gmail.com");
                    //mailmsg.Attachments.Add(new Attachment(memoryStream, "Mandate.pdf"));

                    mailmsg.Body = Convert.ToString(sb);
                    mailmsg.From = mailaddress;
                    mailmsg.Subject = "Default Password";
                    mailmsg.IsBodyHtml = true;
                    smtpClient.Host = SMTPHost;
                    smtpClient.Port = Convert.ToInt32(SMTPPort);
                    smtpClient.EnableSsl = Convert.ToBoolean(SMTPEnableSsl);
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential(UserId, MailPassword);
                    smtpClient.Send(mailmsg);

                    return 1;
                }
                catch (Exception ex)
                {

                    return 0;

                }

            }

            else
            {

                
                return 0;
            }
            #endregion

        }

    }
}
