using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Microsoft.EntityFrameworkCore;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class InvoiceListViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private List<Invoice> invoices;
        public List<Invoice> Invoices
        {
            get => invoices;
            set => Set(ref invoices, value);
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

        public InvoiceListViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
        }

        private async Task OnLoaded()
        {
            try
            {
                Invoices = await _dbContext.Invoice
                    .Include(x => x.Customer)
                    .Include(x => x.InvoiceProducts)
                    .ThenInclude(ip => ip.ProductOption)
                    .ThenInclude(po => po.Product)
                    .OrderBy(x => x.CreatedDate)
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
            Invoices = null;
        }
    }
}