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
    /// Summary description for TaxSetup
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class TaxSetup : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();
        BindADOResultset CommonManger = new BindADOResultset();

        [WebMethod]
        public Dictionary<string, object> BindDropDown()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Taxation>().With<BindCountry>().With<BindEntityForAddress>()
                          .Execute("@QueryType", "BindDropDown"));
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
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_AdminSetUp]").With<Binddatatype>()
                         .Execute("@QueryType", "BindDataTypeForTax"));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> SaveTaxFields(string JsonFields, string countryid, string CreatedBy, string TaxType, List<Object> dbcolumns)
        {

            try
            {
                var results = context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Taxinfo>()
                       .Execute("@QueryType", "@JsonFields", "@CreatedBy", "@countryid", "@TaxType", "SaveTaxSetupInfo", JsonFields, CreatedBy, countryid, TaxType);
                foreach (List<Taxinfo> taxinfo in results)
                {
                    if (dbcolumns.Count > 0)
                    {
                        string[] columns; DataTable dt = new DataTable(); DataRow dr;
                        dt.Columns.Add("FIELDID", typeof(String));
                        dt.Columns.Add("SUBCOMPONENTNAME", typeof(String));
                        dt.Columns.Add("COUNTRYID", typeof(String));
                        dt.Columns.Add("TAXTYPE", typeof(String));
                        dt.Columns.Add("CreatedBy", typeof(String));
                        for (int i = 0; i < taxinfo.Count; i++)
                        {
                            if (taxinfo[i].TaxDataType.ToString() == "2")
                            {
                                string FieldId = taxinfo[i].TaxSetupInfoId.ToString();
                                dt.Rows.Clear();
                                columns = Convert.ToString(dbcolumns[i]).Split(',');
                                for (int x = 2; x < columns.Length - 1; x++)
                                {
                                    dr = dt.NewRow();
                                    dr["FIELDID"] = taxinfo[i].TaxSetupInfoId.ToString();
                                    dr["SUBCOMPONENTNAME"] = columns[x].ToString();
                                    dr["COUNTRYID"] = countryid;
                                    dr["TAXTYPE"] = TaxType;
                                    dr["CreatedBy"] = CreatedBy;
                                    dt.Rows.Add(dr);
                                }
                                string savejson = DataTableToJSON(dt);
                                var results1 = context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Taxinfo>()
                      .Execute("@QueryType", "@Subcomponent", "@Fieldid", "InsertSubcomponent", savejson, FieldId);
                              
                            }
                        }

                    }
                  
                }
                return Common.Getdata(results);
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindTax(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    LoadData = "100";
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<TaxSetup>().With<Count>()
                       .Execute("@QueryType", "@LoadMore", "BindTaxSetupGrid", LoadData));
                    return results;
                  
                }
                else
                {
                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<TaxSetup>().With<Count>()
                      .Execute("@QueryType", "@LoadMore", "@SearchValue", "SerarchBindPartners", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindFieldOnRowDoubleClick(string TaxSetupId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Taxfield>().With<TaxSetup>()
                      .Execute("@QueryType", "@TaxFieldId", "BindTaxField", TaxSetupId));
                return results;

            }
            catch (Exception ex)
            {
                throw;
            }

        }
        [WebMethod]
        public Dictionary<string, object> BindSubField(string FieldId)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Taxinfosubcomponenet>()
                     .Execute("@QueryType", "@FieldId", "BindSubFields", FieldId));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        [WebMethod]
        public Dictionary<string, object> SaveSubField(string FieldId, string Jsondata)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Flag>()
                   .Execute("@QueryType", "@FieldId", "@Subcomponent", "InsertSubcomponentdblClick", FieldId, Jsondata));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        [WebMethod]
        public Dictionary<string, object> DisabledTaxField(string TaxSetupId, string UpdatedBy)
        {
            try
            {
    
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_TaxSetup]").With<Flag>()
                  .Execute("@QueryType", "@TaxFieldId", "@UpdatedBy", "DisabledTaxField", TaxSetupId, UpdatedBy));
                return results;
            }
            catch (Exception ex)
            {
                throw;
            }

        }
        public string DataTableToJSON(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }
    }
}
