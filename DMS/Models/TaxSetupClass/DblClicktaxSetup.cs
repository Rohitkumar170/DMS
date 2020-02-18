using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class DblClicktaxSetup
    {
        public Int64 TaxSetupId { get; set; }
        public Int32 CountryId { get; set; }
        public Int32 TaxType { get; set; }
    }
}