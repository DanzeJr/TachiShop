using System;
using System.Globalization;
using System.Windows.Controls;

namespace TachiShop.ValidationRules
{
    public class DateTimeValidationRule : ValidationRule
    {
        public bool Required { get; set; } = true;

        public string RequiredMessage { get; set; } = "Vui lòng nhập ngày";

        public bool IsIncluded { get; set; } = true;

        public DateTime? Min { get; set; }

        public DateTime? Max { get; set; }

        public string RangeMessage { get; set; } = "Vui lòng nhập ngày khả dụng";

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (value == null && Required)
            {
                return new ValidationResult(false, RequiredMessage);
            }
            var actualValue = (DateTime)value;
            if (IsIncluded)
            {
                if ((Min != null && actualValue < Min) || (Max != null && actualValue > Max))
                {
                    return new ValidationResult(false, string.Format(RangeMessage, Min, Max));
                }
            }
            else
            {
                if ((Min != null && actualValue <= Min) || (Max != null && actualValue >= Max))
                {
                    return new ValidationResult(false, string.Format(RangeMessage, Min, Max));
                }
            }

            return ValidationResult.ValidResult;
        }
    }
}