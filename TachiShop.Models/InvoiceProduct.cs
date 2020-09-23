using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace TachiShop.Models
{
    public class InvoiceProduct
    {
        public Guid Id { get; set; }

        public Guid InvoiceId { get; set; }

        public Invoice Invoice { get; set; }

        public Guid ProductOptionId { get; set; }

        public ProductOption ProductOption { get; set; }

        public int Unit { get; set; }

        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal Price { get; set; }

        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal Amount { get; set; }

        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal Discount { get; set; }

        [NotMapped]
        public decimal TotalPrice => Amount * Price;
    }
}