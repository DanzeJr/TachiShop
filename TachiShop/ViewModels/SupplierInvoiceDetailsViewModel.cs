using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class SupplierInvoiceDetailsViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private Guid id;
        public Guid Id
        {
            get => id;
            set => Set(ref id, value);
        }

        private SupplierInvoice supplierInvoice;
        public SupplierInvoice SupplierInvoice
        {
            get => supplierInvoice;
            set => Set(ref supplierInvoice, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand<Guid> OpenEditDialogCommand { get; }

        public SupplierInvoiceDetailsViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            OpenEditDialogCommand = new RelayCommand<Guid>(async (id) => await OpenProductOptionEditDialog(id));
        }

        private async Task OnLoaded()
        {
            try
            {
                SupplierInvoice = await _dbContext.SupplierInvoice
                    .Include(x => x.Supplier)
                    .Include(x => x.CreatingUser)
                    .Include(x => x.ProductOptions)
                    .ThenInclude(po => po.Product)
                    .FirstOrDefaultAsync(x => x.Id == Id);
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        private void OnUnloaded()
        {
            SupplierInvoice = null;
        }

        private async Task OpenProductOptionEditDialog(Guid id)
        {
            await DialogHost.Show(new ProductOptionEditControl(id), "RootDialog",
                new DialogClosingEventHandler(async (sender, args) => { await OnLoaded(); }));
        }
    }
}