using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Security.Claims;

namespace TachiShop.Models
{
    public class User
    {
        public Guid Id { get; set; }

        public string UserName { get; set; }

        public string Password { get; set; }

        public string FullName { get; set; }

        public DateTime? BirthDate { get; set; }

        public int Gender { get; set; } = -1;

        public string PhoneNumber { get; set; }

        public string Email { get; set; }

        public string Address { get; set; }

        public DateTime CreatedDate { get; set; } = DateTime.Now;

        [ForeignKey(nameof(CreatingUser))]
        public Guid? CreatingUserId { get; set; }

        public User CreatingUser { get; set; }

        public DateTime? ModifiedDate { get; set; } = DateTime.Now;

        [ForeignKey(nameof(ModifyingUser))]
        public Guid? ModifyingUserId { get; set; }

        public User ModifyingUser { get; set; }

        [NotMapped]
        public string DisplayValue => $"{FullName} - {UserName}";
    }
}
