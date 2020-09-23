using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace TachiShop.Models
{
    public class ProductCategory
    {
        public Guid Id { get; set; }

        [ForeignKey(nameof(Product))]
        public Guid ProductId { get; set; }

        public Product Product { get; set; }

        [ForeignKey(nameof(Category))]
        public Guid CategoryId { get; set; }

        public Category Category { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        [ForeignKey(nameof(CreatingUser))]
        public Guid CreatingUserId { get; set; }

        public User CreatingUser { get; set; }
    }
}