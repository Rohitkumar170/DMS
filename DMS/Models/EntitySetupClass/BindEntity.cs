using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.EntitySetupClass
{
    public class BindEntity
    {
        public Int32 Entityid { get; set; }
        public Int64 CountryId { get; set; }
        public string Entityname { get; set; }
        public Int64 MobileNo { get; set; }
        public string EmailId { get; set; }
        public string CountryName { get; set; }
    }
}