using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("BookingMaster")]
    public class BookingMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(45)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(45)]
        public string LastName { get; set; }

        public int? Age { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        public int? Sex { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? BookingDate { get; set; }

        public int? CollectionType { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [StringLength(250)]
        public string Landmark { get; set; }

        [StringLength(10)]
        public string PinCode { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        public int? PackageID { get; set; }

        public int? TestID { get; set; }

        public int CompanyID { get; set; }

        [StringLength(25)]
        public string BookingTime { get; set; }
    }
}
