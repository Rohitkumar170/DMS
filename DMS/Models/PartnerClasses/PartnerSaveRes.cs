using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.PartnerClasses
{
    public class PartnerSaveRes
    {
        public Int64 PartnerId { get; set; }
        public string PartnerCode { get; set; }
        public string PartnerName { get; set; }
    }
}