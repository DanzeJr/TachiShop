using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Media;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TachiShop.Models;
using TachiShop.Models.Enums;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class ChangePasswordViewModel : ViewModelBase
    {

        private readonly ILogger<ChangePasswordViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private Guid id;
        public Guid Id
        {
            get => id;
            set => Set(ref id, value);
        }

        private bool requiredPassword = true;
        public bool RequiredPassword
        {
            get => requiredPassword;
            set => Set(ref requiredPassword, value);
        }

        private string oldPassword;
        public string OldPassword
        {
            get => oldPassword;
            set => Set(ref oldPassword, value);
        }

        private string newPassword;
        public string NewPassword
        {
            get => newPassword;
            set => Set(ref newPassword, value);
        }

        private string confirmPassword;
        public string ConfirmPassword
        {
            get => confirmPassword;
            set => Set(ref confirmPassword, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand ChangePasswordCommand { get; }

        public RelayCommand ClearCommand { get; }

        public RelayCommand CloseDialogCommand { get; }

        public Func<bool> IsValidFunc { get; set; }

        public ChangePasswordViewModel(ILogger<ChangePasswordViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            ChangePasswordCommand = new RelayCommand(async () => await ChangePassword());
            ClearCommand = new RelayCommand(ClearForm);
            CloseDialogCommand = new RelayCommand(CloseDialog);
        }

        private async Task OnLoaded()
        {
            try
            {
                var currentUser = (User)App.Current.Properties["USER"];
                if (currentUser.CreatingUserId == null)
                {
                    RequiredPassword = false;
                }
                else
                {
                    RequiredPassword = true;
                }

                await Task.CompletedTask;
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OnUnloaded()
        {
            ClearForm();
        }

        private async Task ChangePassword()
        {
            try
            {
                if (IsValidFunc.Invoke())
                {
                    var user = await _dbContext.User.FindAsync(Id);
                    if (user != null)
                    {
                        if (RequiredPassword && !BCrypt.Net.BCrypt.EnhancedVerify(OldPassword, user.Password))
                        {
                            await DialogHost.Show(new InfoDialogControl(
                                    $"Mật khẩu cũ không đúng.",
                                    icon: PackIconKind.LockAlert,
                                    iconColor: Brushes.Orange,
                                    title: "Thông báo",
                                    buttonColor: Brushes.Orange), "ChangePasswordDialog");
                            return;
                        }

                        var currentUser = (User)App.Current.Properties["USER"];
                        user.ModifyingUserId = currentUser.Id;
                        user.Password = BCrypt.Net.BCrypt.EnhancedHashPassword(NewPassword);

                        _dbContext.User.Update(user);
                        await _dbContext.SaveChangesAsync();

                        CloseDialog();
                        await DialogHost.Show(new InfoDialogControl(
                                $"Đổi mật khẩu thành công.",
                                icon: PackIconKind.LockCheck,
                                iconColor: Brushes.Green,
                                title: "Thành công",
                                buttonColor: Brushes.Green), "RootDialog");
                    }
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
            OldPassword = null;
            NewPassword = null;
            ConfirmPassword = null;
        }
    }
}