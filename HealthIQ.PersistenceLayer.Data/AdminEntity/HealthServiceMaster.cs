using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("HealthServiceMaster")]
    public class HealthServiceMaster
    {
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
    }
}
