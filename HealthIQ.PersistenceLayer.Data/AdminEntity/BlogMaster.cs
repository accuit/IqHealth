using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("BlogMaster")]
    public class BlogMaster
    {
        [SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BlogMaster()
        {
            BlogCategoryMappings = new HashSet<BlogCategoryMapping>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [Required]
        [StringLength(250)]
        public string Title { get; set; }

        [StringLength(500)]
        public string SubTitle { get; set; }

        public DateTime PostDate { get; set; }

        public string BannerImage { get; set; }

        public string ThumbImage { get; set; }

        public int Sequence { get; set; }

        public string Content { get; set; }

        public string Tags { get; set; }

        public bool IsLive { get; set; }

        public bool IsDeleted { get; set; }

        public int CreatedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public int? CompanyID { get; set; }

        [SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BlogCategoryMapping> BlogCategoryMappings { get; set; }
    }
}
