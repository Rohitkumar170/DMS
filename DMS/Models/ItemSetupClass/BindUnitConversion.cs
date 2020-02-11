using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class BindUnitConversion
    {
        public decimal Quantity { get; set; }
        public string FromUnit { get; set; }
        public string ToUnit { get; set; }
        public decimal FactorValue { get; set; }


    }
}