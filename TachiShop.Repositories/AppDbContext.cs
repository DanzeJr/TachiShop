using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using TachiShop.Models;

namespace TachiShop.Repositories
{
    public class AppDbContext : DbContext
    {
        public AppDbContext() : base() { }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            foreach (var relationship in modelBuilder.Model.GetEntityTypes().SelectMany(e => e.GetForeignKeys()))
            {
                relationship.DeleteBehavior = DeleteBehavior.NoAction;
            }
        }

        public DbSet<User> User { get; set; }

        public DbSet<Customer> Customer { get; set; }

        public DbSet<Product> Product { get; set; }

        public DbSet<Supplier> Supplier { get; set; }

        public DbSet<ProductOption> ProductOption { get; set; }

        public DbSet<Category> Category { get; set; }

        public DbSet<ProductCategory> ProductCategory { get; set; }

        public DbSet<Invoice> Invoice { get; set; }

        public DbSet<InvoiceProduct> InvoiceProduct { get; set; }

        public DbSet<SupplierInvoice> SupplierInvoice { get; set; }
    }
}
