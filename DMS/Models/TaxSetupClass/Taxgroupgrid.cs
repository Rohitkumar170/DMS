using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Taxgroupgrid
    {
        public string TaxGroupName { get; set; }
        public string TaxDescription { get; set; }
        public int TaxMode { get; set; }
        public int TaxType { get; set; }
        public Int64 EntityId { get; set; }
        public Int64 CountryId { get; set; }
    }
}