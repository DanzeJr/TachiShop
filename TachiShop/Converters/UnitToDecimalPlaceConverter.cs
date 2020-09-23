using System;
using System.Globalization;
using System.Windows.Data;

namespace TachiShop.Converters
{
    public class UnitToDecimalPlaceConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null)
            {
                return 0;
            }

            var unit = int.Parse(value.ToString());
            switch (unit)
            {
                case 0:
                {
                    return 0;
                }
                case 1:
                case 2:
                {
                    return 2;
                }
            }

            return 0;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}