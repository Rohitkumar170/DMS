using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.EntitySetupClass
{
    public class BindOrgDataSetupGrid
    {
        public string ParameterId { get; set; }
        public Int32 CountryId { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 FieldDataType { get; set; }
        public Int32 FieldId { get; set; }
        public string Entityname { get; set; }
        public string CountryName { get; set; }
        public string FieldName { get; set; }

    }
}