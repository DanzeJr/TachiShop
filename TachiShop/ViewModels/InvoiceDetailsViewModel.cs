using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Microsoft.EntityFrameworkCore;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class InvoiceDetailsViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private Guid id;
        public Guid Id
        {
            get => id;
            set => Set(ref id, value);
        }

        private Invoice invoice;
        public Invoice Invoice
        {
            get => invoice;
            set => Set(ref invoice, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public InvoiceDetailsViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
        }

        private async Task OnLoaded()
        {
            try
            {
                Invoice = await _dbContext.Invoice
                    .Include(x => x.Customer)
                    .Include(x => x.CreatingUser)
                    .Include(x => x.InvoiceProducts)
                    .ThenInclude(ip => ip.ProductOption)
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
            Invoice = null;
        }
    }
}