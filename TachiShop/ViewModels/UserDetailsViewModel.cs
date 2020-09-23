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
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class UserDetailsViewModel : ViewModelBase
    {
        public static readonly int CREATE_MODE = 0;
        public static readonly int EDIT_MODE = 1;
        public static readonly int VIEW_MODE = 2;

        private readonly ILogger<UserDetailsViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private int mode;
        public int Mode
        {
            get => mode;
            set => Set(ref mode, value);
        }

        private Guid id;
        public Guid Id
        {
            get => id;
            set => Set(ref id, value);
        }

        public User Origin { get; set; }

        private User user;
        public User User
        {
            get => user;
            set => Set(ref user, value);
        }

        public Dictionary<int, string> Genders { get; set; } = Constant.Genders;

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand OpenChangePasswordDialogCommand { get; }

        public RelayCommand SwitchToEditCommand { get; }

        public RelayCommand AddEditCommand { get; }

        public RelayCommand CancelEditCommand { get; }

        public RelayCommand ClearCommand { get; }

        public Action UpdateCurrentUserAction { get; set; }

        public Func<bool, bool> IsValidFunc { get; set; }

        public UserDetailsViewModel(ILogger<UserDetailsViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            SwitchToEditCommand = new RelayCommand(SwitchToEdit);
            OpenChangePasswordDialogCommand = new RelayCommand(async () => await OpenChangePasswordDialog(Origin.Id));
            AddEditCommand = new RelayCommand(async () => await AddEditUser());
            CancelEditCommand = new RelayCommand(CancelEdit);
            ClearCommand = new RelayCommand(Clear);
        }

        private User CloneUser(User user)
        {
            var result = new User();
            result.Id = user.Id;
            result.UserName = user.UserName;
            result.FullName = user.FullName;
            result.Email = user.Email;
            result.BirthDate = user.BirthDate;
            result.PhoneNumber = user.PhoneNumber;
            result.Gender = user.Gender;
            result.Address = user.Address;
            result.CreatingUser = user.CreatingUser;
            result.ModifyingUser = user.ModifyingUser;
            result.CreatedDate = user.CreatedDate;
            result.ModifiedDate = user.ModifiedDate;

            return result;
        }

        private async Task OnLoaded()
        {
            try
            {
                if (Mode != CREATE_MODE)
                {
                    Origin = await _dbContext.User.FindAsync(Id);
                    User = CloneUser(Origin);
                }
                else
                {
                    User = new User();
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message + " in Mode = " + Mode);
            }
        }

        private void OnUnloaded()
        {
            User = null;
            Origin = null;
        }

        private async Task OpenChangePasswordDialog(Guid id)
        {
            try
            {
                await DialogHost.Show(new ChangePasswordControl(id), "RootDialog");
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void SwitchToEdit()
        {
            Mode = EDIT_MODE;
        }

        private async Task AddEditUser()
        {
            try
            {
                if (IsValidFunc.Invoke(Mode == EDIT_MODE))
                {
                    var currentUser = (User)App.Current.Properties["USER"];
                    if (Mode == CREATE_MODE)
                    {
                        User.Id = Guid.NewGuid();
                        User.Password = BCrypt.Net.BCrypt.EnhancedHashPassword(User.Password);
                        User.CreatedDate = DateTime.Now;
                        User.CreatingUserId = currentUser.Id;

                        _dbContext.User.Add(User);
                        await _dbContext.SaveChangesAsync();
                    }
                    else
                    {
                        Origin.FullName = User.FullName;
                        Origin.Email = User.Email;
                        Origin.BirthDate = User.BirthDate;
                        Origin.PhoneNumber = User.PhoneNumber;
                        Origin.Gender = User.Gender;
                        Origin.Address = User.Address;
                        Origin.ModifiedDate = DateTime.Now;
                        Origin.ModifyingUserId = currentUser.Id;

                        _dbContext.User.Update(Origin);
                        await _dbContext.SaveChangesAsync();
                        if (currentUser.Id == Origin.Id)
                        {
                            currentUser = CloneUser(Origin);
                            App.Current.Properties["USER"] = currentUser;
                            UpdateCurrentUserAction.Invoke();
                        }
                    }
                    Mode = VIEW_MODE;
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message + " in Mode = " + Mode);
            }

        }

        private void CancelEdit()
        {
            User = CloneUser(Origin);
            Mode = VIEW_MODE;
        }

        private void Clear()
        {
            if (Mode == CREATE_MODE)
            {
                User = new User();
            }
            else
            {

                User = new User
                {
                    UserName = Origin.UserName,
                    CreatedDate = Origin.CreatedDate
                };
            }
        }
    }
}