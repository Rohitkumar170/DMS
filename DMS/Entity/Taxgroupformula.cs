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
    
    public partial class Taxgroupformula
    {
        public Nullable<long> Rownumber { get; set; }
        public long Formulaid { get; set; }
        public Nullable<long> TaxGroupId { get; set; }
        public Nullable<int> Formulasyntaxid { get; set; }
        public string Formulavalue { get; set; }
        public Nullable<int> Operatortype { get; set; }
        public string Label { get; set; }
        public Nullable<long> SubCompId { get; set; }
        public Nullable<long> TaxState { get; set; }
        public Nullable<System.DateTime> Fromdate { get; set; }
        public Nullable<System.DateTime> Todate { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string UpdatedOn { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
    }
}
