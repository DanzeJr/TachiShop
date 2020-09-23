using System;
using System.Windows.Controls;
using TachiShop.Infrastructures;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for ChangePasswordControl.xaml
    /// </summary>
    public partial class ChangePasswordControl : UserControl
    {
        public ChangePasswordControl(Guid id)
        {
            InitializeComponent();
            (DataContext as ChangePasswordViewModel).Id = id;
            (DataContext as ChangePasswordViewModel).IsValidFunc = IsValid;
        }
        private bool IsValid()
        {
            PbOldPassword.GetBindingExpression(PasswordHelper.PasswordProperty).UpdateSource();
            PbNewPassword.GetBindingExpression(PasswordHelper.PasswordProperty).UpdateSource();
            PbConfirmPassword.GetBindingExpression(PasswordHelper.PasswordProperty).UpdateSource();

            var requiredPassword = (DataContext as ChangePasswordViewModel).RequiredPassword;

            return (!requiredPassword || !Validation.GetHasError(PbOldPassword)) && !Validation.GetHasError(PbNewPassword) && !Validation.GetHasError(PbConfirmPassword);
        }
    }
}
