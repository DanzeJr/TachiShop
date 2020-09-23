using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.Infrastructures
{
    public class DatabaseSeeder
    {
        public static async Task InitializeAsync(AppDbContext context, IConfiguration configuration)
        {
            // now that the database is up to date. Let's seed
            List<User> admins = configuration.GetSection("AppSettings:Admins").Get<List<User>>();
            for (int i = 0; i < admins.Count; i++)
            {
                var admin = admins[i];
                admin.Id = Guid.NewGuid();
                admin.Password = BCrypt.Net.BCrypt.EnhancedHashPassword(admin.Password);
                if (i != 0)
                {
                    admin.CreatingUserId = admins[0].Id;
                }
                admin.CreatedDate = DateTime.Now;

                context.User.Add(admin);
            }

            await context.SaveChangesAsync();
        }
    }
}