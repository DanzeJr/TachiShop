using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using TachiShop.Repositories;

namespace TachiShop
{
    public class AppDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
    {
        public AppDbContext CreateDbContext(string[] args)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();

            var dbContextBuilder = new DbContextOptionsBuilder<AppDbContext>();

            var connectionString = configuration["Database:ConnectionString"];

            dbContextBuilder.UseSqlServer(connectionString, x => x.MigrationsAssembly("TachiShop"));

            return new AppDbContext(dbContextBuilder.Options);
        }
    }
}