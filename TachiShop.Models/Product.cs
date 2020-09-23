using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using Bogus;
using TachiShop.Models.Enums;

namespace TachiShop.Models
{
    public class Product
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public int Status { get; set; } = -1;

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        public Guid CreatingUserId { get; set; }

        public User CreatingUser { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public Guid? ModifyingUserId { get; set; }

        public User ModifyingUser { get; set; }

        public List<ProductCategory> ProductCategories { get; set; } = new List<ProductCategory>();

        public List<ProductOption> ProductOptions { get; set; } = new List<ProductOption>();

        public List<Category> Categories
        {
            get => ProductCategories.Select(x => x.Category).ToList();
            set
            {
                ProductCategories = value.Select(x => new ProductCategory
                {
                    Id = Guid.NewGuid(),
                    ProductId = Id,
                    CategoryId = x.Id
                }).ToList();
            }
        }

        [NotMapped] public decimal TotalOriginStock => ProductOptions?.Sum(x => x.OriginStock) ?? 0;

        [NotMapped] public decimal TotalStock => ProductOptions?.Sum(x => x.OriginStock) ?? 0;

        public static readonly Faker<Product> Faker = new Faker<Product>().StrictMode(false)
            .RuleFor(x => x.Id, f => Guid.NewGuid())
            .RuleFor(x => x.CreatedDate, (f, c) => f.Date.Recent(150))
            .RuleFor(x => x.Status, 1)
            .RuleFor(x => x.Name, f => f.Random.Bool() ? f.Commerce.Product() : f.Commerce.ProductName());
    }
}