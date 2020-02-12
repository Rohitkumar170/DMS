using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BusinessLibrary;
using DMS.Entity;
using DMS.Models.SequenceSetupClasses;
using DMS.Models;
using DMS.Models.EntitySetupClass;

namespace DMS.WebServices
{
    /// <summary>
    /// Summary description for Sequence
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Sequence : System.Web.Services.WebService
    {
        DMSNEWEntities context = new DMSNEWEntities();

        [WebMethod]
        public Dictionary<string, object> Bindcreatedsequence(string Pageid, string Fieldid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<BindCreatedSequence>()
                        .Execute("@QueryType", "@Pageid", "@Fieldid", "BindCreatedSequence", Pageid, Fieldid));
                return results;
            }
            catch(Exception ex) {
                throw ex;
            }
        }
        [WebMethod]
        public Dictionary<string, object> BindPages(string LoadData, string SearchValue)
        {
            try
            {
                if (SearchValue == "")
                {
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<BindPage>().With<Count>().With<PageFields>().With<Country>().With<BindEntity>().With<BindddlSequence>().With<BindddlFormate>()
                     .Execute("@QueryType", "@LoadMore", "BindPages", LoadData));
                    return results;
                }
                else
                {
                    string replacestring = SearchValue.Replace("$", "'");
                    var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<BindPage>().With<Count>().With<PageFields>().With<Country>().With<BindEntity>().With<BindddlSequence>().With<BindddlFormate>()
                    .Execute("@QueryType", "@LoadMore", "@SearchValue", "BindPages", LoadData, replacestring));
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        [WebMethod]
        public Dictionary<string, object> Deletetemp()
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<BindPage>()
                   .Execute("@QueryType", "DelSeq"));
                return results;
            }
            catch (Exception ex) { throw ex; }
        }
        [WebMethod]
        public Dictionary<string, object> Checkexist(string Pageid, string Fieldid, string Entityid, string Countryid)
        {
            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<Flag>()
                 .Execute("@QueryType", "@Pageid", "@Fieldid", "@Countryid", "@Entityid", "Checkexistance", Pageid, Fieldid, Entityid, Countryid));
                return results;
            }
            catch (Exception ex) { throw ex; }
        }
        [WebMethod]
        public Dictionary<string, object> SaveSequence(string Fixedjson, string SeqFlag)
        {

            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<Flag>()
                .Execute("@QueryType", "@jsonData", "@Seqflag", "SaveSeq", Fixedjson, SeqFlag));
                return results;
            }
            catch (Exception ex) { throw ex; }

        }
        [WebMethod]
        public Dictionary<string, object> SaveHSequence(string Headerjson)
        {

            try
            {
                var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<Flag>()
               .Execute("@QueryType", "@jsonData", "SaveHeaderSeq", Headerjson));
                return results;
            }
            catch (Exception ex) { throw ex; }

        }

        [WebMethod]
        public Dictionary<string, object> SeqDisabled(string seqId)
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<Flag>()
              .Execute("@QueryType", "@seqId", "SeqDisabled", seqId));
            return results;
        }
        [WebMethod]
        public Dictionary<string, object> SeqActive(string seqId)
        {
            var results = Common.Getdata(context.MultipleResults("[dbo].[DMS_Sequenesetup]").With<Flag>()
            .Execute("@QueryType", "@seqId", "SeqActive", seqId));
            return results;
            
        }
    }
}
