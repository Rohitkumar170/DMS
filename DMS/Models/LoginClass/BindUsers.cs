using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.LoginClass
{
    public class BindUsers
    {
        public Int64 UserId { get; set; }
        public string UserName { get; set; }
        public string EmailId { get; set; }
        public Int64 partnerId { get; set; }
        public string CountryName { get; set; }
        public string Entityname { get; set; }
        public Int64 MobileNo { get; set; }
        public string PartnerName { get; set; }

    }
}