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
    
    public partial class tblFileSequenceHead
    {
        public int Seqheadid { get; set; }
        public Nullable<long> Pageid { get; set; }
        public Nullable<long> Fieldid { get; set; }
        public Nullable<int> CountryId { get; set; }
        public Nullable<int> EntityId { get; set; }
        public Nullable<int> Sequencelen { get; set; }
        public string SequenceFormat { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string UpdatedOn { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
