using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("CommonSetup")]
    public class CommonSetup
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string MainType { get; set; }

        [StringLength(50)]
        public string SubType { get; set; }

        [StringLength(150)]
        public string DisplayText { get; set; }

        public int? DisplayValue { get; set; }

        public int? ParentID { get; set; }

        public int? isDeleted { get; set; }

        public int? CompanyID { get; set; }
    }
}
