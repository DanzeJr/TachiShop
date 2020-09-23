using System.Globalization;
using System.Windows.Controls;

namespace TachiShop.ValidationRules
{
    public class NotEmptyValidationRule : ValidationRule
    {
        public object EmptyValue { get; set; } = "";

        public string Message { get; set; } = "Trường bắt buộc";

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            if (value == null || value.ToString().Equals(EmptyValue.ToString()))
            {
                return new ValidationResult(false, Message);
            }

            return ValidationResult.ValidResult;
        }
    }
}