using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Media;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TachiShop.Models;
using TachiShop.Models.Enums;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class InvoiceAddEditViewModel : ViewModelBase
    {
        private readonly ILogger<InvoiceAddEditViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private DateTime? purchaseDate;
        public DateTime? PurchaseDate
        {
            get => purchaseDate;
            set => Set(ref purchaseDate, value);
        }

        private DateTime? purchaseTime;
        public DateTime? PurchaseTime
        {
            get => purchaseTime;
            set => Set(ref purchaseTime, value);
        }

        private InvoiceProduct selectedInvoiceProduct;
        public InvoiceProduct SelectedInvoiceProduct
        {
            get => selectedInvoiceProduct;
            set => Set(ref selectedInvoiceProduct, value);
        }

        private ProductOption selectedOption;
        public ProductOption SelectedOption
        {
            get => selectedOption;
            set => Set(ref selectedOption, value);
        }

        private Product selectedProduct;
        public Product SelectedProduct
        {
            get => selectedProduct;
            set => Set(ref selectedProduct, value);
        }

        private InvoiceProduct invoiceProduct;
        public InvoiceProduct InvoiceProduct
        {
            get => invoiceProduct;
            set => Set(ref invoiceProduct, value);
        }

        private Invoice invoice;
        public Invoice Invoice
        {
            get => invoice;
            set => Set(ref invoice, value);
        }

        private ObservableCollection<InvoiceProduct> invoiceProducts;
        public ObservableCollection<InvoiceProduct> InvoiceProducts
        {
            get => invoiceProducts;
            set => Set(ref invoiceProducts, value);
        }

        private decimal totalPrice = 0;
        public decimal TotalPrice
        {
            get => totalPrice;
            set => Set(ref totalPrice, value);
        }

        private List<Customer> customers;
        public List<Customer> Customers
        {
            get => customers;
            set => Set(ref customers, value);
        }

        private List<Product> products;
        public List<Product> Products
        {
            get => products;
            set => Set(ref products, value);
        }

        private List<ProductOption> productOptions;
        public List<ProductOption> ProductOptions
        {
            get => productOptions;
            set => Set(ref productOptions, value);
        }

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand DataGridSelectionChangedCommand { get; }

        public RelayCommand ProductSelectionChangedCommand { get; }

        public RelayCommand OptionSelectionChangedCommand { get; }

        public RelayCommand OpenAddCustomerDialogCommand { get; }

        public RelayCommand AddEditProductInvoiceCommand { get; }

        public RelayCommand ClearProductCommand { get; }

        public RelayCommand<object> RemoveProductInvoiceCommand { get; }

        public RelayCommand AddInvoiceCommand { get; }

        public RelayCommand ClearCommand { get; }

        public Action ClearDataGridSelectionAction { get; set; }

        public Func<bool> IsValidProductFunc { get; set; }

        public Func<bool> IsValidInvoiceFunc { get; set; }

        public InvoiceAddEditViewModel(ILogger<InvoiceAddEditViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            DataGridSelectionChangedCommand = new RelayCommand(DataGridSelectionChanged);
            ProductSelectionChangedCommand = new RelayCommand(ProductSelectionChanged);
            OptionSelectionChangedCommand = new RelayCommand(OptionSelectionChanged);
            OpenAddCustomerDialogCommand = new RelayCommand(async () => await OpenAddCustomerDialog());
            AddEditProductInvoiceCommand = new RelayCommand(AddEditProductInvoice);
            ClearProductCommand = new RelayCommand(ClearProduct);
            RemoveProductInvoiceCommand = new RelayCommand<object>(RemoveProductInvoice);
            AddInvoiceCommand = new RelayCommand(async () => await AddInvoice());
            ClearCommand = new RelayCommand(ClearAll);
        }

        private async Task OnLoaded()
        {
            try
            {
                ClearAll();
                Products = await _dbContext.Product.Where(x => x.Status == (int)ProductStatus.Enabled).OrderBy(x => x.Name).ToListAsync();
                Customers = await _dbContext.Customer.OrderBy(x => x.FullName).ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OnUnloaded()
        {
            PurchaseDate = null;
            PurchaseTime = null;
            SelectedOption = null;
            ProductOptions = null;
            SelectedProduct = null;
            Invoice = null;
            InvoiceProduct = null;
            InvoiceProducts = null;
        }

        private InvoiceProduct CloneInvoiceProduct(InvoiceProduct invoiceProduct)
        {
            var result = new InvoiceProduct();
            result.Id = invoiceProduct.Id;
            result.ProductOptionId = invoiceProduct.ProductOptionId;
            result.ProductOption = invoiceProduct.ProductOption;
            result.Amount = invoiceProduct.Amount;
            result.Unit = invoiceProduct.Unit;
            result.Price = invoiceProduct.Price;

            return result;
        }

        private void DataGridSelectionChanged()
        {
            try
            {
                if (SelectedInvoiceProduct == null)
                {
                    return;
                }
                InvoiceProduct = CloneInvoiceProduct(SelectedInvoiceProduct);
                SelectedProduct = InvoiceProduct.ProductOption.Product;
                SelectedOption = InvoiceProduct.ProductOption;
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void ProductSelectionChanged()
        {
            try
            {
                if (SelectedProduct != null)
                {
                    ProductOptions = _dbContext.ProductOption
                        .Where(x => x.ProductId == SelectedProduct.Id && x.Status == (int)ProductStatus.Enabled)
                        .OrderBy(x => x.CreatedDate)
                        .ToList();
                }
                else
                {
                    ProductOptions = null;
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OptionSelectionChanged()
        {
            try
            {
                var invoiceProduct = InvoiceProducts.FirstOrDefault(x => x.ProductOptionId == SelectedOption?.Id);
                if (invoiceProduct != null)
                {
                    SelectedInvoiceProduct = invoiceProduct;
                    InvoiceProduct = CloneInvoiceProduct(SelectedInvoiceProduct);
                    SelectedProduct = InvoiceProduct.ProductOption.Product;
                    SelectedOption = InvoiceProduct.ProductOption;
                }
                else if (InvoiceProduct.Id != Guid.Empty)
                {
                    var product = SelectedProduct;
                    var option = SelectedOption;
                    ClearDataGridSelectionAction.Invoke();
                    SelectedProduct = product;
                    SelectedOption = option;
                    InvoiceProduct = new InvoiceProduct();
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private async Task OpenAddCustomerDialog()
        {
            try
            {
                await DialogHost.Show(new CustomerAddEditControl(null), "RootDialog",
                    new DialogClosingEventHandler(async (sender, args) =>
                    {
                        Customers = await _dbContext.Customer.ToListAsync();
                    }));
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void AddEditProductInvoice()
        {
            try
            {
                if (IsValidProductFunc.Invoke())
                {
                    InvoiceProduct.ProductOptionId = SelectedOption.Id;
                    InvoiceProduct.ProductOption = SelectedOption;
                    InvoiceProduct.ProductOption.ProductId = SelectedProduct.Id;
                    InvoiceProduct.ProductOption.Product = SelectedProduct;
                    if (InvoiceProduct.Id == Guid.Empty)
                    {
                        InvoiceProduct.Id = Guid.NewGuid();
                        InvoiceProduct.Price = InvoiceProduct.ProductOption.Price;
                        InvoiceProduct.Unit = InvoiceProduct.ProductOption.Unit;
                        InvoiceProducts.Add(InvoiceProduct);
                    }
                    else
                    {
                        var invoiceProduct = InvoiceProducts.First(x => x.ProductOptionId == InvoiceProduct.ProductOptionId);
                        InvoiceProduct.Price = InvoiceProduct.ProductOption.Price;
                        InvoiceProduct.Unit = InvoiceProduct.ProductOption.Unit;
                        InvoiceProducts.Remove(invoiceProduct);
                        InvoiceProducts.Add(InvoiceProduct);
                    }
                    ClearProduct();
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void ClearProduct()
        {
            ClearDataGridSelectionAction.Invoke();
            InvoiceProduct = new InvoiceProduct();
            TotalPrice = InvoiceProducts.Sum(x => x.Amount * x.Price);
            SelectedOption = null;
            ProductOptions = null;
            SelectedProduct = null;
        }

        private void RemoveProductInvoice(object selectedItems)
        {
            try
            {
                var list = (IList)selectedItems;
                var invoiceProducts = list.Cast<InvoiceProduct>().ToList();
                foreach (var invoiceProduct in invoiceProducts)
                {
                    InvoiceProducts.Remove(invoiceProduct);
                }
                ClearProduct();
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private async Task AddInvoice()
        {
            try
            {
                if (IsValidInvoiceFunc.Invoke())
                {
                    if (InvoiceProducts.Any())
                    {
                        var currentUser = (User)App.Current.Properties["USER"];
                        Invoice.Id = Guid.NewGuid();
                        Invoice.CreatingUserId = currentUser.Id;
                        Invoice.CreatedDate = PurchaseDate.Value.Date;
                        if (PurchaseTime != null)
                        {
                            Invoice.CreatedDate = Invoice.CreatedDate.AddHours(PurchaseTime.Value.Hour).AddMinutes(PurchaseTime.Value.Minute);
                        }
                        Invoice.InvoiceProducts = InvoiceProducts.ToList();
                        foreach (var invoiceProduct in Invoice.InvoiceProducts)
                        {
                            invoiceProduct.InvoiceId = Invoice.Id;

                            var option = await _dbContext.ProductOption.FindAsync(invoiceProduct.ProductOptionId);
                            option.Stock -= invoiceProduct.Amount;
                            _dbContext.ProductOption.Update(option);
                        }
                        _dbContext.Invoice.Add(Invoice);
                        await _dbContext.SaveChangesAsync();
                        await DialogHost.Show(new InfoDialogControl(
                            $"Đã tạo hóa đơn bán hàng vào lúc {Invoice.CreatedDate:HH:mm} ngày {Invoice.CreatedDate:dd/MM/yyyy}.",
                            icon: PackIconKind.CheckCircle,
                            iconColor: Brushes.Green,
                            title: "Thành công",
                            buttonColor: Brushes.Green), "RootDialog",
                            new DialogClosingEventHandler((sender, args) => { ClearAll(); }));
                    }
                    else
                    {
                        await DialogHost.Show(new InfoDialogControl("Vui lòng thêm mặt hàng vào hóa đơn."), "RootDialog");
                    }
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void ClearAll()
        {
            Invoice = new Invoice();
            InvoiceProducts = new ObservableCollection<InvoiceProduct>();
            PurchaseDate = DateTime.Now;
            PurchaseTime = DateTime.Now;
            ClearProduct();
        }
    }
}