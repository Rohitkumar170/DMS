//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DMS.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblAssignTaxGroup
    {
        public long AssignTaxId { get; set; }
        public Nullable<long> ItemId { get; set; }
        public string ItemCode { get; set; }
        public Nullable<long> TaxGroupId { get; set; }
        public Nullable<long> CountryId { get; set; }
        public long EntityId { get; set; }
        public Nullable<int> AssignGrpTypeFlag { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<long> UpdatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> Updatedon { get; set; }
    }
}
