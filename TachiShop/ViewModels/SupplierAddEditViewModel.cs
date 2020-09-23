using System;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TachiShop.Models;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class SupplierAddEditViewModel : ViewModelBase
    {
        private readonly ILogger<SupplierAddEditViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private Guid? id;
        public Guid? Id
        {
            get => id;
            set => Set(ref id, value);
        }

        public Supplier Origin { get; set; }

        private Supplier supplier;
        public Supplier Supplier
        {
            get => supplier;
            set => Set(ref supplier, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand AddEditCommand { get; }

        public RelayCommand ClearCommand { get; }

        public RelayCommand CloseDialogCommand { get; }

        public Func<bool> IsValidFunc { get; set; }

        public SupplierAddEditViewModel(ILogger<SupplierAddEditViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            AddEditCommand = new RelayCommand(async () => await AddEditSupplier());
            ClearCommand = new RelayCommand(ClearForm);
            CloseDialogCommand = new RelayCommand(CloseDialog);
        }

        private Supplier CloneSupplier(Supplier supplier)
        {
            var result = new Supplier();
            result.Name = supplier.Name;
            result.PhoneNumber = supplier.PhoneNumber;
            result.Address = supplier.Address;

            return result;
        }

        private async Task OnLoaded()
        {
            try
            {
                if (Id != null)
                {
                    Origin = await _dbContext.Supplier.FindAsync(Id);
                    Supplier = CloneSupplier(Origin);
                }
                else
                {
                    Supplier = new Supplier();
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OnUnloaded()
        {
            Origin = null;
            Supplier = null;
            Id = null;
        }

        private async Task AddEditSupplier()
        {
            try
            {
                if (IsValidFunc.Invoke())
                {
                    var currentUser = (User)App.Current.Properties["USER"];
                    if (Id == null)
                    {
                        Supplier.Id = Guid.NewGuid();
                        Supplier.CreatingUserId = currentUser.Id;
                        _dbContext.Supplier.Add(Supplier);
                    }
                    else
                    {
                        Origin.Name = Supplier.Name;
                        Origin.PhoneNumber = Supplier.PhoneNumber;
                        Origin.Address = Supplier.Address;
                        Origin.ModifiedDate = DateTime.Now;
                        Origin.ModifyingUserId = currentUser.Id;
                        _dbContext.Supplier.Update(Origin);
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
            Supplier = new Supplier();
        }
    }
}