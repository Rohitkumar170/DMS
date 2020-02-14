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
                    string Message = "Please upload excel file";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 2)
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
                foreach (DataRow dr in dt.Rows)
                {
                    context.DMS_IMPORTITEMGROUP(Convert.ToInt64(Session["UserId"].ToString()), Convert.ToString(dr["GroupCode"].ToString().Trim()), Convert.ToString(dr["GroupName"].ToString().Trim()), Convert.ToString(dr["Description"].ToString().Trim()));
                }
                context.SaveChanges();
            }
            catch (Exception ex) { throw ex; }

        }
      
    }
}