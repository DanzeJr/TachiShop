using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using TachiShop.Infrastructures;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for UserDetailsControl.xaml
    /// </summary>
    public partial class UserDetailsControl : UserControl
    {
        public UserDetailsControl()
        {
            InitializeComponent();
            (DataContext as UserDetailsViewModel).IsValidFunc = IsValid;
        }

        private bool IsValid(bool isEdit)
        {
            if (!isEdit)
            {
                TbUsername.GetBindingExpression(TextBox.TextProperty).UpdateSource();
                PbPassword.GetBindingExpression(PasswordHelper.PasswordProperty).UpdateSource();
            }
            CbGender.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            DpBirthDate.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            TbName.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            TbEmail.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            TbPhoneNumber.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            TbAddress.GetBindingExpression(TextBox.TextProperty).UpdateSource();

            return !Validation.GetHasError(CbGender) && !Validation.GetHasError(DpBirthDate) && !Validation.GetHasError(TbName)
                   && !Validation.GetHasError(TbEmail) && !Validation.GetHasError(TbPhoneNumber) && !Validation.GetHasError(TbAddress)
                   && (!isEdit || (!Validation.GetHasError(TbUsername) && !Validation.GetHasError(PbPassword)));
        }
    }
}
