using Microsoft.Extensions.DependencyInjection;

namespace TachiShop.ViewModels
{
    public class ViewModelLocator
    {
        public LoginViewModel LoginViewModel
            => App.ServiceProvider.GetRequiredService<LoginViewModel>();

        public DashboardViewModel DashboardViewModel
            => App.ServiceProvider.GetRequiredService<DashboardViewModel>();

        public ProductListViewModel ProductListViewModel
            => App.ServiceProvider.GetRequiredService<ProductListViewModel>();

        public ProductOptionEditViewModel ProductOptionEditViewModel
            => App.ServiceProvider.GetRequiredService<ProductOptionEditViewModel>();

        public ProductAddEditViewModel ProductAddNewViewModel
            => App.ServiceProvider.GetRequiredService<ProductAddEditViewModel>();

        public ProductOptionListViewModel ProductOptionListViewModel
            => App.ServiceProvider.GetRequiredService<ProductOptionListViewModel>();

        public SupplierInvoiceListViewModel SupplierInvoiceListViewModel
            => App.ServiceProvider.GetRequiredService<SupplierInvoiceListViewModel>();

        public SupplierInvoiceDetailsViewModel SupplierInvoiceDetailsViewModel
            => App.ServiceProvider.GetRequiredService<SupplierInvoiceDetailsViewModel>();

        public SupplierInvoiceAddEditViewModel SupplierInvoiceAddEditViewModel
            => App.ServiceProvider.GetRequiredService<SupplierInvoiceAddEditViewModel>();

        public SupplierAddEditViewModel SupplierAddEditViewModel
            => App.ServiceProvider.GetRequiredService<SupplierAddEditViewModel>();

        public InvoiceListViewModel InvoiceListViewModel
            => App.ServiceProvider.GetRequiredService<InvoiceListViewModel>();

        public InvoiceDetailsViewModel InvoiceDetailsViewModel
            => App.ServiceProvider.GetRequiredService<InvoiceDetailsViewModel>();

        public InvoiceAddEditViewModel InvoiceAddEditViewModel
            => App.ServiceProvider.GetRequiredService<InvoiceAddEditViewModel>();

        public CustomerListViewModel CustomerListViewModel
            => App.ServiceProvider.GetRequiredService<CustomerListViewModel>();

        public CustomerAddEditViewModel CustomerAddEditViewModel
            => App.ServiceProvider.GetRequiredService<CustomerAddEditViewModel>();

        public UserListViewModel UserListViewModel
            => App.ServiceProvider.GetRequiredService<UserListViewModel>();

        public UserDetailsViewModel UserDetailsViewModel
            => App.ServiceProvider.GetRequiredService<UserDetailsViewModel>();

        public ChangePasswordViewModel ChangePasswordViewModel
            => App.ServiceProvider.GetRequiredService<ChangePasswordViewModel>();

    }
}