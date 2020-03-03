using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.Requisition_Classes
{
    public class BindRequestGrid
    {
        public Int64 RequisitionId { get; set; }
        public string RequestNumber { get; set; }
        public string Location { get; set; }
        public string Status { get; set; }
        public string CreationDate { get; set; }
        public string SubmissionDate { get; set; }
        public string UserName { get; set; }
        public string LastActivityDate { get; set; }
    }
}