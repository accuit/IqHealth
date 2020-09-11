using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("CourseEligibility")]
    public class CourseEligibility
    {
        public int ID { get; set; }

        [Required]
        [StringLength(500)]
        public string Qualification { get; set; }

        public int MinAge { get; set; }

        public int MaxAge { get; set; }

        public int? Duration { get; set; }

        [StringLength(500)]
        public string Certification { get; set; }

        public int? InternshipDuration { get; set; }

        public int? CourseMasterID { get; set; }

        public int IsDeleted { get; set; }
    }
}
