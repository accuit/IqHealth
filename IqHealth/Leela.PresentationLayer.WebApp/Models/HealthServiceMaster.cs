namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HealthServiceMaster")]
    public partial class HealthServiceMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HealthServiceMaster()
        {
            ServiceQuestions = new HashSet<ServiceQuestion>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public string Description { get; set; }

        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [StringLength(1000)]
        public string PageUrl { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Type { get; set; }

        [StringLength(1000)]
        public string ServicesIncluded { get; set; }

        public int? CompanyID { get; set; }

        [StringLength(5)]
        public string ServiceCode { get; set; }

        [StringLength(150)]
        public string Title { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiceQuestion> ServiceQuestions { get; set; }

        [NotMapped]
        public List<string> ServicesInclList { get; set; }

    }
}
