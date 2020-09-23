using System;
using System.Globalization;
using System.Threading.Tasks;
using System.Windows.Data;

namespace TachiShop.Converters
{
    public class DecimalConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var decimalValue = (decimal?)value;
            if (decimalValue == null || decimalValue == 0)
            {
                return "";
            }

            var mode = parameter as string;
            switch (mode.ToUpperInvariant())
            {
                case "PRICE":
                    {
                        return $"{decimalValue:#,##0.##}";
                    }
                case "UNIT":
                    {
                        return $"{decimalValue:#,##0.##}";
                    }
                case "PRICELONG":
                    {
                        return $"{decimalValue:#,##0.##} Đ";
                    }
            }

            return "";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            return value;
        }
    }
}