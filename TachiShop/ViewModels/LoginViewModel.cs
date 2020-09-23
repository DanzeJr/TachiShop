using System;
using System.ComponentModel;
using System.Security;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.Extensions.Logging;
using TachiShop.Authentication;
using TachiShop.Infrastructures;

namespace TachiShop.ViewModels
{
    public class LoginViewModel : ViewModelBase
    {
        private readonly ILogger<LoginViewModel> _logger;
        private readonly IAuthService _authService;
        private readonly NavigationService _navigationService;

        private bool? isSuccess;
        public bool? IsSuccess
        {
            get => isSuccess;
            set => Set(ref isSuccess, value);
        }

        private bool isDialogOpen = false;

        private Visibility progressVisibility = Visibility.Visible;
        public Visibility ProgressVisibility
        {
            get => progressVisibility;
            set => Set(ref progressVisibility, value);
        }

        private string dialogButtonText = "Hủy";
        public string DialogButtonText
        {
            get => dialogButtonText;
            set => Set(ref dialogButtonText, value);
        }

        private string userName;
        public string UserName
        {
            get => userName;
            set => Set(ref userName, value);
        }

        private string password;
        public string Password
        {
            get => password;
            set => Set(ref password, value);
        }

        private bool rememberMe;
        public bool RememberMe
        {
            get => rememberMe;
            set => Set(ref rememberMe, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand LoginCommand { get; }

        public RelayCommand FinishLoginCommand { get; }
        public Action CloseWindow { get; set; }

        public Func<bool> IsValidFunc { get; set; }

        public LoginViewModel(ILogger<LoginViewModel> logger, IAuthService authService, NavigationService navigationService)
        {
            _logger = logger;
            _authService = authService;
            _navigationService = navigationService;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            LoginCommand = new RelayCommand(async () => await Login());
            FinishLoginCommand = new RelayCommand(async () => await FinishLogin());
        }

        private async Task OnLoaded()
        {
            await Task.CompletedTask;
        }

        private void OnUnloaded()
        {
            IsSuccess = null;
            UserName = null;
            Password = null;
            RememberMe = false;
        }

        private async Task Login()
        {
            try
            {
                if (IsValidFunc.Invoke())
                {
                    DialogHost.OpenDialogCommand.Execute(null, null);
                    isDialogOpen = true;
                    var user = await _authService.SignIn(UserName, Password, RememberMe);
                    DialogButtonText = "Ok";
                    if (isDialogOpen)
                    {
                        ProgressVisibility = Visibility.Collapsed;
                        if (user != null)
                        {
                            IsSuccess = true;
                        }
                        else
                        {
                            IsSuccess = false;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private async Task FinishLogin()
        {
            try
            {
                if (IsSuccess == true)
                {
                    await _navigationService.ShowAsync<DashboardWindow>();
                    CloseWindow.Invoke();
                    return;
                }
                await Task.Delay(1000);
                IsSuccess = null;
                DialogButtonText = "Hủy";
                ProgressVisibility = Visibility.Visible;
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

    }
}