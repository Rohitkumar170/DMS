using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.SequenceSetupClasses
{
    public class BindCreatedSequence
    {
        public bool IsActive { get; set; }
        public Int32 Seqheadid { get; set; }
        public string FieldName { get; set; }
        public string SequenceFormat { get; set; }
        public string CountryName { get; set; }
        public string Entityname { get; set; }
    }
}