using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.AddressSetupClass
{
    public class BindAddressField
    {
        public string FieldName { get; set; }
        public Int32 FieldDataType { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
        public int Isdisable { get; set; }
    }
   
}