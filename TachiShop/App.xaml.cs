using System;
using System.Globalization;
using System.Threading;
using System.Windows;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog;
using TachiShop.Authentication;
using TachiShop.Infrastructures;
using TachiShop.Repositories;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private readonly IHost _host;

        public static IServiceProvider ServiceProvider { get; private set; }

        public App()
        {
            _host = Host.CreateDefaultBuilder()
                .UseSerilog((ctx, config) => config.ReadFrom.Configuration(ctx.Configuration))
                .ConfigureServices((context, services) =>
                {
                    ConfigureServices(context.Configuration, services);
                })
                .Build();
        }

        protected override async void OnStartup(StartupEventArgs e)
        {
            await _host.SeedDataAsync();
            await _host.StartAsync();

            ServiceProvider = _host.Services;
            using (var scope = ServiceProvider.CreateScope())
            {
                var navigationService = scope.ServiceProvider.GetRequiredService<NavigationService>();
                var authService = scope.ServiceProvider.GetRequiredService<IAuthService>();
                if (authService.IsRememberedLogin())
                {
                    await navigationService.ShowAsync<DashboardWindow>();
                }
                else
                {
                    await navigationService.ShowAsync<LoginWindow>();
                }
            }

            base.OnStartup(e);
        }

        protected override async void OnExit(ExitEventArgs e)
        {
            using (_host)
            {
                await _host.StopAsync(TimeSpan.FromSeconds(5));
            }

            base.OnExit(e);
        }

        private void ConfigureServices(IConfiguration configuration, IServiceCollection services)
        {
            services.AddDbContext<AppDbContext>(options =>
                options.UseSqlServer(configuration["Database:ConnectionString"], x => x.MigrationsAssembly("TachiShop")));

            services.AddScoped<NavigationService>();
            services.AddScoped<IAuthService, JwtService>();

            services.AddScoped<LoginViewModel>();
            services.AddScoped<DashboardViewModel>();
            services.AddScoped<ProductListViewModel>();
            services.AddScoped<ProductOptionEditViewModel>();
            services.AddScoped<ProductAddEditViewModel>();
            services.AddScoped<ProductOptionListViewModel>();
            services.AddScoped<SupplierInvoiceListViewModel>();
            services.AddScoped<SupplierInvoiceDetailsViewModel>();
            services.AddScoped<SupplierInvoiceAddEditViewModel>();
            services.AddScoped<SupplierAddEditViewModel>();
            services.AddScoped<InvoiceListViewModel>();
            services.AddScoped<InvoiceDetailsViewModel>();
            services.AddScoped<InvoiceAddEditViewModel>();
            services.AddScoped<CustomerListViewModel>();
            services.AddScoped<CustomerAddEditViewModel>();
            services.AddScoped<UserListViewModel>();
            services.AddScoped<UserDetailsViewModel>();
            services.AddScoped<ChangePasswordViewModel>();

            services.AddTransient<LoginWindow>();
            services.AddTransient<DashboardWindow>();

            CultureInfo ci = CultureInfo.CreateSpecificCulture(CultureInfo.CurrentCulture.Name);
            ci.DateTimeFormat.ShortDatePattern = "dd/MM/yyyy";
            Thread.CurrentThread.CurrentCulture = ci;
        }
    }
}
