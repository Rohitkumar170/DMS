using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.PartnerClasses
{
    public class BindItems
    {
        public Int64 Assignedid { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 Countryid { get; set; }
        public string ItemName { get; set; }
        public Int32 Itemid { get; set; }
        public decimal minItemQty { get; set; }
        public decimal MaxItemQty { get; set; }
    }
}