using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.LoginClass
{
    public class Logindetails
    {
        public Int64 UserId { get; set; }
        public string EmailId {get;set;}
        public Int32 UserType { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string PasswordKey { get; set; }
        public Int64 WareHouseId { get; set; }
        public string AccountNo { get; set; }
    }
}