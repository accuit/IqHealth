namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DoctorAppointment")]
    public partial class DoctorAppointment
    {
        public int ID { get; set; }

        [Required]
        [StringLength(45)]
        public string Name { get; set; }

        public int Age { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        public int Sex { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? BookingDate { get; set; }

        [StringLength(50)]
        public string BookingTime { get; set; }

        public int? DoctorID { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        public int? HospitalID { get; set; }

        public int? CompanyID { get; set; }
    }
}
