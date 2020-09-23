using System;
using System.Windows.Controls;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for CustomerAddEditControl.xaml
    /// </summary>
    public partial class CustomerAddEditControl : UserControl
    {
        public CustomerAddEditControl(Guid? id)
        {
            InitializeComponent();
            (DataContext as CustomerAddEditViewModel).Id = id;
            (DataContext as CustomerAddEditViewModel).IsValidFunc = IsValid;
        }

        private bool IsValid()
        {
            TbName.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            CbGender.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();

            return !Validation.GetHasError(TbName) && !Validation.GetHasError(CbGender);
        }
    }
}
