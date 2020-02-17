using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.PartnerClasses
{
    public class BindPartnerGrid
    {
        public Int64 PartnerId { get; set; }
        public string PartnerCode { get; set; }
        public string PartnerName { get; set; }
        public string PGroup { get; set; }
        public string PType { get; set; }

    }
}