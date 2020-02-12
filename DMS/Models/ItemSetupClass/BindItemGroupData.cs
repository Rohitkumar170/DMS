using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class BindItemGroupData
    {
        public string GroupName { get; set; }
        public string GroupCode { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
        public Int32 Isdisable { get; set; }
        public string Description { get; set; }
    }
}