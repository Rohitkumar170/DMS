using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class BindGST
    {
        public Int64 TaxSetupInfoId { get; set; }
        public string FieldName { get; set; }
        public int TaxDataType { get; set; }
        public int CountryId { get; set; }
    }
}