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
    /// Interaction logic for SupplierAddEditControl.xaml
    /// </summary>
    public partial class SupplierAddEditControl : UserControl
    {
        public SupplierAddEditControl(Guid? id = null)
        {
            InitializeComponent();
            (DataContext as SupplierAddEditViewModel).Id = id;
            (DataContext as SupplierAddEditViewModel).IsValidFunc = IsValid;
        }
        private bool IsValid()
        {
            TbName.GetBindingExpression(TextBox.TextProperty).UpdateSource();

            return !Validation.GetHasError(TbName);
        }
    }
}
