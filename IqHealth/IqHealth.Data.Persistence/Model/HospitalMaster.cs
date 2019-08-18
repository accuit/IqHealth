namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [DataContract]
    [Table("HospitalMaster")]
    public partial class HospitalMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HospitalMaster()
        {
            DoctorMasters = new HashSet<DoctorMaster>();
        }

        [DataMember]
        public int ID { get; set; }

        [Required]
        [StringLength(245)]
        public string Name { get; set; }

        public int Type { get; set; }

        [StringLength(245)]
        public string Address { get; set; }

        public int City { get; set; }

        public int? State { get; set; }

        [StringLength(10)]
        public string PinCode { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorMaster> DoctorMasters { get; set; }
    }
}
