using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class SupplierInvoiceListViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private List<SupplierInvoice> supplierInvoices;

        public List<SupplierInvoice> SupplierInvoices
        {
            get => supplierInvoices;
            set => Set(ref supplierInvoices, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        private RelayCommand<Guid?> viewAddEditCommand;
        public RelayCommand<Guid?> ViewAddEditCommand
        {
            get => viewAddEditCommand;
            set => Set(ref viewAddEditCommand, value);
        }

        private RelayCommand<Guid> viewDetailsCommand;
        public RelayCommand<Guid> ViewDetailsCommand
        {
            get => viewDetailsCommand;
            set => Set(ref viewDetailsCommand, value);
        }

        public SupplierInvoiceListViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
        }

        private async Task OnLoaded()
        {
            try
            {
                SupplierInvoices = await _dbContext.SupplierInvoice
                    .Include(x => x.Supplier)
                    .Include(x => x.ProductOptions)
                    .OrderBy(x => x.ImportDate)
                    .ToListAsync();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }

        private void OnUnloaded()
        {
            SupplierInvoices = null;
        }
    }
}