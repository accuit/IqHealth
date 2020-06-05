using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public partial class UserMasterDTO
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string FirstName { get; set; }

        [StringLength(50)]
        public string LastName { get; set; }

        public string ImageUrl { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateOfBirth { get; set; }

        public int? BloodGroup { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        public int? State { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserStatus { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime CreatedDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IsDeleted { get; set; }

        [StringLength(20)]
        public string Password { get; set; }

        public string ConfirmPassword { get; set; }

        [StringLength(15)]
        public string Mobile { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserType { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CompanyID { get; set; }
    }
}
