using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.PartnerClasses
{
    public class BindAssignedDataSetupGrid
    {
        public Int32 Assignedid { get; set; }
        public Int32 PartnerId { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 Countryid { get; set; }
        public string Entityname { get; set; }
        public string CountryName { get; set; }
        public string PartnerName { get; set; }
        public Int32 Locationid { get; set; }
        public string Locationname { get; set; }


    }
}