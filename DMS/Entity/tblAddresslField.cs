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
    
    public partial class tblAddresslField
    {
        public int FieldId { get; set; }
        public string FieldName { get; set; }
        public Nullable<int> FieldDataType { get; set; }
        public Nullable<int> EntityId { get; set; }
        public Nullable<int> CountryId { get; set; }
        public Nullable<int> Isdisable { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<long> UpdatedBy { get; set; }
    }
}
