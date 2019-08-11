namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [DataContract]
    [Table("PackageMaster")]
    public partial class PackageMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PackageMaster()
        {
            BookingMasters = new HashSet<BookingMaster>();
            //TestMasters = new HashSet<TestMaster>();
        }

        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [DataMember]
        [StringLength(255)]
        public string Title { get; set; }

        [DataMember]
        [StringLength(500)]
        public string SubTitle { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string About { get; set; }

        [DataMember]
        public decimal Cost { get; set; }

        [DataMember]
        public int? Status { get; set; }

        public int CatgID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public DateTime? UpdatedDate { get; set; }

        [DataMember]
        [StringLength(1005)]
        public string ImageUrl { get; set; }

        [DataMember]
        public List<TestMaster> TestMasters { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingMaster> BookingMasters { get; set; }

        public virtual PackageCategory PackageCategory { get; set; }

        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        //public virtual ICollection<TestMaster> TestMasters { get; set; }
    }
}
