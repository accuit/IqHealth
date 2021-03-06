using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("PackageCategory")]
    public class PackageCategory
    {
        public int ID { get; set; }

        [Required]
        [StringLength(255)]
        public string Name { get; set; }

        [Required]
        [StringLength(255)]
        public string Title { get; set; }

        [StringLength(500)]
        public string SubTitle { get; set; }

        [StringLength(1005)]
        public string ImageUrl { get; set; }

        [StringLength(1500)]
        public string About { get; set; }

        public int IsDeleted { get; set; }

        public int? CompanyID { get; set; }
    }
}
