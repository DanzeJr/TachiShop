using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace TachiShop.Models
{
    public class Invoice
    {
        public Guid Id { get; set; }

        public Guid? CustomerId { get; set; }

        public Customer Customer { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        public Guid CreatingUserId { get; set; }

        public User CreatingUser { get; set; }

        public DateTime? ModifiedDate { get; set; } = DateTime.Now;

        public Guid? ModifyingUserId { get; set; }

        public User ModifyingUser { get; set; }

        public List<InvoiceProduct> InvoiceProducts { get; set; } = new List<InvoiceProduct>();

        [NotMapped]
        public decimal TotalPrice => InvoiceProducts.Sum(x => x.TotalPrice);
    }
}