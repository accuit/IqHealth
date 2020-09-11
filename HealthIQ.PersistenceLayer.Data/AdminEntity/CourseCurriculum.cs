using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("CourseCurriculum")]
    public class CourseCurriculum
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public int CourseMasterID { get; set; }

        public int? SubCourcesID { get; set; }
    }
}
