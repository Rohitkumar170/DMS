using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class VariantHeader
    {
        public Int32 Variantid { get; set; }
        public string VarinatName { get; set; }
        public string Description { get; set; }
        public Int32 Entityid { get; set; }
        public Int32 Countryid { get; set; }
    }
}