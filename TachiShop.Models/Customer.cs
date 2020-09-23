using System;
using System.ComponentModel.DataAnnotations.Schema;
using TachiShop.Models.Constants;

namespace TachiShop.Models
{
    public class Customer
    {
        public Guid Id { get; set; }

        public string FullName { get; set; }

        public DateTime? BirthDate { get; set; }

        public int Gender { get; set; } = -1;

        public string PhoneNumber { get; set; }

        public string Address { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        public Guid? CreatingUserId { get; set; }

        public User CreatingUser { get; set; }

        public DateTime? ModifiedDate { get; set; } = DateTime.Now;

        public Guid? ModifyingUserId { get; set; }

        public User ModifyingUser { get; set; }

        [NotMapped]
        public string DisplayValue =>
            $"{FullName} - {(BirthDate == null ? "?" : BirthDate.Value.Year + "")}";
    }
}