using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.Extensions.Logging;
using TachiShop.Models;
using TachiShop.Models.Constants;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class CustomerAddEditViewModel : ViewModelBase
    {

        private readonly ILogger<CustomerAddEditViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private Guid? id;
        public Guid? Id
        {
            get => id;
            set => Set(ref id, value);
        }

        public Customer Origin { get; set; }

        private Customer customer;
        public Customer Customer
        {
            get => customer;
            set => Set(ref customer, value);
        }

        public Dictionary<int, string> Genders { get; } = Constant.Genders;

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand AddEditCommand { get; }

        public RelayCommand ClearCommand { get; }

        public RelayCommand CloseDialogCommand { get; }

        public Func<bool> IsValidFunc { get; set; }

        public CustomerAddEditViewModel(ILogger<CustomerAddEditViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            AddEditCommand = new RelayCommand(async () => await AddEditCustomer());
            ClearCommand = new RelayCommand(ClearForm);
            CloseDialogCommand = new RelayCommand(CloseDialog);
        }

        private Customer CloneCustomer(Customer customer)
        {
            var result = new Customer();
            result.FullName = customer.FullName;
            result.BirthDate = customer.BirthDate;
            result.Gender = customer.Gender;
            result.PhoneNumber = customer.PhoneNumber;
            result.Address = customer.Address;

            return result;
        }

        private async Task OnLoaded()
        {
            try
            {
                if (Id != null)
                {
                    Origin = await _dbContext.Customer.FindAsync(Id);
                    Customer = CloneCustomer(Origin);
                }
                else
                {
                    Customer = new Customer();
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OnUnloaded()
        {
            Customer = null;
            Origin = null;
            Id = null;
        }

        private async Task AddEditCustomer()
        {
            try
            {
                if (IsValidFunc.Invoke())
                {
                    var currentUser = (User)App.Current.Properties["USER"];
                    if (Id == null)
                    {
                        Customer.Id = Guid.NewGuid();
                        Customer.CreatingUserId = currentUser.Id;
                        _dbContext.Customer.Add(Customer);
                    }
                    else
                    {
                        Origin.FullName = Customer.FullName;
                        Origin.BirthDate = Customer.BirthDate;
                        Origin.Gender = Customer.Gender;
                        Origin.PhoneNumber = Customer.PhoneNumber;
                        Origin.Address = Customer.Address;
                        Origin.ModifiedDate = DateTime.Now;
                        Origin.ModifyingUserId = currentUser.Id;
                        _dbContext.Customer.Update(Origin);
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
            Customer = new Customer();
        }
    }
}