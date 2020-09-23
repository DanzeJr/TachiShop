using System;
using System.Windows.Controls;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for ProductAddEditControl.xaml
    /// </summary>
    public partial class ProductAddEditControl : UserControl
    {
        public ProductAddEditControl(Guid? id = null)
        {
            InitializeComponent();
            (DataContext as ProductAddEditViewModel).Id = id;
            (DataContext as ProductAddEditViewModel).IsValidFunc = IsValid;
        }

        private bool IsValid()
        {
            CbStatus.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            TbName.GetBindingExpression(TextBox.TextProperty).UpdateSource();

            return !Validation.GetHasError(CbStatus) && !Validation.GetHasError(TbName);
        }
    }
}
