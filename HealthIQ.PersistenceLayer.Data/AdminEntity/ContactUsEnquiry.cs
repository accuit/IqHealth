using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("ContactUsEnquiry")]
    public class ContactUsEnquiry
    {
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [Required]
        [StringLength(150)]
        public string Email { get; set; }

        [StringLength(1000)]
        public string Message { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        public int? CompanyID { get; set; }
    }
}
