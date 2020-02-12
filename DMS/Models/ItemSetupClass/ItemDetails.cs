using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.ItemSetupClass
{
    public class ItemDetails
    {
        public Int64 Itemid { get; set; }
        public string ItemName { get; set; }
        public Int32 ItemGroup { get; set; }
        public Int32 ItemType { get; set; }
        public string Description { get; set; }
        public decimal CartPrice { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 Countryid { get; set; }
        public Boolean Isvariant { get; set; }
        public int Itemtracking { get; set; }
        public string ItemCode { get; set; }
    }
}