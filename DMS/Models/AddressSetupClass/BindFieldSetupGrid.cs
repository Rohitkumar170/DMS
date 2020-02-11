using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.AddressSetupClass
{
    public class BindFieldSetupGrid
    {
        public Int32 Fieldsetupid { get; set; }
        public string Entityname { get; set; }
        public string CountryName { get; set; }
        public Int32 CountColumn { get; set; }
        public Int32 Countryid { get; set; }
        public Int32 Entityid { get; set; }
    }
}