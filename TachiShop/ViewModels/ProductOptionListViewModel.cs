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
    public class ProductOptionListViewModel : ViewModelBase
    {
        private readonly AppDbContext _dbContext;

        private Guid id;
        public Guid Id
        {
            get => id;
            set => Set(ref id, value);
        }

        private List<ProductOption> productOptions;
        public List<ProductOption> ProductOptions
        {
            get => productOptions;
            set => Set(ref productOptions, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand<Guid> OpenEditDialogCommand { get; }

        public ProductOptionListViewModel(AppDbContext dbContext)
        {
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            OpenEditDialogCommand = new RelayCommand<Guid>(async (id) => await OpenProductOptionEditDialog(id));
        }

        private async Task OnLoaded()
        {
            await GetProductOptions();
        }

        private void OnUnloaded()
        {
            ProductOptions = null;
        }

        private async Task GetProductOptions()
        {
            ProductOptions = await _dbContext.ProductOption
                .Include(x => x.Product)
                .Where(x => x.ProductId == Id)
                .OrderBy(x => x.CreatedDate)
                .ToListAsync();
        }

        private async Task OpenProductOptionEditDialog(Guid id)
        {
            await DialogHost.Show(new ProductOptionEditControl(id), "RootDialog",
                new DialogClosingEventHandler(async (sender, args) => { await OnLoaded(); }));
        }
    }
}