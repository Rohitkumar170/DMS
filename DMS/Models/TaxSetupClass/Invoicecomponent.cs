using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.TaxSetupClass
{
    public class Invoicecomponent
    {
        public int InvCid { get; set; }
        public Int64 InvCode { get; set; }
        public string Shortform { get; set; }
        public string ComponentName { get; set; }
        public string Formula { get; set; }
       
    }
}