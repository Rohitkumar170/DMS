﻿using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using DMS.Entity;
using BusinessLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using DMS.Models.ItemSetupClass;
namespace DMS.Master
{
    public partial class Partner : System.Web.UI.Page
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
                    Groupid = 0; Itemtyped = 0;
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


        protected void btnUploadAddress_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUploadAddress.PostedFile.FileName), FileUploadAddress.PostedFile.FileName, Server.MapPath("../Import"), FileUploadAddress);
                if (dt.Rows.Count == 0)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Please upload excel file";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 9)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count <= 1)
                {
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                DMSNEWEntities context = new DMSNEWEntities();
                Dictionary<Int64, string> PartnerId = new Dictionary<Int64, string>();
                PartnerId = context.DMS_GetPartnerId().AsEnumerable().Select(x => new { PartnerId = x.PartnerId, PartnerCode = x.PartnerCode }).Distinct().ToDictionary(o => o.PartnerId, o => o.PartnerCode);
               
                Int64 PartId = 0; 
                foreach (DataRow dr in dt.Rows)
                {
                    #region Conditional Logic
                    PartId = 0;
                    if (Convert.ToInt64(PartnerId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString()) != 0)
                    {
                        PartId = Convert.ToInt32(PartnerId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString());
                    }
                    #endregion
                    context.DMS_ImportPartnerAddress(PartId,Convert.ToString(dr["LocationCode"].ToString().Trim()), Convert.ToString(dr["LocationName"].ToString().Trim()), Convert.ToString(dr["LocationDescription"].ToString().Trim()), Convert.ToString(dr["AddressLine1"].ToString().Trim()), Convert.ToString(dr["Street"].ToString().Trim()), Convert.ToString(dr["POBox"].ToString().Trim()), Convert.ToString(dr["ZipCode"].ToString().Trim()), Convert.ToString(dr["Atolls"].ToString().Trim()), Convert.ToInt64(Session["UserId"].ToString()));
                }
                context.SaveChanges();
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");
            }
            catch (Exception ex) { throw ex; }

        }

        protected void btnUploadLegalField_Click(object sender, EventArgs e)
        {
            try
            {
               
                DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUploadLegalField.PostedFile.FileName), FileUploadLegalField.PostedFile.FileName, Server.MapPath("../Import"), FileUploadLegalField);
                DataTable newTable = dt.Clone();
                if (dt.Rows.Count == 0)
                {
                    string Message = "Please upload excel file";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 4)
                {
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count <= 1)
                {
                    string Message = "Excel is not in Proper format";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                DMSNEWEntities context = new DMSNEWEntities();
                Dictionary<Int64, string> PartnerId = new Dictionary<Int64, string>();
                PartnerId = context.DMS_GetPartnerId().AsEnumerable().Select(x => new { PartnerId = x.PartnerId, PartnerCode = x.PartnerCode }).Distinct().ToDictionary(o => o.PartnerId, o => o.PartnerCode);

                Dictionary<Int64, string> LegaFieldId = new Dictionary<Int64, string>();
                LegaFieldId = context.DMS_GetLegalFieldId().AsEnumerable().Select(x => new { TaxSetupInfoId = x.TaxSetupInfoId, LegalFieldName = x.FieldName }).Distinct().ToDictionary(o => o.TaxSetupInfoId, o => o.LegalFieldName);
                int Address = 0; int FieldID = 0;Int64 PartId = 0;
                foreach (DataRow dr in dt.Rows)
                {
                    Address = 0; FieldID = 0;
                    #region Conditional Logic
                    PartId = 0;
                    if (Convert.ToInt64(PartnerId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString()) != 0)
                    {
                        PartId = Convert.ToInt32(PartnerId.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString());
                    }
                    else {
                        newTable.Rows.Add(dr.ItemArray);
                        break;
                    }
                    if (Convert.ToInt64(LegaFieldId.FirstOrDefault(x => x.Value == Convert.ToString(dr["LegalFieldName"])).Key.ToString()) != 0)
                    {
                        FieldID = Convert.ToInt32(LegaFieldId.FirstOrDefault(x => x.Value == Convert.ToString(dr["LegalFieldName"])).Key.ToString());
                    }
                    else
                    {
                        newTable.Rows.Add(dr.ItemArray);
                        break;
                    }
                    Dictionary<int, string> AddressId = new Dictionary<int, string>();
                    AddressId = context.DMS_GetPartnerAddressId(Convert.ToInt64(PartId)).AsEnumerable().Select(x => new { autoid = x.AutoId, LocationCode = x.LocationCode }).Distinct().ToDictionary(o => o.autoid, o => o.LocationCode);
                    if (Convert.ToInt32(AddressId.FirstOrDefault(x => x.Value == Convert.ToString(dr["LocationCode"])).Key.ToString()) != 0)
                    {
                        Address = Convert.ToInt32(AddressId.FirstOrDefault(x => x.Value == Convert.ToString(dr["LocationCode"])).Key.ToString());
                    }
                    else
                    {
                        newTable.Rows.Add(dr.ItemArray);
                        break;
                    }
                    #endregion
                    context.DMS_ImporPartnerLegalField(Convert.ToInt64(FieldID), Convert.ToInt64(Address), Convert.ToString(dr["FieldValue"].ToString().Trim()), Convert.ToInt64(PartId),  Convert.ToInt64(Session["UserId"].ToString()));
                }
                context.SaveChanges();
                if (newTable.Rows.Count > 0)
                {
                    grdpartner.DataSource = newTable;
                    grdpartner.DataBind();
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "showrejectedPopup();", true);
                    return;
                }
            }
            catch (Exception ex) { throw ex; }

        }

        protected void btnUploademp_Click(object sender, EventArgs e)
        {
            DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUploadEmp.PostedFile.FileName), FileUploadEmp.PostedFile.FileName, Server.MapPath("../Import"), FileUploadEmp);
            DataTable Newdt = dt.Clone();
            if (dt.Rows.Count == 0)
            {
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");
                string Message = "Please upload excel file";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                return;
            }
            if (dt.Columns.Count != 6)
            {
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");
                string Message = "Excel is not in Proper format";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                return;
            }
            DMSNEWEntities context = new DMSNEWEntities();
            Dictionary<int, string> Locationcode = new Dictionary<int, string>();
            var TableName = context.tblmstOrgLocationTables.Where(u => u.EntityId == 1 && u.CountryId == 1 && u.IsActive == true).Select(u => u.TablesName).SingleOrDefault();
            Locationcode = context.Database.SqlQuery<Getclassname>(string.Format("SELECT AutoId,LocationCode FROM {0} WHERE LocationFlag=2 and  IsActive=1", TableName), 1).AsEnumerable()
                .Select(x => new { Groupid = x.AutoId, Groupc = x.LocationCode }).Distinct().ToDictionary(o => o.Groupid, o => o.Groupc);
            Dictionary<Int64, string> Partnercode1 = new Dictionary<Int64, string>();
            string partnertable = "tblPartner";
            Partnercode1 = context.Database.SqlQuery<GetPartneridbycode>(string.Format("SELECT PartnerId,PartnerCode FROM {0} WHERE IsActive=1", partnertable), 1).AsEnumerable()
                .Select(x => new { Partnercodes = x.PartnerId, Groupc = x.PartnerCode }).Distinct().ToDictionary(o => o.Partnercodes, o => o.Groupc);
            int Groupid = 0; int partnerid = 0; int flag = 0;
            foreach (DataRow dr in dt.Rows)
            {
                #region Conditional Logic
                if (Convert.ToInt64(Locationcode.FirstOrDefault(x => x.Value == Convert.ToString(dr["LocationCode"])).Key.ToString()) != 0)
                {
                    Groupid = Convert.ToInt32(Locationcode.FirstOrDefault(x => x.Value == Convert.ToString(dr["LocationCode"])).Key.ToString());
                    flag = 1;
                }
                else
                {
                    Newdt.Rows.Add(dr.ItemArray);
                    flag = 0;
                    //  break;
                }
                if (Convert.ToInt64(Partnercode1.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString()) != 0)
                {
                    partnerid = Convert.ToInt32(Partnercode1.FirstOrDefault(x => x.Value == Convert.ToString(dr["PartnerCode"])).Key.ToString());
                    flag = 1;
                }
                else
                {
                    Newdt.Rows.Add(dr.ItemArray);
                    //  break;
                    flag = 0;
                }


                #endregion
                if (flag == 1)
                {
                      context.DMSImport_Employee(Convert.ToString(dr["EmployeeName"]), Convert.ToString(dr["MobileNo"]), Convert.ToString(dr["EmailId"]), Convert.ToInt64(1), Convert.ToInt64(1), Convert.ToInt64(Session["UserId"].ToString()),Convert.ToInt32(partnerid), Convert.ToInt32(Groupid));
                    flag = 0;
                }
                }
            context.SaveChanges();
           
           
         
            preloader.Style.Add("display", "none");
            Overlay_Load.Style.Add("display", "none");
            if (Newdt.Rows.Count > 0)
            {
                grdpartner.DataSource = Newdt;
                grdpartner.DataBind();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "showrejectedPopup();", true);
                return;
            }

        }
    }
}