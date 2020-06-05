namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SpecialityMaster")]
    public partial class SpecialityMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(145)]
        public string Speciality { get; set; }

        [StringLength(245)]
        public string Title { get; set; }

        public int IsDeleted { get; set; }

        [Required]
        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [StringLength(1000)]
        public string LogoUrl { get; set; }

        public int CompanyID { get; set; }
    }
}
