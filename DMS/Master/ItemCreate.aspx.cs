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
    public partial class ItemCreate : System.Web.UI.Page
    {
        BindADOResultset Commonmanager = new BindADOResultset();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblUserId.InnerText = Convert.ToString(Session["UserId"]);
            }
        }

        protected void btnUpload2_Click(object sender, EventArgs e)
        {

        }
        protected void btnUpload4_Click(object sender, EventArgs e)
        {

            try
            {
                DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUpload.PostedFile.FileName), FileUpload.PostedFile.FileName, Server.MapPath("../Import"), FileUpload);
                if (dt.Rows.Count == 0)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Please upload excel file";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 8)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                DMSNEWEntities context = new DMSNEWEntities();
                Dictionary<int, string> Itemtype = new Dictionary<int, string>();
                Itemtype.Add(1, "A"); Itemtype.Add(2, "B");
                Dictionary<int, string> Itemtrack = new Dictionary<int, string>();
                Itemtrack.Add(2, "A"); Itemtrack.Add(3, "B"); Itemtrack.Add(1, "C");
                Dictionary<int, string> Units = new Dictionary<int, string>();
                Units = context.BINDUNITS().AsEnumerable().Select(x => new {Unitid = x.Unitid,UnitName = x.UnitCode}).Distinct().ToDictionary(o => o.Unitid,o => o.UnitName);
                Dictionary<int, string> Groupcode = new Dictionary<int, string>();
                Groupcode = context.BINDGROUP().AsEnumerable().Select(x => new { Groupid = x.Groupid, Groupcode = x.GroupCode }).Distinct().ToDictionary(o => o.Groupid, o => o.Groupcode);
                Int64 Groupid = 0; Int64 Itemtyped = 0;  Int64 Itemtrackd = 0;  Int64 baseunitd = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    #region Conditional Logic
                    if (Convert.ToInt64(Groupcode.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemGroup"])).Key.ToString()) != 0)
                    {
                        Groupid = Convert.ToInt64(Groupcode.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemGroup"])).Key.ToString());
                    }
                    if (Convert.ToInt64(Itemtype.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemType"])).Key.ToString()) != 0)
                    {
                        Itemtyped = Convert.ToInt64(Itemtype.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemType"])).Key.ToString());
                    }
                    if (Convert.ToInt64(Itemtrack.FirstOrDefault(x => x.Value == Convert.ToString(dr["Itemtracking"])).Key.ToString()) != 0)
                    {
                        Itemtrackd = Convert.ToInt64(Itemtrack.FirstOrDefault(x => x.Value == Convert.ToString(dr["Itemtracking"])).Key.ToString());
                    }
                    if (Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["BaseUnit"])).Key.ToString()) != 0)
                    {
                        baseunitd = Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["BaseUnit"])).Key.ToString());
                    }
                    #endregion
                     context.DMS_ImportBulkItem(Convert.ToString(dr["Itemname"]), Groupid, Itemtyped, Convert.ToString(dr["Description"]),Convert.ToDecimal(dr["CartPrice"]), Convert.ToInt64(Session["UserId"].ToString()), Convert.ToInt32(Itemtrackd), Convert.ToString(dr["ItemCode"]), baseunitd);
                }
                context.SaveChanges();
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");
            }
            catch (Exception ex) { throw ex; }
           
        }
        protected void btnUpload3_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUpload3.PostedFile.FileName), FileUpload3.PostedFile.FileName, Server.MapPath("../Import"), FileUpload3);
                if (dt.Rows.Count == 0)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Please upload excel file";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 2)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                DMSNEWEntities context = new DMSNEWEntities();
                Dictionary<int, string> Units = new Dictionary<int, string>();
                Units = context.BINDUNITS().AsEnumerable().Select(x => new { Unitid = x.Unitid, UnitName = x.UnitCode }).Distinct().ToDictionary(o => o.Unitid, o => o.UnitName);
                Dictionary<Int64, string> ItemCode = new Dictionary<Int64, string>();
                ItemCode = context.DMS_BindItemcode().AsEnumerable().Select(x => new { Itemid = x.Itemid, ItemCode = x.ItemCode }).Distinct().ToDictionary(o => o.Itemid, o => o.ItemCode);
                Int64 ItemCoded = 0;  Int64 baseunitd = 0;
                foreach (DataRow dr in dt.Rows)
                {
                   #region Conditional Logic for import otherunits
                    if (Convert.ToInt64(ItemCode.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemCode"])).Key.ToString()) != 0)
                    {
                        ItemCoded = Convert.ToInt64(ItemCode.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemCode"])).Key.ToString());
                    }
                    if (Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["OtherUnitCode"])).Key.ToString()) != 0)
                    {
                        baseunitd = Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["OtherUnitCode"])).Key.ToString());
                    }
                    #endregion
                  context.DMS_ImportBulkOtherunit(ItemCoded,  Convert.ToInt64(Session["UserId"].ToString()), baseunitd);
                }
                context.SaveChanges();
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");
            }
            catch (Exception ex) { throw ex; }
        }
        protected void btnUpload5_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUpload5.PostedFile.FileName), FileUpload5.PostedFile.FileName, Server.MapPath("../Import"), FileUpload5);
                if (dt.Rows.Count == 0)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Please upload excel file";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 5)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                DMSNEWEntities context = new DMSNEWEntities();
                Dictionary<int, string> Units = new Dictionary<int, string>();
                Units = context.BINDUNITS().AsEnumerable().Select(x => new { Unitid = x.Unitid, UnitName = x.UnitCode }).Distinct().ToDictionary(o => o.Unitid, o => o.UnitName);
                Dictionary<Int64, string> ItemCode = new Dictionary<Int64, string>();
                ItemCode = context.DMS_BindItemcode().AsEnumerable().Select(x => new { Itemid = x.Itemid, ItemCode = x.ItemCode }).Distinct().ToDictionary(o => o.Itemid, o => o.ItemCode);
                Int64 ItemCoded = 0; Int64 baseunitd = 0; Int64 Otherunitd = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    #region Conditional Logic for import otherunits

                    if (Convert.ToInt64(ItemCode.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemCode"])).Key.ToString()) != 0)
                    {
                        ItemCoded = Convert.ToInt64(ItemCode.FirstOrDefault(x => x.Value == Convert.ToString(dr["ItemCode"])).Key.ToString());
                    }
                    if (Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["ToUnit"])).Key.ToString()) != 0)
                    {
                        baseunitd = Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["ToUnit"])).Key.ToString());
                    }
                    if (Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["FromUnit"])).Key.ToString()) != 0)
                    {
                        Otherunitd = Convert.ToInt64(Units.FirstOrDefault(x => x.Value == Convert.ToString(dr["FromUnit"])).Key.ToString());
                    }
                    #endregion
                    context.DMS_ImportItemConversion(ItemCoded, Convert.ToDecimal(dr["Value"]),baseunitd,Otherunitd, Convert.ToDecimal(dr["ConvertedValue"]), Convert.ToInt64(Session["UserId"].ToString()));
                }
                context.SaveChanges();
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");
            }
            catch (Exception ex) { throw ex; }
        }
    }
}