using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Windows.Data;
using TachiShop.Models;
using TachiShop.Models.Constants;

namespace TachiShop.Converters
{
    public class CollectionConverter : IValueConverter
    {

        public CollectionConverter()
        {
        }


        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value != null)
            {
                try
                {
                    var mode = parameter as string;
                    switch (mode.ToUpperInvariant())
                    {
                        case "PRODUCTCATEGORIES":
                            {
                                var categories = value as List<Category>;
                                return string.Join(", ", categories.Select(x => x.Name).ToList());
                            }
                        case "PRODUCTORIGINSTOCK":
                            {
                                var options = value as List<ProductOption>;
                                if (!options.Any())
                                {
                                    return "Chưa nhập";
                                }
                                var group = options.GroupBy(x => x.Unit).ToDictionary(x => x.Key, x => x.Sum(o => o.OriginStock));
                                var result = "";
                                foreach (var unit in group.Keys)
                                {
                                    string unitStr = Constant.ProductUnits[unit];

                                    result += $"{group[unit]:#,##0.##} {unitStr}, ";
                                }

                                return result.Remove(result.Length - 2);
                            }
                        case "PRODUCTSTOCK":
                        {
                            var options = value as List<ProductOption>;
                            if (!options.Any())
                            {
                                return "Chưa nhập";
                            }
                            var group = options.GroupBy(x => x.Unit).ToDictionary(x => x.Key, x => x.Sum(o => o.Stock));
                            var result = "";
                            foreach (var unit in group.Keys)
                            {
                                string unitStr = Constant.ProductUnits[unit];

                                result += $"{group[unit]:#,##0.##} {unitStr}, ";
                            }

                            return result.Remove(result.Length - 2);
                        }
                        case "TOTALSUPPLYPRICE":
                            {
                                var options = value as List<ProductOption>;
                                var totalPrice = options.Sum(x => x.OriginStock * x.SupplyPrice);
                                return $"{totalPrice:#,##0.##}";
                            }
                        case "PRODUCTOPTIONS":
                            {
                                var options = value as List<ProductOption>;
                                return string.Join(", ", options.Select(x => x.Product.Name));
                            }
                        case "INVOICEPRODUCTS":
                            {
                                var invoiceProducts = value as List<InvoiceProduct>;
                                return string.Join(", ", invoiceProducts.Select(x => x.ProductOption.Product.Name).Distinct());
                            }
                        case "TOTALPRICE":
                            {
                                var invoiceProducts = value as List<InvoiceProduct>;
                                var totalPrice = invoiceProducts.Sum(x => x.Amount * x.Price);
                                return $"{totalPrice:#,##0.##}";
                            }
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    return "ERROR";
                }
            }
            return "";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}