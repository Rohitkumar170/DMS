using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class ItemGroup
    {
        public int GroupId { get; set; }
        public string GroupName { get; set; }
        public int Entityid { get; set; }
        public int Countryid { get; set; }
    }
}