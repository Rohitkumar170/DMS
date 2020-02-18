using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Taxgroupgridline
    {
        public Int64 SubCompId { get; set; }
        public Int64 TaxState { get; set; }
        public string Fromdate { get; set; }
        public string Todate { get; set; }
        public string Formulavalue { get; set; }
        public string Label { get; set; }
    }
}