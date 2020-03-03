using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DMS.Entity;
using BusinessLibrary;
using DMS.Models.ItemSetupClass;
using System.Data;
using System.IO;
namespace DMS.Master
{
    public partial class OrganizationDataSetup : System.Web.UI.Page
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
            DataTable dt = Commonmanager.ExcelImport(Path.GetExtension(FileUpload.PostedFile.FileName), FileUpload.PostedFile.FileName, Server.MapPath("../Import"), FileUpload);
            DataTable Newdt = dt.Clone();
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
            Dictionary<int, string> Locationcode = new Dictionary<int, string>();
            var TableName = context.tblmstOrgLocationTables.Where(u => u.EntityId == 1 && u.CountryId == 1 && u.IsActive == true).Select(u => u.TablesName).SingleOrDefault();
            Locationcode = context.Database.SqlQuery<Getclassname>(string.Format("SELECT AutoId,LocationCode FROM {0} WHERE LocationFlag=1 and  IsActive=1", TableName), 1).AsEnumerable()
                .Select(x => new { Groupid = x.AutoId, Groupc = x.LocationCode }).Distinct().ToDictionary(o => o.Groupid, o => o.Groupc);
            int Groupid = 0; int flag = 0;
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

                #endregion
                if (flag == 1)
                {
                    context.DMSImport_Employee(Convert.ToString(dr["EmployeeName"]), Convert.ToString(dr["MobileNo"]), Convert.ToString(dr["EmailId"]), Convert.ToInt64(1), Convert.ToInt64(1), Convert.ToInt64(Session["UserId"].ToString()), Convert.ToInt32(2), Convert.ToInt32(Groupid));
                    flag = 0;
                }
               
                   
                
            }
            context.SaveChanges();
            if (Newdt.Rows.Count > 0)
            {
                grdemployee.DataSource = Newdt;
                grdemployee.DataBind();
                ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "showrejectedPopup();", true);
                return;
            }
        }
    }
}