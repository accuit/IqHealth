namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CompanyMaster")]
    public partial class CompanyMaster
    {
        [Key]
        [Column(Order = 0)]
        public int ID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(145)]
        public string Name { get; set; }

        [StringLength(1000)]
        public string LogoUrl { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(150)]
        public string SecondryEmail { get; set; }

        [Key]
        [Column(Order = 3)]
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
