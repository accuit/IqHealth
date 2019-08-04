namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HealthServiceMaster")]
    public partial class HealthServiceMaster
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(5000)]
        public string Description { get; set; }

        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [StringLength(1000)]
        public string PageUrl { get; set; }

        //public DateTime? CreatedDate { get; set; }

        //public DateTime? UpdatedDate { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IsDeleted { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Type { get; set; }

        [StringLength(1000)]
        public string ServicesIncluded { get; set; }

        [NotMapped]
        public List<string> ServicesInclList { get; set; }
    }
}
