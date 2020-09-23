using System.Globalization;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;

namespace TachiShop.ValidationRules
{
    public class PasswordValidationRule : ValidationRule
    {
        public string RequiredMessage { get; set; } = "Vui lòng nhập mật khẩu";

        public string EqualMessage { get; set; } = "Mật khẩu không khớp";

        public string NotEqualMessage { get; set; } = "Mật khẩu không được trùng";

        public PasswordWrapper Wrapper { get; set; }

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var password = value?.ToString();
            if (string.IsNullOrWhiteSpace(password))
            {
                return new ValidationResult(false, RequiredMessage);
            }

            if (password.Contains(" "))
            {
                return new ValidationResult(false, "Mật khẩu không được chứa khoảng trắng");
            }

            if (password.Length < 6)
            {
                return new ValidationResult(false, "Mật khẩu phải chứa ít nhất 6 ký tự");
            }

            if (Wrapper?.Equal != null && password != Wrapper.Equal)
            {
                return new ValidationResult(false, EqualMessage);
            }

            if (Wrapper?.NotEqual != null && password == Wrapper.NotEqual)
            {
                return new ValidationResult(false, NotEqualMessage);
            }

            return ValidationResult.ValidResult;
        }

    }

    public class PasswordWrapper : DependencyObject
    {
        public static readonly DependencyProperty EqualProperty = DependencyProperty
            .Register("Equal", typeof(string), typeof(PasswordWrapper), new FrameworkPropertyMetadata(null));

        public static readonly DependencyProperty NotEqualProperty = DependencyProperty
            .Register("NotEqual", typeof(string), typeof(PasswordWrapper), new FrameworkPropertyMetadata(null));

        public string Equal
        {
            get => GetValue(EqualProperty)?.ToString();
            set => SetValue(EqualProperty, value);
        }
        public string NotEqual
        {
            get => GetValue(NotEqualProperty)?.ToString();
            set => SetValue(NotEqualProperty, value);
        }
    }
}