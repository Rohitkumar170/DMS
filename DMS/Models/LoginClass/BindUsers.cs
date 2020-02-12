using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.LoginClass
{
    public class BindUsers
    {
        public Int64 UserId { get; set; }
        public Int32 USERROLEid { get; set; }
        public Boolean IsActive { get; set; }
        public string UserName { get; set; }
        public string EmailId { get; set; }
        public string USERROLE { get; set; }
        public Int64 MobileNo { get; set; }
        
    }
}