namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [DataContract]
    [Table("SpecialityMaster")]
    public partial class SpecialityMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SpecialityMaster()
        {
            DoctorMasters = new HashSet<DoctorMaster>();
            DoctorSpecialities = new HashSet<DoctorSpeciality>();
        }

        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(145)]
        public string Speciality { get; set; }

        [DataMember]
        [StringLength(245)]
        public string Title { get; set; }

        public int IsDeleted { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string ImageUrl { get; set; }


        [DataMember]
        [StringLength(1000)]
        public string LogoUrl { get; set; }

        [DataMember]
        public int CompanyID { get; set; }

        public virtual CompanyMaster CompanyMaster { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorMaster> DoctorMasters { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorSpeciality> DoctorSpecialities { get; set; }
    }
}
