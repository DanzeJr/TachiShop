using System;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using TachiShop.Infrastructures;
using TachiShop.Repositories;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
            (DataContext as LoginViewModel).CloseWindow = this.Close;
            (DataContext as LoginViewModel).IsValidFunc = IsValid;

            PaletteHelper paletteHelper = new PaletteHelper();
            ITheme theme = paletteHelper.GetTheme();

            ThemeExtensions.SetBaseTheme(theme, AppPref.Default.DarkTheme ? Theme.Dark : Theme.Light);

            paletteHelper.SetTheme(theme);
        }

        private bool IsValid()
        {
            TbUsername.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            PbPassword.GetBindingExpression(PasswordHelper.PasswordProperty).UpdateSource();

            return !Validation.GetHasError(TbUsername) && !Validation.GetHasError(PbPassword);
        }
        private void LoginWindow_OnMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void BtnMinimize_OnClick(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void BtnClose_OnClick(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
