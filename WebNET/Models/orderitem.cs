//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebNET.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class orderitem
    {
        public int orderItem_id { get; set; }
        public Nullable<int> orderItem_ordersId { get; set; }
        public Nullable<int> orderItem_productId { get; set; }
        public string orderItem_productName { get; set; }
        public Nullable<int> orderItem_quantity { get; set; }
        public Nullable<decimal> orderItem_price { get; set; }
    
        public virtual orders orders { get; set; }
        public virtual product product { get; set; }
    }
}
