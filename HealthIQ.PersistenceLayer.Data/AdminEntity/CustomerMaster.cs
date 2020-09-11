using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("CustomerMaster")]
    public class CustomerMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(40)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [Required]
        [StringLength(50)]
        public string Mobile { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        public bool isDeleted { get; set; }

        [StringLength(30)]
        public string Password { get; set; }

        [StringLength(1500)]
        public string ImagePath { get; set; }

        public int? AccountStatus { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public int? ModifiedBy { get; set; }

        public int CompanyId { get; set; }
    }
}
