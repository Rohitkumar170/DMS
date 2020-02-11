using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;
using System.Data;
using System.Configuration;
using DMS.Models.EntitySetupClass;
using DMS.Entity;
using Microsoft.EntityFrameworkCore;
using EFCore.BulkExtensions;
using System.Text.RegularExpressions;

namespace DMS.Master
{
    public partial class EntitySetup : System.Web.UI.Page
    {
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserId.InnerText = Convert.ToString(Session["UserId"]);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                Dictionary<int, string> country = new Dictionary<int, string>();
                country.Add(1, "India"); country.Add(2, "Nepal (Butwa City)"); country.Add(3, "USA"); country.Add(4, "Japan"); country.Add(5, "China");
                string Extension = Path.GetExtension(FileUpload.PostedFile.FileName);
                string path = FileUpload.PostedFile.FileName;
                string FolderPath = Server.MapPath("Import/");
                string FilePath = FolderPath + path;
                string conString = string.Empty;
                switch (Extension)
                {
                    case ".xls": //Excel 97-03.
                        conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                        break;
                    case ".xlsx": //Excel 07 and above.
                        conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                        break;
                    default:
                        string Message = "Excel is not in Proper format";
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('" + Message + "');", true);
                        return;
                }
               
                if (!Directory.Exists(FolderPath))   // CHECK IF THE FOLDER EXISTS. IF NOT, CREATE A NEW FOLDER.
                {
                    Directory.CreateDirectory(FolderPath);
                }
                if (File.Exists(FilePath))
                {
                    File.Delete(FilePath);
                }
                FileUpload.SaveAs(FilePath);
                conString = string.Format(conString, FilePath, true);

                DataTable dt = new DataTable();
                OleDbConnection connExcel = new OleDbConnection(conString);
                OleDbCommand cmdExcel = new OleDbCommand();
                OleDbDataAdapter oda = new OleDbDataAdapter();
                cmdExcel.Connection = connExcel;
                connExcel.Close();
                connExcel.Open();
                System.Data.DataTable dtExcelSchema;
                dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                string SheetName = dtExcelSchema.Rows[0]["Table_Name"].ToString();
                //connExcel.Close();
                //connExcel.Open();
                cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
                oda.SelectCommand = cmdExcel;
                List<ImportEntity> list = new List<ImportEntity>();
                oda.Fill(dt);
                connExcel.Close();
                if (dt.Rows.Count == 0)
                {
                    string Message = "Please upload excel file";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('" + Message + "');", true);
                    return;
                }
                if (dt.Columns.Count != 4)
                {
                    string Message = "Excel is not in Proper format";
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('" + Message + "');", true);
                    return;
                }

               


                DMSNEWEntities context = new DMSNEWEntities();
                foreach (DataRow dr in dt.Rows)
                {
                    var isNumeric = Regex.IsMatch(dr["MobileNo"].ToString(), @"^\d+$");
                    if (isNumeric == false)
                    {
                        string Message = "Invalid Mobile No.";
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertmsg", "Showpopup('"+Message+"');", true);
                        return;
                    }
                    context.DMS_ImportExcel(Convert.ToString(dr["Entityname"]),
                    Convert.ToInt64(country.FirstOrDefault(x => x.Value == Convert.ToString(dr["CountryName"])).Key.ToString()),
                    Convert.ToInt64(dr["MobileNo"]), Convert.ToString(dr["EmailId"]), 1);
                   
                }
                context.SaveChanges();
               
            }
            catch (Exception ex) { throw ex; }
        }

    }
}