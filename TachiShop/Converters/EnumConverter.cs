using System;
using System.Globalization;
using System.Windows.Data;
using TachiShop.Models.Constants;

namespace TachiShop.Converters
{
    public class EnumConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var mode = parameter as string;
            try
            {
                switch (mode.ToUpperInvariant())
                {
                    case "PRODUCTSTATUS":
                    {
                        int status = (int)value;
                        return Constant.ProductStatuses[status];
                    }
                    case "PRODUCTUNIT":
                    {
                        int unit = (int)value;
                        return Constant.ProductUnits[unit];
                    }
                    case "GENDER":
                    {
                        int gender = (int)value;
                        return Constant.Genders[gender];
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return "ERROR";
            }

            return "";
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}