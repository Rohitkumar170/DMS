using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class UnitConvertion
    {
        public decimal Value { get; set; }
        public string Fromunit { get; set; }
        public string Tounit { get; set; }
        public decimal ConvertedValue { get; set; }
    }
}