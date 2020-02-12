using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class ShortItemdetails
    {
        public Int64 Itemid { get; set; }
        public string ItemName { get; set; }
        public string GroupName { get; set; }
        public string Itemtype { get; set; }
        public decimal CartPrice { get; set; }
        public string Description { get; set; }
    }
}