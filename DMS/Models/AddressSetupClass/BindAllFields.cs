using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.AddressSetupClass
{
    public class BindAllFields
    {
        public Int32 FieldId { get; set; }
        public string FieldName { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
    }
}