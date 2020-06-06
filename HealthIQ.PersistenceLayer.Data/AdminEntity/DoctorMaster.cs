namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DoctorMaster")]
    public partial class DoctorMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? DateOfBirth { get; set; }

        public int Experience { get; set; }

        [StringLength(250)]
        public string Specialist { get; set; }

        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [StringLength(150)]
        public string Hospital { get; set; }

        [StringLength(250)]
        public string Designation { get; set; }

        public int Sequence { get; set; }

        [StringLength(500)]
        public string About { get; set; }

        [StringLength(1000)]
        public string LogoUrl { get; set; }

        public int IsDeleted { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        [StringLength(45)]
        public string RegistrationNo { get; set; }

        public int SpecialityID { get; set; }

        public int? HospitalID { get; set; }

        public int? CompanyID { get; set; }
    }
}
