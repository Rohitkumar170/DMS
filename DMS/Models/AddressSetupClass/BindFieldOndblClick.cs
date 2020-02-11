using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.AddressSetupClass
{
    public class BindFieldOndblClick
    {
        public Int64 FieldValuesetupid { get; set; }
        public string FieldName { get; set; }
        public Int32 Fieldpriority { get; set; }
        public Int32 FieldId { get; set; }
        public Int32 Countryid { get; set; }
        public Int32 Entityid { get; set; }
        public Int32 Fieldparent { get; set; }
        public string parent { get; set; }
        public Int32 Isdisable { get; set; }
    }
}