using System;
using System.Globalization;
using System.Windows.Controls;

namespace TachiShop.ValidationRules
{
    public class GuidValidationRule : ValidationRule
    {
        public bool Required { get; set; } = true;

        public string RequiredMessage { get; set; } = "Trường bắt buộc";

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if ((value == null || (Guid)value == Guid.Empty) && Required)
            {
                return new ValidationResult(false, RequiredMessage);
            }

            return ValidationResult.ValidResult;
        }
    }
}