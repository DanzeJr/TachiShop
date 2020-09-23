using System.Globalization;
using System.Text.RegularExpressions;
using System.Windows.Controls;

namespace TachiShop.ValidationRules
{
    public class StringValidationRule : ValidationRule
    {
        public bool Required { get; set; } = true;

        public string RequiredMessage { get; set; } = "Trường bắt buộc";

        public int? MinLength { get; set; }

        public string MinLengthMessage { get; set; } = "Tối thiểu {0} ký tự";

        public int? MaxLength { get; set; }

        public string MaxLengthMessage { get; set; } = "Tối đa {0} ký tự";

        public string Regex { get; set; }

        public string RegexMessage { get; set; } = "Không đúng định dạng";

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var actualValue = value?.ToString();
            if (string.IsNullOrWhiteSpace(actualValue))
            {
                if (Required)
                {
                    return new ValidationResult(false, RequiredMessage);
                }
            }
            else
            {
                if (Regex != null)
                {
                    var r = new Regex(Regex);
                    if (!r.IsMatch(actualValue))
                    {
                        return new ValidationResult(false, RegexMessage);
                    }
                }

                if (MinLength != null && actualValue.Length < MinLength)
                {
                    return new ValidationResult(false, string.Format(MinLengthMessage, MinLength));
                }

                if (MaxLength != null && actualValue.Length > MaxLength)
                {
                    return new ValidationResult(false, string.Format(MaxLengthMessage, MaxLength));
                }
            }

            return ValidationResult.ValidResult;
        }
    }
}