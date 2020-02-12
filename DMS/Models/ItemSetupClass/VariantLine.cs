using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class VariantLine
    {
        public Int32 sn { get; set; }
        public Int64 Skuid { get; set; }
        public string Skucode { get; set; }
        public string Skuname { get; set; }
    }
}