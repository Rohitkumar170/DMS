using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using DMS.Entity;
using BusinessLibrary;

namespace DMS.Master
{
    public partial class Unit : System.Web.UI.Page
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
                if (dt.Columns.Count != 3)
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
                    context.DMS_ImportUnit(Convert.ToString(dr["UnitCode"].ToString().Trim()), Convert.ToString(dr["UnitName"].ToString().Trim()), Convert.ToString(dr["Description"].ToString().Trim()), Convert.ToInt64(Session["UserId"].ToString()));
                }
                context.SaveChanges();
            }
            catch (Exception ex) { throw ex; }

        }
        
    }
    }
