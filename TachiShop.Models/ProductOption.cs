using System;
using System.ComponentModel.DataAnnotations.Schema;
using Bogus;
using TachiShop.Models.Constants;
using TachiShop.Models.Enums;

namespace TachiShop.Models
{
    public class ProductOption
    {
        public Guid Id { get; set; }

        public Guid ProductId { get; set; }

        public Product Product { get; set; }


        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal SupplyPrice { get; set; }

        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal OriginStock { get; set; }

        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal Price { get; set; }

        public int Unit { get; set; } = -1;

        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal Discount { get; set; }

        [Column(TypeName = "DECIMAL(18, 2)")]
        public decimal Stock { get; set; }

        public int Status { get; set; } = -1;

        public Guid SupplierInvoiceId { get; set; }

        public SupplierInvoice SupplierInvoice { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        public DateTime? ModifiedDate { get; set; }

        public Guid? ModifyingUserId { get; set; }

        public User ModifyingUser { get; set; }

        [NotMapped]
        public string DisplayValue =>
            $"{CreatedDate:dd/MM/yyyy HH:mm:ss} - {Stock:#,##0.##} {Constant.ProductUnits[Unit]}";

        [NotMapped]
        public decimal TotalSupplyPrice => SupplyPrice * OriginStock;

        public static readonly Faker<ProductOption> Faker = new Faker<ProductOption>().StrictMode(false)
            .RuleFor(x => x.Id, f => Guid.NewGuid())
            .RuleFor(x => x.CreatedDate, (f, c) => f.Date.Recent(150))
            .RuleFor(x => x.Status, 1)
            .RuleFor(x => x.SupplyPrice, f => f.Random.Decimal(2000, 300000))
            .RuleFor(x => x.Price, f => f.Random.Decimal(5000, 350000))
            .RuleFor(x => x.Unit, f => f.Random.Bool() ? (int) ProductUnit.Fruit : (int) ProductUnit.Kilogram)
            .RuleFor(x => x.Stock, (f, c) => c.Unit == (int) ProductUnit.Fruit ? f.Random.Number(1, 150) : f.Random.Decimal(0.5m, 10m))
            .RuleFor(x => x.Discount, f => f.Random.Bool(0.8f) ? 0 : f.Random.Decimal(0, 100));
    }
}