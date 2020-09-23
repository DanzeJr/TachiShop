using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using TachiShop.Repositories;

namespace TachiShop.Infrastructures
{
    public static class HostExtension
    {
        public static async Task<IHost> SeedDataAsync(this IHost host)
        {
            using (var scope = host.Services.CreateScope())
            {
                var services = scope.ServiceProvider;
                var context = services.GetService<AppDbContext>();
                var configuration = services.GetService<IConfiguration>();

                if (configuration.GetSection("Database:Initialize").Get<bool>())
                {
                    context.Database.EnsureDeleted();
                    context.Database.Migrate();

                    await DatabaseSeeder.InitializeAsync(context, configuration);
                }
                else
                {
                    context.Database.Migrate();
                    if (!context.User.Any())
                    {
                        await DatabaseSeeder.InitializeAsync(context, configuration);
                    }
                }
            }

            return host;
        }
    }
}