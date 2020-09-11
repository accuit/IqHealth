using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class CourseMasterDTO
    {
        public int ID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [Required]
        [StringLength(1500)]
        public string About { get; set; }

        public int IsDeleted { get; set; }

        public int CompanyID { get; set; }

        [Required]
        [StringLength(500)]
        public string Qualification { get; set; }

        public int MinAge { get; set; }

        public int MaxAge { get; set; }

        public int? Duration { get; set; }

        [StringLength(500)]
        public string Certification { get; set; }

        public int? InternshipDuration { get; set; }

        [Required]
        [StringLength(1000)]
        public string ImageUrl { get; set; }
        public virtual ICollection<SubCourseDTO> SubCourses { get; set; }

        public virtual ICollection<CourseCurriculumDTO> CourseCurriculum { get; set; }
        public virtual ICollection<StudentInvoiceDTO> StudentInvoices { get; set; }

    }
    public class SubCourseDTO
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

        public decimal IndianAdmissionFee { get; set; }

        public decimal ForeignAdmissionFee { get; set; }

        public decimal? IndianOtherFee { get; set; }
        public decimal? ForeignOtherFee { get; set; }

        public int CourseMasterID { get; set; }

        public int CompanyID { get; set; }
    }

    public class CourseCurriculumDTO
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public int CourseMasterID { get; set; }

        public int? SubCourcesID { get; set; }
    }

}
