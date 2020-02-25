using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using DMS.Entity;
using BusinessLibrary;
using DMS.Models.ItemSetupClass;

namespace DMS.Master
{
    public partial class ItemAssigned : System.Web.UI.Page
    {
        BindADOResultset Commonmanager = new BindADOResultset();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("../login.aspx");
            }
            if (!IsPostBack)
            {
                lblUserId.InnerText = Convert.ToString(Session["UserId"]);
               
            }

        }
        protected void btnUpload4_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUpload.PostedFile.FileName), FileUpload.PostedFile.FileName, Server.MapPath("../Import"), FileUpload);
                if (dt.Rows.Count == 0)
                {
                    string Message = "Please upload excel file";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    return;
                }
                if (dt.Columns.Count != 5)
                {
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    return;
                }

               
                DMSNEWEntities context = new DMSNEWEntities();
                Dictionary<Int64, string> Partnerid = new Dictionary<Int64, string>();
                Partnerid = context.DMS_Partner().AsEnumerable().Select(x => new { Partid = x.PartnerId, PartCode = x.PartnerCode }).Distinct().ToDictionary(o => o.Partid, o => o.PartCode);
                Dictionary<int, string> Locationid = new Dictionary<int, string>();
                Locationid = context.DMS_Locationid().AsEnumerable().Select(x => new { Locationid = x.AutoId, Locationcode = x.LocationCode }).Distinct().ToDictionary(o => o.Locationid, o => o.Locationcode);
                Dictionary<Int64, string> Itemid = new Dictionary<Int64, string>();
                Itemid = context.DMS_BindItemcode().AsEnumerable().Select(x => new { Items = x.Itemid, ItemCodes = x.ItemCode }).Distinct().ToDictionary(o => o.Items, o => o.ItemCodes);
                Int64 Partner = 0; Int64 Location = 0; Int64 Item = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    #region Conditional Logic
                    if (Convert.ToInt64(Partnerid.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString()) != 0)
                    {
                        Partner = Convert.ToInt64(Partnerid.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString());
                    }
                     if (Convert.ToInt64(Locationid.FirstOrDefault(x => x.Value == Convert.ToString(dr["LocationCode"])).Key.ToString()) != 0)
                    {
                        Location = Convert.ToInt64(Locationid.FirstOrDefault(x => x.Value == Convert.ToString(dr["LocationCode"])).Key.ToString());
                    }
                   if (Convert.ToInt64(Itemid.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemCode"])).Key.ToString()) != 0)
                    {
                        Item = Convert.ToInt64(Itemid.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemCode"])).Key.ToString());
                    }

                    #endregion
                    context.DMS_IMPORTBULKAssigneditem(Partner, Convert.ToInt64(Session["UserId"].ToString()), Location, Convert.ToInt32(1), Convert.ToInt32(1), Item, Convert.ToDecimal(dr["MinimumQty"]), Convert.ToDecimal(dr["MaximumQty"]));
                }
                context.SaveChanges();
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");

            }
            catch (Exception ex) { throw ex; }
        }
    }
}