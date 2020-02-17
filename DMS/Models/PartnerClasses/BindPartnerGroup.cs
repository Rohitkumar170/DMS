using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.PartnerClasses
{
    public class BindPartnerGroup
    {
        public Int64 PartnerTypeId { get; set; }
        public string PartnerType { get; set; }
        public string Description { get; set; }
        public string AccountName { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
        public Int64 AccountId { get; set; }

    }
}