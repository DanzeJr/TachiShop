using System.Windows.Controls;
using MaterialDesignThemes.Wpf;
using TachiShop.ViewModels;

namespace TachiShop
{
    /// <summary>
    /// Interaction logic for InvoiceAddEditControl.xaml
    /// </summary>
    public partial class InvoiceAddEditControl : UserControl
    {
        public InvoiceAddEditControl()
        {
            InitializeComponent();
            (DataContext as InvoiceAddEditViewModel).ClearDataGridSelectionAction = DataGrid.UnselectAll;
            (DataContext as InvoiceAddEditViewModel).IsValidProductFunc = IsValidProduct;
            (DataContext as InvoiceAddEditViewModel).IsValidInvoiceFunc = IsValidInvoice;
        }

        private bool IsValidProduct()
        {
            CbProduct.GetBindingExpression(ComboBox.SelectedItemProperty).UpdateSource();
            CbOption.GetBindingExpression(ComboBox.SelectedItemProperty).UpdateSource();
            TbAmount.GetBindingExpression(TextBox.TextProperty).UpdateSource();

            return !Validation.GetHasError(CbProduct) && !Validation.GetHasError(CbOption) && !Validation.GetHasError(TbAmount);
        }

        private bool IsValidInvoice()
        {
            CbCustomer.GetBindingExpression(ComboBox.SelectedValueProperty).UpdateSource();
            DpPurchaseDate.GetBindingExpression(DatePicker.SelectedDateProperty).UpdateSource();
            TpPurchaseTime.GetBindingExpression(TimePicker.SelectedTimeProperty).UpdateSource();

            return !Validation.GetHasError(CbCustomer) && !Validation.GetHasError(DpPurchaseDate) && !Validation.GetHasError(TpPurchaseTime);
        }
    }
}
