using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Taxsetup
    {
        public Int64 TaxSetupId { get; set; }
        public string CountryName { get; set; }
        public string TaxType { get; set; }
     
    }
}