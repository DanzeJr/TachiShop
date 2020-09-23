using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using Bogus;

namespace TachiShop.Models
{
    public class Category
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        [ForeignKey(nameof(CreatingUser))]
        public Guid CreatingUserId { get; set; }

        public User CreatingUser { get; set; }

        public DateTime? ModifiedDate { get; set; } = DateTime.Now;

        [ForeignKey(nameof(ModifyingUser))]
        public Guid? ModifyingUserId { get; set; }

        public User ModifyingUser { get; set; }

        public static readonly Faker<Category> Faker = new Faker<Category>().StrictMode(false)
            .RuleFor(x => x.Id, f => Guid.NewGuid())
            .RuleFor(x => x.CreatedDate, (f, c) => f.Date.Recent(150))
            .RuleFor(x => x.Name, f => f.Random.Bool() ? f.Commerce.Product() : f.Commerce.ProductName());
    }
}