using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Taxinfo
    {
        public int TaxDataType { get; set; }
        public int CountryId { get; set; }
        public Int64 TaxSetupInfoId { get; set; }
    }
}