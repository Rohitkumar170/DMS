﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DMS.Models.EntitySetupClass
{
    public class BindOrgParaGrid
    {
        public Int32 EntityId { get; set; }
        public Int32 CountryId { get; set; }
        public string Entityname { get; set; }
        public string CountryName { get; set; }
        public Int32 CountColumn { get; set; }
    }
}