using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.EntitySetupClass
{
    public class BindOrgFields
    {
        public string FieldName { get; set; }
        public Int32 FieldDataType { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
        public Int32 Isdisable { get; set; }
    }
}