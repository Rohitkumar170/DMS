using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.EntitySetupClass
{
    public class Requestcontrolsetup
    {
        public int CountryId { get; set; }
        public int EntityId { get; set; }
        public int EntityEmpId { get; set; }
        public int AllowOverQty { get; set; }
        public Int64 ReqCtrlSetId { get; set; }
        public string EmpName { get; set; }
        public Int32 Employeecount { get; set; }
        public string EmpLocation { get; set; }
    }
}