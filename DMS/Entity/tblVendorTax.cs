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
    
    public partial class tblVendorTax
    {
        public long VendorTaxId { get; set; }
        public Nullable<long> VendorId { get; set; }
        public Nullable<long> Countryid { get; set; }
        public Nullable<long> EntityId { get; set; }
        public Nullable<long> AddressId { get; set; }
        public Nullable<long> TaxTypeId { get; set; }
        public string FieldValue { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<long> UpdatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
    }
}
