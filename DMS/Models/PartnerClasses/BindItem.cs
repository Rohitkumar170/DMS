using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.PartnerClasses
{
    public class BindItem
    {
        public Int64 Itemid { get; set; }
        public string ItemName { get; set; }
        public string ItemCode   { get; set; }
        public string GroupName { get; set; }
    }
}