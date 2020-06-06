namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CourseMaster")]
    public partial class CourseMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [Required]
        [StringLength(1500)]
        public string About { get; set; }

        public int IsDeleted { get; set; }

        public int CompanyID { get; set; }

        [Required]
        [StringLength(500)]
        public string Qualification { get; set; }

        public int MinAge { get; set; }

        public int MaxAge { get; set; }

        public int? Duration { get; set; }

        [StringLength(500)]
        public string Certification { get; set; }

        public int? InternshipDuration { get; set; }

        [Required]
        [StringLength(1000)]
        public string ImageUrl { get; set; }
    }
}
