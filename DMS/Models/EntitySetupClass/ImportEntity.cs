using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.EntitySetupClass
{
    public class ImportEntity
    {
        public string   Entityname { get; set; }
        public Int64 CountryId { get; set; }
        public Int64 MobileNo { get; set;}
        public string EmailId { get; set; }
        public Int64 CreatedBy { get; set;}

    }
}