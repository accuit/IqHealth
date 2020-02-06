using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;
using System.Runtime.Serialization;

namespace IqHealth.Data.Persistence.Model
{
    [Table("CompanyMaster")]
    [DataContract]
    public partial class CompanyMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CompanyMaster()
        {
            DoctorMasters = new HashSet<DoctorMaster>();
            CourseMasters = new HashSet<CourseMaster>();
            PackageMasters = new HashSet<PackageMaster>();
            PackageCategories = new HashSet<PackageCategory>();
            SpecialityMasters = new HashSet<SpecialityMaster>();
            SubCourses = new HashSet<SubCourses>();
            //TestMasters = new HashSet<TestMaster>();
            UserMasters = new HashSet<UserMaster>();
        }

        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(145)]
        public string Name { get; set; }

        public string PhoneNumber { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string LogoUrl { get; set; }

        [DataMember]
        public string PrimaryEmail { get; set; }

        [DataMember]
        [StringLength(500)]
        public string Address { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string BannerUrl { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string About { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string MapUrl { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorMaster> DoctorMasters { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseMaster> CourseMasters { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PackageMaster> PackageMasters { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PackageCategory> PackageCategories { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SpecialityMaster> SpecialityMasters { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubCourses> SubCourses { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<TestMaster> TestMasters { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserMaster> UserMasters { get; set; }
    }
}
