

namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [Table("CourseMaster")]
    [DataContract]
    public partial class CourseMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CourseMaster()
        {
            CourseCurriculums = new HashSet<CourseCurriculum>();
            SubCourses = new HashSet<SubCourses>();
        }

        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [DataMember]
        [Required]
        [StringLength(1500)]
        public string About { get; set; }

        [DataMember]
        [Required]
        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [DataMember]
        public int IsDeleted { get; set; }

        [DataMember]
        public int CompanyID { get; set; }

        [Required]
        [StringLength(500)]
        public string Qualification { get; set; }

        [DataMember]
        public int MinAge { get; set; }

        [DataMember]
        public int MaxAge { get; set; }

        [DataMember]
        public int? Duration { get; set; }

        [StringLength(500)]
        public string Certification { get; set; }

        [DataMember]
        public int? InternshipDuration { get; set; }

        public virtual CompanyMaster CompanyMaster { get; set; }

        [DataMember]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseCurriculum> CourseCurriculums { get; set; }

        [DataMember]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubCourses> SubCourses { get; set; }
    }
}
