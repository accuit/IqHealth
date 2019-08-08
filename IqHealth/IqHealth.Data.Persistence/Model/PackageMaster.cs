namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PackageMaster")]
    public partial class PackageMaster
    {
        //[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        //public PackageMaster()
        //{
        //    BookingTestPackages = new HashSet<BookingTestPackage>();
        //    TestMasters = new HashSet<TestMaster>();
        //}

        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(255)]
        public string Title { get; set; }

        [StringLength(500)]
        public string SubTitle { get; set; }

        [StringLength(1000)]
        public string About { get; set; }

        public decimal Cost { get; set; }

        public int? Status { get; set; }

        public int CatgID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public DateTime? UpdatedDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingTestPackage> BookingTestPackages { get; set; }

        public virtual PackageCategory PackageCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TestMaster> TestMasters { get; set; }
    }
}
