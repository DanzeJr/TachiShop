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
    public class CustomerListViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private List<Customer> customers;
        public List<Customer> Customers
        {
            get => customers;
            set => Set(ref customers, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand<Guid?> OpenAddEditDialogCommand { get; }

        public CustomerListViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            OpenAddEditDialogCommand = new RelayCommand<Guid?>(async (id) => await OpenAddEditDialog(id));
        }

        private async Task OnLoaded()
        {
            Customers = await _dbContext.Customer.OrderBy(x => x.FullName).ToListAsync();
        }

        private void OnUnloaded()
        {
            Customers = null;
        }

        private async Task OpenAddEditDialog(Guid? id)
        {
            await DialogHost.Show(new CustomerAddEditControl(id), "RootDialog",
                new DialogClosingEventHandler(async (sender, args) => { await OnLoaded(); }));
        }
    }
}