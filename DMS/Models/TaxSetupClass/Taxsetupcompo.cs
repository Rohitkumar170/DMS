using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Taxsetupcompo
    {
        public Int64 TaxSetupInfoId { get; set; }
        public string FieldName { get; set; }
        public int TaxDataType { get; set; }
        public int CountryId { get; set; }
        public string SUBCOMPONENTNAME { get; set; }
        public int GSTSUBID { get; set; }
    }
}