using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class BindItemGroupGrid
    {
        public Int32 Entityid { get; set; }
        public Int32 Countryid { get; set; }
        public string Entityname { get; set; }
        public string CountryName { get; set; }
        public Int32 ColCount { get; set; }
    }
}