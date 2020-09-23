using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Media;
using GalaSoft.MvvmLight;
using GalaSoft.MvvmLight.Command;
using MaterialDesignThemes.Wpf;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using TachiShop.Models;
using TachiShop.Models.Constants;
using TachiShop.Repositories;

namespace TachiShop.ViewModels
{
    public class SupplierInvoiceAddEditViewModel : ViewModelBase
    {
        private readonly ILogger<SupplierInvoiceAddEditViewModel> _logger;
        private readonly AppDbContext _dbContext;

        private DateTime? importDate;
        public DateTime? ImportDate
        {
            get => importDate;
            set => Set(ref importDate, value);
        }

        private DateTime? importTime;
        public DateTime? ImportTime
        {
            get => importTime;
            set => Set(ref importTime, value);
        }

        private ProductOption selectedOption;
        public ProductOption SelectedOption
        {
            get => selectedOption;
            set => Set(ref selectedOption, value);
        }

        private ProductOption productOption;
        public ProductOption ProductOption
        {
            get => productOption;
            set => Set(ref productOption, value);
        }

        private SupplierInvoice supplierInvoice;
        public SupplierInvoice SupplierInvoice
        {
            get => supplierInvoice;
            set => Set(ref supplierInvoice, value);
        }

        private ObservableCollection<ProductOption> productOptions;
        public ObservableCollection<ProductOption> ProductOptions
        {
            get => productOptions;
            set => Set(ref productOptions, value);
        }

        private decimal totalPrice = 0;
        public decimal TotalPrice
        {
            get => totalPrice;
            set => Set(ref totalPrice, value);
        }

        private List<Supplier> suppliers;
        public List<Supplier> Suppliers
        {
            get => suppliers;
            set => Set(ref suppliers, value);
        }

        private List<Product> products;
        public List<Product> Products
        {
            get => products;
            set => Set(ref products, value);
        }

        public Dictionary<int, string> Units { get; set; } = Constant.ProductUnits;

        public Dictionary<int, string> Statuses { get; set; } = Constant.ProductStatuses;

        public RelayCommand LoadedCommand { get; }

        public RelayCommand UnloadedCommand { get; }

        public RelayCommand DataGridSelectionChangedCommand { get; }

        public RelayCommand ProductSelectionChangedCommand { get; }

        public RelayCommand OpenAddSupplierDialogCommand { get; }

        public RelayCommand OpenAddProductDialogCommand { get; }

        public RelayCommand AddEditProductInvoiceCommand { get; }

        public RelayCommand ClearProductCommand { get; }

        public RelayCommand<object> RemoveProductInvoiceCommand { get; }

        public RelayCommand AddInvoiceCommand { get; }

        public RelayCommand ClearCommand { get; }

        public Action ClearDataGridSelectionAction { get; set; }

        public Func<bool> IsValidProductFunc { get; set; }

        public Func<bool> IsValidSupplierInvoiceFunc { get; set; }

