using System;
using System.Collections.Generic;
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
    public class ProductOptionEditViewModel : ViewModelBase
    {
        private readonly ILogger<ProductOptionEditViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private Guid id;
        public Guid Id
        {
            get => id;
            set => Set(ref id, value);
        }

        public ProductOption Origin { get; set; }

        private ProductOption productOption = new ProductOption();

        public ProductOption ProductOption
        {
            get => productOption;
            set => Set(ref productOption, value);
        }

        public Dictionary<int, string> Statuses { get; set; } = Constant.ProductStatuses;

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand UpdateCommand { get; }

        public RelayCommand ClearCommand { get; }

        public RelayCommand CloseDialogCommand { get; }

        public Func<bool> IsValidFunc { get; set; }

        public ProductOptionEditViewModel(ILogger<ProductOptionEditViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            Statuses.Remove((int)ProductStatus.Deleted);
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            UpdateCommand = new RelayCommand(async () => await UpdateProductOption());
            ClearCommand = new RelayCommand(ClearForm);
            CloseDialogCommand = new RelayCommand(CloseDialog);
        }

        private ProductOption CloneProductOption(ProductOption option)
        {
            var result = new ProductOption();
            result.Price = option.Price;
            result.Status = option.Status;
            result.Stock = option.Stock;
            result.OriginStock = option.OriginStock;
            result.Unit = option.Unit;

            return result;
        }

        private async Task OnLoaded()
        {
            try
            {
                Origin = await _dbContext.ProductOption.FirstOrDefaultAsync(x => x.Id == Id);

                ProductOption = CloneProductOption(Origin);
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OnUnloaded()
        {
            Origin = null;
            ProductOption = null;
        }

        private async Task UpdateProductOption()
        {
            try
            {
                if (IsValidFunc.Invoke())
                {
                    var currentUser = (User)App.Current.Properties["USER"];
                    Origin.Price = ProductOption.Price;
                    Origin.Status = ProductOption.Status;
                    Origin.Stock = ProductOption.Stock;
                    Origin.ModifiedDate = DateTime.Now;
                    Origin.ModifyingUserId = currentUser.Id;
                    _dbContext.ProductOption.Update(Origin);

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
            ProductOption = new ProductOption
            {
                Unit = Origin.Unit,
                OriginStock = Origin.OriginStock
            };
        }
    }
}