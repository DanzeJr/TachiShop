using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TachiShop.Models;
using TachiShop.Models.Constants;
using TachiShop.Models.Enums;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class ProductAddEditViewModel : ViewModelBase
    {
        private readonly ILogger<ProductAddEditViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private Guid? id;
        public Guid? Id
        {
            get => id;
            set => Set(ref id, value);
        }

        public Product Origin { get; set; }

        private Product product = new Product();
        public Product Product
        {
            get => product;
            set => Set(ref product, value);
        }

        private List<Category> categories;
        public List<Category> Categories
        {
            get => categories;
            set => Set(ref categories, value);
        }

        public Dictionary<int, string> Statuses { get; set; } = Constant.ProductStatuses;

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand AddEditCommand { get; }

        public RelayCommand ClearCommand { get; }

        public RelayCommand CloseDialogCommand { get; }

        public Func<bool> IsValidFunc { get; set; }

        public ProductAddEditViewModel(ILogger<ProductAddEditViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            Statuses.Remove((int)ProductStatus.Deleted);
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            AddEditCommand = new RelayCommand(async () => await AddEditProduct());
            ClearCommand = new RelayCommand(ClearForm);
            CloseDialogCommand = new RelayCommand(CloseDialog);
        }

        private Product CloneProduct(Product option)
        {
            var result = new Product();
            result.Name = option.Name;
            result.Status = option.Status;
            result.ProductCategories = option.ProductCategories;

            return result;
        }

        private async Task OnLoaded()
        {
            try
            {
                if (Id != null)
                {
                    Origin = await _dbContext.Product.Include(x => x.ProductCategories).FirstOrDefaultAsync(x => x.Id == Id);
                    Product = CloneProduct(Origin);
                }
                else
                {
                    Product = new Product();
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OnUnloaded()
        {
            Categories = null;
            Origin = null;
            Product = null;
            Id = null;
        }

        private async Task AddEditProduct()
        {
            try
            {
                if (IsValidFunc.Invoke())
                {
                    var currentUser = (User)App.Current.Properties["USER"];
                    if (Id == null)
                    {
                        Product.Id = Guid.NewGuid();
                        Product.CreatingUserId = currentUser.Id;
                        _dbContext.Product.Add(Product);
                    }
                    else
                    {
                        Origin.Name = Product.Name;
                        Origin.Status = Product.Status;
                        Origin.ProductCategories = Product.ProductCategories;
                        Origin.ModifiedDate = DateTime.Now;
                        Origin.ModifyingUserId = currentUser.Id;
                        _dbContext.Product.Update(Origin);
                    }
                    await _dbContext.SaveChangesAsync();
                    CloseDialog();
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void CloseDialog()
        {
            try
            {
                DialogHost.CloseDialogCommand.Execute(null, null);
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void ClearForm()
        {
            Product = new Product();
        }
    }
}