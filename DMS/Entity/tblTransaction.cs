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
    
    public partial class tblTransaction
    {
        public long TransId { get; set; }
        public string LotNumber { get; set; }
        public Nullable<System.DateTime> InventDate { get; set; }
        public Nullable<long> ItemId { get; set; }
        public Nullable<long> TrackingId { get; set; }
        public Nullable<long> LocationId { get; set; }
        public Nullable<long> TransactionType { get; set; }
        public Nullable<decimal> Quantity { get; set; }
        public Nullable<decimal> NetQty { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public Nullable<decimal> NetAmt { get; set; }
        public Nullable<decimal> AvgWtAmt { get; set; }
        public Nullable<long> CountryId { get; set; }
        public Nullable<long> EntityId { get; set; }
        public Nullable<int> Locationtableid { get; set; }
        public Nullable<long> Skuid { get; set; }
        public Nullable<int> OrgTransflag { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<long> UpdatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
    }
}
