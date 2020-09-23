using System.Collections.Generic;
using TachiShop.Models.Enums;

namespace TachiShop.Models.Constants
{
    public partial class Constant
    {
        public static readonly Dictionary<int, string> ProductStatuses = new Dictionary<int, string>
        {
            {0, "Đã xóa"},
            {1, "Khả dụng"},
            {2, "Không khả dụng"},
        };

        public static readonly Dictionary<int, string> ProductUnits = new Dictionary<int, string>
        {
            {(int)ProductUnit.Fruit, "Quả"},
            {(int)ProductUnit.Gram, "Gram"},
            {(int)ProductUnit.Kilogram, "Kilogram"},
        };

        public static readonly Dictionary<int, string> Genders = new Dictionary<int, string>
        {
            {(int)Gender.Female, "Nữ"},
            {(int)Gender.Male, "Nam"},
            {(int)Gender.Other, "Khác"},
        };
    }
}