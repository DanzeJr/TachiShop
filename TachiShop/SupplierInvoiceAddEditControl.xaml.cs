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
using MaterialDesignThemes.Wpf;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for SupplierInvoiceAddEditControl.xaml
    /// </summary>
    public partial class SupplierInvoiceAddEditControl : UserControl
    {
        public SupplierInvoiceAddEditControl()
        {
            InitializeComponent();
            (DataContext as SupplierInvoiceAddEditViewModel).ClearDataGridSelectionAction = DataGrid.UnselectAll;
            (DataContext as SupplierInvoiceAddEditViewModel).IsValidProductFunc = IsValidProduct;
            (DataContext as SupplierInvoiceAddEditViewModel).IsValidSupplierInvoiceFunc = IsValidSupplierInvoice;
        }

        private bool IsValidProduct()
        {
            CbProduct.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            CbStatus.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            TbOriginStock.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            CbUnit.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            TbSupplyPrice.GetBindingExpression(TextBox.TextProperty).UpdateSource();
            TbPrice.GetBindingExpression(TextBox.TextProperty).UpdateSource();

            return !Validation.GetHasError(CbProduct) && !Validation.GetHasError(CbStatus) && !Validation.GetHasError(TbOriginStock)
                   && !Validation.GetHasError(CbUnit) && !Validation.GetHasError(TbSupplyPrice) && !Validation.GetHasError(TbPrice);
        }

        private bool IsValidSupplierInvoice()
        {
            CbSupplier.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            DpImportDate.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            TpImportTime.GetBindingExpression(TimePicker.SelectedTimeProperty).UpdateSource();

            return !Validation.GetHasError(CbSupplier) && !Validation.GetHasError(DpImportDate) && !Validation.GetHasError(TpImportTime);
        }
    }
}
