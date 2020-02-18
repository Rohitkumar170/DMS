using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using DMS.Entity;
using BusinessLibrary;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DMS.Master
{
    public partial class Partner : System.Web.UI.Page
    {
        BindADOResultset Commonmanager = new BindADOResultset();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblUserId.InnerText = Convert.ToString(Session["UserId"]);
            }

        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUpload.PostedFile.FileName), FileUpload.PostedFile.FileName, Server.MapPath("../Import"), FileUpload);
                if (dt.Rows.Count == 0)
                {
                    string Message = "Please upload excel file";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 6)
                {
                    string Message = "Excel is not in Proper format";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count <= 1)
                {
                    string Message = "Excel is not in Proper format";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('" + Message + "');", false);
                    return;
                }
                DMSNEWEntities context = new DMSNEWEntities();
                Dictionary<Int64, string> PartnerGroupId = new Dictionary<Int64, string>();
                PartnerGroupId = context.DMS_BindPartnerGroupId().AsEnumerable().Select(x => new { PartnerTypeId = x.PartnerTypeId, PartnerGroup = x.PartnerType }).Distinct().ToDictionary(o => o.PartnerTypeId, o => o.PartnerGroup);
                Dictionary<Int64, string> PartnerTypeId = new Dictionary<Int64, string>();
                PartnerTypeId = context.DMS_BindPartnerTypeId().AsEnumerable().Select(x => new { PartnerTypeId = x.PartnerTypeId, PartnerType = x.partnerType }).Distinct().ToDictionary(o => o.PartnerTypeId, o => o.PartnerType);
                int Groupid = 0; int Itemtyped = 0; 
                foreach (DataRow dr in dt.Rows)
                {
                    #region Conditional Logic
                    if (Convert.ToInt64(PartnerGroupId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerGroup"])).Key.ToString()) != 0)
                    {
                        Groupid = Convert.ToInt32(PartnerGroupId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerGroup"])).Key.ToString());
                    }
                    if (Convert.ToInt64(PartnerTypeId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerType"])).Key.ToString()) != 0)
                    {
                        Itemtyped = Convert.ToInt32(PartnerTypeId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerType"])).Key.ToString());
                    }

                    #endregion
                    context.DMS_ImportPartners(Convert.ToString(dr["PartnerCode"].ToString().Trim()), Convert.ToString(dr["PartnerName"].ToString().Trim()), Groupid, Itemtyped, Convert.ToString(dr["Description"].ToString().Trim()), Convert.ToString(dr["PartnerRepresentative"].ToString().Trim()),Convert.ToInt32(1), Convert.ToInt32(1), Convert.ToInt64(Session["UserId"].ToString()), Convert.ToInt32(1));
                }
                context.SaveChanges();
            }
            catch (Exception ex) { throw ex; }

        }

    }
}