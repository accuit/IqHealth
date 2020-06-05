namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CompanyMaster")]
    public partial class CompanyMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(145)]
        public string Name { get; set; }

        [StringLength(1000)]
        public string LogoUrl { get; set; }

        [Required]
        [StringLength(150)]
        public string SecondryEmail { get; set; }

        [Required]
        [StringLength(150)]
        public string PrimaryEmail { get; set; }

        [StringLength(500)]
        public string Address { get; set; }

        [StringLength(1000)]
        public string BannerUrl { get; set; }

        [StringLength(1000)]
        public string About { get; set; }

        [StringLength(1000)]
        public string MapUrl { get; set; }
    }
}
