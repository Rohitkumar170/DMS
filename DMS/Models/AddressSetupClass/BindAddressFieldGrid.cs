using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.AddressSetupClass
{
    public class BindAddressFieldGrid
    {
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
        public string Entityname { get; set; }
        public string CountryName { get; set; }
        public Int32 CountColumn { get; set; }



    }
}