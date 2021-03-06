namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [Table("TestMaster")]
    [DataContract]
    public partial class TestMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TestMaster()
        {
            BookingMasters = new HashSet<BookingMaster>();
        }

        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [DataMember]
        public int Type { get; set; }

        [DataMember]
        [StringLength(500)]
        public string PreTestInfo { get; set; }

        [DataMember]
        public int ResultInHours { get; set; }

        [DataMember]
        [StringLength(150)]
        public string Components { get; set; }

        [DataMember]
        public decimal Cost { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public int IsDeleted { get; set; }

        [DataMember]
        public int? PackageID { get; set; }

        [DataMember]
        [ForeignKey("CompanyMaster")]
        public int CompanyID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingMaster> BookingMasters { get; set; }

        public virtual CompanyMaster CompanyMaster { get; set; }

        public virtual PackageMaster PackageMaster { get; set; }
    }
}
