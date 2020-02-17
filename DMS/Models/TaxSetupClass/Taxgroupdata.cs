using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Taxgroupdata
    {
        public Int64 taxgroupId { get; set; }
        public string TaxGroupCode { get; set; }
        public string TaxGroupName { get; set; }
        public string TaxDescription { get; set; }
        public string FieldName { get; set; }
        public string CountryName { get; set; }
       
    }
}