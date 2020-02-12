using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.SequenceSetupClasses
{
    public class PageFields
    {
        public Int32 Fieldid { get; set; }
        public Int32 Pageid { get; set; }
        public string FieldName { get; set; }
        public string StatusName { get; set; }
    }
}