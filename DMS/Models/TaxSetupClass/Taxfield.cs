using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Taxfield
    {
        public string fieldname { get; set; }
        public int priority { get; set; }
        public int TaxDataType { get; set; }
        public string Datatypename { get; set; }
        public Int64 TaxSetupInfoId { get; set; }
    }
}