using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    public class ProductListViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private List<Product> products;

        public List<Product> Products
        {
            get => products;
            set => Set(ref products, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand<Guid?> OpenAddEditDialogCommand { get; }

        private RelayCommand<Guid> viewDetailsCommand;
        public RelayCommand<Guid> ViewDetailsCommand
        {
            get => viewDetailsCommand;
            set => Set(ref viewDetailsCommand, value);
        }

        public ProductListViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            OpenAddEditDialogCommand = new RelayCommand<Guid?>(async (id) => await OpenAddEditDialog(id));
        }

        private async Task OnLoaded()
        {
            try
            {
                Products = await _dbContext.Product
                    .Include(x => x.ProductCategories)
                    .Include(x => x.ProductOptions)
                    .OrderBy(x => x.Name)
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
            Products = null;
        }

        private async Task OpenAddEditDialog(Guid? id)
        {
            await DialogHost.Show(new ProductAddEditControl(id), "RootDialog",
                new DialogClosingEventHandler(async (sender, args) => { await OnLoaded(); }));
        }

    }
}