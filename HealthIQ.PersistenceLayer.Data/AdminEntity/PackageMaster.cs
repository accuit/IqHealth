namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PackageMaster")]
    public partial class PackageMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(255)]
        public string Title { get; set; }

        [StringLength(500)]
        public string SubTitle { get; set; }

        [StringLength(1000)]
        public string About { get; set; }

        [Column(TypeName = "numeric")]
        public decimal Cost { get; set; }

        public int? Status { get; set; }

        public int CatgID { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        [StringLength(1005)]
        public string ImageUrl { get; set; }

        public int CompanyID { get; set; }

        public int? Sequence { get; set; }
    }
}
