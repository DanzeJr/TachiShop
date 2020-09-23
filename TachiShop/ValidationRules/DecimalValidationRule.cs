using System;
using System.Globalization;
using System.Windows;
using System.Windows.Controls;

namespace TachiShop.ValidationRules
{
    public class DecimalValidationRule : ValidationRule
    {
        public bool Required { get; set; } = true;

        public string RequiredMessage { get; set; } = "Trường bắt buộc";

        public decimal? Min { get; set; }

        public decimal? Max { get; set; }

        public string RangeMessage { get; set; } = "Vui lòng nhập số trong khoảng khả dụng";

        public int DecimalPlaces { get; set; } = 2;

        public string InvalidMessage { get; set; } = "Số không hợp lệ";

        public DecimalWrapper Wrapper { get; set; }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (string.IsNullOrEmpty(value?.ToString()) && Required)
            {
                return new ValidationResult(false, RequiredMessage);
            }

            decimal actualValue;
            var decimalPlaces = Wrapper?.DecimalPlaces ?? DecimalPlaces;

            if (!decimal.TryParse(value.ToString().Trim(), out actualValue)
                || BitConverter.GetBytes(decimal.GetBits(actualValue)[3])[2] > decimalPlaces)
            {
                return new ValidationResult(false, InvalidMessage);
            }
            var min = Wrapper?.Min ?? Min;
            if (decimalPlaces == 0 && Min > 0 && Min < 1)
            {
                min = 1;
            }
            var max = Wrapper?.Max ?? Max;
            if ((min != null && actualValue < min) || (max != null && actualValue > max))
            {
                return new ValidationResult(false, string.Format(RangeMessage, Min, Max));
            }

            return ValidationResult.ValidResult;
        }
    }

    public class DecimalWrapper : DependencyObject
    {
        public static readonly DependencyProperty DecimalPlacesProperty = DependencyProperty
            .Register("DecimalPlaces", typeof(int?), typeof(DecimalWrapper), new FrameworkPropertyMetadata(null));

        public static readonly DependencyProperty MaxProperty = DependencyProperty
            .Register("Max", typeof(decimal?), typeof(DecimalWrapper), new FrameworkPropertyMetadata(null));

        public static readonly DependencyProperty MinProperty = DependencyProperty
            .Register("Min", typeof(decimal?), typeof(DecimalWrapper), new FrameworkPropertyMetadata(null));

        public int? DecimalPlaces
        {
            get => (int?)GetValue(DecimalPlacesProperty);
            set => SetValue(DecimalPlacesProperty, value == null ? null : (int?)int.Parse(value.ToString()));
        }

        public decimal? Max
        {
            get => (decimal?)GetValue(MaxProperty);
            set => SetValue(MaxProperty, value == null ? null : (decimal?)decimal.Parse(value.ToString()));
        }

        public decimal? Min
        {
            get => (decimal?)GetValue(MinProperty);
            set => SetValue(MinProperty, value);
        }
    }
}