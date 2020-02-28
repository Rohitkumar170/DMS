using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.PartnerClasses
{
    public class PartnerEmployee
    {
        public Int64 Empid { get; set; }
        public string EmpName { get; set; }
        public string EmpMobileNo { get; set; }
        public string EmpEmailId { get; set; }
        public bool IsActive { get; set; }
        public Int32 IsCreadential { get; set; }
        public Int32 isemail { get; set; }

    }
}