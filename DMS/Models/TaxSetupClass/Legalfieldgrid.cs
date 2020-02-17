using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Legalfieldgrid
    {
        public Int64 LegalTaxHeadId { get; set; }
        public string CountryName { get; set; }
        public string Entityname { get; set; }
        public Int64 columnCount { get; set; }
    }
}