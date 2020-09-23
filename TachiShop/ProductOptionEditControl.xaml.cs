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
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for ProductOptionEditControl.xaml
    /// </summary>
    public partial class ProductOptionEditControl : UserControl
    {
        public ProductOptionEditControl(Guid id)
        {
            InitializeComponent();
            (DataContext as ProductOptionEditViewModel).Id = id;
            (DataContext as ProductOptionEditViewModel).IsValidFunc = IsValid;
        }

        private bool IsValid()
        {
            TbPrice.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            CbStatus.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            TbStock.GetBindingExpression(TextBox.TextProperty).UpdateSource();

            return !Validation.GetHasError(TbPrice) && !Validation.GetHasError(CbStatus) && !Validation.GetHasError(TbStock);
        }
    }
}
