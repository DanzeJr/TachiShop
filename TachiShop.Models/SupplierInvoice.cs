using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace TachiShop.Models
{
    public class SupplierInvoice
    {
        public Guid Id { get; set; }

        public Guid? SupplierId { get; set; }

        public Supplier Supplier { get; set; }

        public DateTime ImportDate { get; set; } = DateTime.Now;

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        public Guid CreatingUserId { get; set; }

        public User CreatingUser { get; set; }

        public List<ProductOption> ProductOptions { get; set; } = new List<ProductOption>();

        [NotMapped]
        public decimal TotalPrice => ProductOptions.Sum(x => x.TotalSupplyPrice);

    }
}