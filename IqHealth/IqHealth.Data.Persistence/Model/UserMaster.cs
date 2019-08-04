namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserMaster")]
    public partial class UserMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [Required]
        [StringLength(150)]
        public string Email { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public int? BloodGroup { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        public int? State { get; set; }

        public int UserStatus { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public int IsDeleted { get; set; }

        [Required]
        [StringLength(20)]
        public string Password { get; set; }

        [StringLength(15)]
        public string Mobile { get; set; }
    }
}