        public SupplierInvoiceAddEditViewModel(ILogger<SupplierInvoiceAddEditViewModel> logger, AppDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
            Statuses.Remove(0);
            LoadedCommand = new RelayCommand(async () => await OnLoaded());
            UnloadedCommand = new RelayCommand(OnUnloaded);
            DataGridSelectionChangedCommand = new RelayCommand(DataGridSelectionChanged);
            ProductSelectionChangedCommand = new RelayCommand(ProductSelectionChanged);
            OpenAddSupplierDialogCommand = new RelayCommand(async () => await OpenAddSupplierDialog());
            OpenAddProductDialogCommand = new RelayCommand(async () => await OpenAddProductDialog());
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
                Products = await _dbContext.Product.OrderBy(x => x.Name).ToListAsync();
                Suppliers = await _dbContext.Supplier.OrderBy(x => x.Name).ToListAsync();
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private void OnUnloaded()
        {
            SupplierInvoice = null;
            SelectedOption = null;
            ProductOption = null;
            Products = null;
            Suppliers = null;
            ProductOptions = null;
            ImportDate = null;
            ImportTime = null;
        }

        private ProductOption CloneProductOption(ProductOption option)
        {
            var result = new ProductOption();
            result.Id = option.Id;
            result.CreatedDate = option.CreatedDate;
            result.OriginStock = option.OriginStock;
            result.SupplyPrice = option.SupplyPrice;
            result.Price = option.Price;
            result.Unit = option.Unit;
            result.ProductId = option.ProductId;
            result.Product = option.Product;
            result.SupplierInvoiceId = option.SupplierInvoiceId;
            result.Status = option.Status;

            return result;
        }

        private void DataGridSelectionChanged()
        {
            try
            {
                if (SelectedOption == null)
                {
                    return;
                }

                ProductOption = CloneProductOption(SelectedOption);
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
                var option = ProductOptions.FirstOrDefault(x => x.ProductId == ProductOption.ProductId);
                if (option != null)
                {
                    SelectedOption = option;
                    ProductOption = CloneProductOption(option);
                }
                else if (ProductOption != null && ProductOption.Id != Guid.Empty)
                {
                    Product product = ProductOption.Product;
                    ClearDataGridSelectionAction.Invoke();
                    ProductOption = new ProductOption
                    {
                        ProductId = product.Id,
                        Product = product
                    };
                }
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private async Task OpenAddSupplierDialog()
        {
            try
            {
                await DialogHost.Show(new SupplierAddEditControl(), "RootDialog",
                    new DialogClosingEventHandler(async (sender, args) =>
                    {
                        Suppliers = await _dbContext.Supplier.ToListAsync();
                    }));
            }
            catch (Exception e)
            {
                _logger.LogError(e, e.Message);
            }
        }

        private async Task OpenAddProductDialog()
        {
            try
            {
                await DialogHost.Show(new ProductAddEditControl(), "RootDialog",
                    new DialogClosingEventHandler(async (sender, args) =>
                    {
                        Products = await _dbContext.Product.ToListAsync();
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
                    if (ProductOption.Id == Guid.Empty)
                    {
                        ProductOption.Id = Guid.NewGuid();
                        ProductOption.Stock = ProductOption.OriginStock;
                        ProductOptions.Add(ProductOption);
                    }
                    else
                    {
                        var option = ProductOptions.First(x => x.ProductId == ProductOption.ProductId);
                        ProductOption.Stock = ProductOption.OriginStock;
                        ProductOptions.Remove(option);
                        ProductOptions.Add(ProductOption);
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
            ProductOption = new ProductOption();
            TotalPrice = ProductOptions.Sum(x => x.OriginStock * x.SupplyPrice);
        }

        private void RemoveProductInvoice(object selectedItems)
        {
            try
            {
                var list = (IList)selectedItems;
                var options = list.Cast<ProductOption>().ToList();
                foreach (var option in options)
                {
                    ProductOptions.Remove(option);
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
                if (IsValidSupplierInvoiceFunc.Invoke())
                {
                    if (ProductOptions.Any())
                    {
                        var currentUser = (User)App.Current.Properties["USER"];
                        SupplierInvoice.Id = Guid.NewGuid();
                        SupplierInvoice.CreatingUserId = currentUser.Id;
                        SupplierInvoice.ImportDate = ImportDate.Value.Date;
                        if (ImportTime != null)
                        {
                            SupplierInvoice.ImportDate = SupplierInvoice.ImportDate.AddHours(ImportTime.Value.Hour).AddMinutes(ImportTime.Value.Minute);
                        }
                        SupplierInvoice.ProductOptions = ProductOptions.ToList();
                        foreach (var option in SupplierInvoice.ProductOptions)
                        {
                            option.SupplierInvoiceId = SupplierInvoice.Id;
                            option.CreatedDate = SupplierInvoice.ImportDate;
                        }
                        _dbContext.SupplierInvoice.Add(SupplierInvoice);
                        await _dbContext.SaveChangesAsync();
                        await DialogHost.Show(new InfoDialogControl(
                                $"Đã tạo hóa đơn nhập kho vào lúc {SupplierInvoice.ImportDate:HH:mm} ngày {SupplierInvoice.ImportDate:dd/MM/yyyy}.",
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
            SupplierInvoice = new SupplierInvoice();
            ProductOptions = new ObservableCollection<ProductOption>();
            ImportDate = DateTime.Now;
            ImportTime = DateTime.Now;
            ClearProduct();
        }
    }
}