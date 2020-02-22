using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using BusinessLibrary;
using DMS.Entity;


namespace DMS.Master
{
    public partial class ItemGroupSetup : System.Web.UI.Page
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
                    preloader.Style.Add("display", "none");
                    Overlay_Load.Style.Add("display", "none");
                    string Message = "Please upload excel file";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 3)
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
                foreach (DataRow dr in dt.Rows)
                {
                    context.DMS_IMPORTITEMGROUP(Convert.ToInt64(Session["UserId"].ToString()), Convert.ToString(dr["GroupCode"].ToString().Trim()), Convert.ToString(dr["GroupName"].ToString().Trim()), Convert.ToString(dr["Description"].ToString().Trim()));
                }
                context.SaveChanges();
                preloader.Style.Add("display", "none");
                Overlay_Load.Style.Add("display", "none");
            }
            catch (Exception ex) { throw ex; }

        }
      
    }
}