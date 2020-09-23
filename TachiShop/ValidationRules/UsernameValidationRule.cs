using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Controls;
using Microsoft.Extensions.DependencyInjection;
using TachiShop.Repositories;

namespace TachiShop.ValidationRules
{
    public class UsernameValidationRule : ValidationRule
    {
        public bool CheckExist { get; set; } = false;

        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var username = value?.ToString();
            if (string.IsNullOrWhiteSpace(username))
            {
                return new ValidationResult(false, "Vui lòng nhập tên đăng nhập");
            }

            var regex = new Regex("^[a-zA-Z]+[a-zA-Z0-9._]*$");
            if (!regex.IsMatch(username))
            {
                return new ValidationResult(false, "Tên đăng nhập chỉ có thể bao gồm chữ, số, dấu gạch dưới và dấu chấm");
            }

            if (username.Length < 4)
            {
                return new ValidationResult(false, "Tên đăng nhập phải chứa ít nhất 4 ký tự");
            }

            if (CheckExist)
            {
                using var scope = App.ServiceProvider.CreateScope();
                var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();
                if (dbContext.User.Any(x => x.UserName == username))
                {
                    return new ValidationResult(false, "Tên đăng nhập đã tồn tại");
                }
            }

            return ValidationResult.ValidResult;
        }
    }
}