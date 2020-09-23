using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace TachiShop.Models
{
    public class Supplier
    {
        public Guid Id { get; set; }

        public string Name { get; set; }

        public string Address { get; set; }

        public string PhoneNumber { get; set; }

        public DateTime CreatedDate { get; set; }

        public Guid CreatingUserId { get; set; }

        public User CreatingUser { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public Guid? ModifyingUserId { get; set; }

        public User ModifyingUser { get; set; }

        [NotMapped]
        public string DisplayValue => $"{Name} - {(PhoneNumber ?? "?")}";
    }
}