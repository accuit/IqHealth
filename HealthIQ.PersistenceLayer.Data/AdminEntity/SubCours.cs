using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("SubCourses")]
    public class SubCourse
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public int Duration { get; set; }

        [StringLength(250)]
        public string MinQualification { get; set; }

        public int MinAge { get; set; }

        public int? MaxAge { get; set; }

        [Column(TypeName = "numeric")]
        public decimal IndianAdmissionFee { get; set; }

        [Column(TypeName = "numeric")]
        public decimal ForeignAdmissionFee { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? IndianOtherFee { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? ForeignOtherFee { get; set; }

        public int CourseMasterID { get; set; }

        public int CompanyID { get; set; }
    }
}
