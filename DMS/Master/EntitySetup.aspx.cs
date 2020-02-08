using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;
using System.Data;
namespace DMS.Master
{
    public partial class EntitySetup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUserId.InnerText = Convert.ToString(Session["UserId"]);
        }

        //public void change()
        //{
        //    string postedFile;
        //    string filePath = string.Empty;
        //    if (postedFile != null)
        //    {
        //        string path = Server.MapPath("~/Uploads/");
        //        if (!Directory.Exists(path))
        //        {
        //            Directory.CreateDirectory(path);
        //        }
        //        string extension = Path.GetExtension(postedFile.FileName);
        //        string conString = string.Empty;
        //        switch (extension)
        //        {
        //            case ".xls": //Excel 97-03.
        //                conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
        //                break;
        //            case ".xlsx": //Excel 07 and above.
        //                conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
        //                break;
        //        }

        //        DataTable dt = new DataTable();
        //        conString = string.Format(conString, filePath);



        //    }

        //}
    }
}