using System;
using System.Threading.Tasks;
using System.Windows;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using Microsoft.Extensions.DependencyInjection;
using TachiShop.Authentication;
using TachiShop.Infrastructures;
using TachiShop.Models;

namespace TachiShop.ViewModels
{
    public class DashboardViewModel : ViewModelBase
    {
        private readonly NavigationService _navigationService;
        private readonly IAuthService _authService;

        private WindowState windowState = WindowState.Normal;
        public WindowState WindowState
        {
            get => windowState;
            set => Set(ref windowState, value);
        }

        private User currentUser;

        public User CurrentUser
        {
            get => currentUser;
            set => Set(ref currentUser, value);
        }

        public ObservableStack<Action> BackStack { get; set; } = new ObservableStack<Action>();

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand BackCommand { get; }

        private RelayCommand refreshCommand;
        public RelayCommand RefreshCommand
        {
            get => refreshCommand;
            set => Set(ref refreshCommand, value);
        }

        public RelayCommand<WindowState> SwitchWindowStateCommand { get; }

        public RelayCommand ShutDownCommand { get; }

        public RelayCommand LogOutCommand { get; }

        public RelayCommand<int> SelectionChangedCommand { get; }

        private ViewModelBase childViewModel;
        public ViewModelBase ChildViewModel
        {
            get => childViewModel;
            set => Set(ref childViewModel, value);
        }

        public Action<int> MoveCursorMenu { get; set; }

        public Action CloseWindowAction { get; set; }

        public DashboardViewModel(NavigationService navigationService, IAuthService authService)
        {
            _navigationService = navigationService;
            _authService = authService;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            BackCommand = new RelayCommand(OnBack);
            SwitchWindowStateCommand = new RelayCommand<WindowState>(SwitchWindowState);
            LogOutCommand = new RelayCommand(async () => await LogOut());
            ShutDownCommand = new RelayCommand(() => Application.Current.Shutdown());
            SelectionChangedCommand = new RelayCommand<int>(OnSelectionChanged);
        }

        #region Private Methods

        private async Task OnLoaded()
        {
            ViewProductList();
            CurrentUser = (User)App.Current.Properties["USER"];
            await Task.CompletedTask;
        }

        private void OnUnloaded()
        {
            CurrentUser = null;
        }

        private async Task LogOut()
        {
            await _authService.SignOut();
            await _navigationService.ShowAsync<LoginWindow>();
            CloseWindowAction.Invoke();
        }

        private void SwitchWindowState(WindowState state)
        {
            WindowState = state;
        }

        private void OnBack()
        {
            BackStack.Pop().Invoke();
        }

        private void OnSelectionChanged(int index)
        {
            BackStack.Clear();
            MoveCursorMenu.Invoke(index);
            switch (index)
            {
                case 0:
                    {
                        ViewProductList();
                        break;
                    }
                case 1:
                    {
                        ViewInvoiceList();
                        break;
                    }
                case 2:
                    {
                        ViewSupplierInvoiceList();
                        break;
                    }
                case 3:
                    {
                        ViewUserList();
                        break;
                    }
                case 4:
                    {
                        ViewCustomerList();
                        break;
                    }
            }
        }

        private void ViewProductList()
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<ProductListViewModel>();
            (ChildViewModel as ProductListViewModel).ViewDetailsCommand =
                new RelayCommand<Guid>(ViewProductDetails);
        }

        private void ViewProductDetails(Guid id)
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<ProductOptionListViewModel>();
            (ChildViewModel as ProductOptionListViewModel).Id = id;
            BackStack.Push(ViewProductList);
        }

        private void ViewSupplierInvoiceList()
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<SupplierInvoiceListViewModel>();
            (ChildViewModel as SupplierInvoiceListViewModel).ViewAddEditCommand = new RelayCommand<Guid?>(ViewSupplierInvoiceAddEdit);
            (ChildViewModel as SupplierInvoiceListViewModel).ViewDetailsCommand = new RelayCommand<Guid>(ViewSupplierInvoiceDetails);
        }

        private void ViewSupplierInvoiceDetails(Guid id)
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<SupplierInvoiceDetailsViewModel>();
            (ChildViewModel as SupplierInvoiceDetailsViewModel).Id = id;
            BackStack.Push(ViewSupplierInvoiceList);
        }

        private void ViewSupplierInvoiceAddEdit(Guid? id)
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<SupplierInvoiceAddEditViewModel>();
            BackStack.Push(ViewSupplierInvoiceList);
        }

        private void ViewInvoiceList()
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<InvoiceListViewModel>();
            (ChildViewModel as InvoiceListViewModel).ViewAddEditCommand = new RelayCommand<Guid?>(ViewInvoiceAddEdit);
            (ChildViewModel as InvoiceListViewModel).ViewDetailsCommand = new RelayCommand<Guid>(ViewInvoiceDetails);
        }

        private void ViewInvoiceDetails(Guid id)
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<InvoiceDetailsViewModel>();
            (ChildViewModel as InvoiceDetailsViewModel).Id = id;
            BackStack.Push(ViewInvoiceList);
        }

        private void ViewInvoiceAddEdit(Guid? id)
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<InvoiceAddEditViewModel>();
            BackStack.Push(ViewInvoiceList);
        }

        private void ViewUserList()
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<UserListViewModel>();
            (ChildViewModel as UserListViewModel).ViewDetailsCommand = new RelayCommand<Guid>(id => ViewUserDetails(id, UserDetailsViewModel.VIEW_MODE));
            (ChildViewModel as UserListViewModel).ViewEditCommand = new RelayCommand<Guid>(id => ViewUserDetails(id, UserDetailsViewModel.EDIT_MODE));
            (ChildViewModel as UserListViewModel).ViewAddCommand = new RelayCommand(() => ViewUserDetails(Guid.Empty, UserDetailsViewModel.CREATE_MODE));
        }

        private void ViewUserDetails(Guid id, int mode)
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<UserDetailsViewModel>();
            (ChildViewModel as UserDetailsViewModel).Id = id;
            (ChildViewModel as UserDetailsViewModel).UpdateCurrentUserAction = () => CurrentUser = (User)App.Current.Properties["USER"];
            (ChildViewModel as UserDetailsViewModel).Mode = mode;
            BackStack.Push(ViewUserList);
        }

        private void ViewCustomerList()
        {
            ChildViewModel = App.ServiceProvider.GetRequiredService<CustomerListViewModel>();
        }

        #endregion
    }
}