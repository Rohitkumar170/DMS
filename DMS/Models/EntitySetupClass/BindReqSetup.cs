using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.EntitySetupClass
{
    public class BindReqSetup
    {
        public Int32 RAlertid { get; set; }
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
        public int ReqFormat { get; set; }
        public string AlertType { get; set; }
        public decimal Reqvalue { get; set; }
        public string Description { get; set; }
    }
}