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
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public decimal Cost { get; set; }

        public int? Status { get; set; }

        
        public DateTime CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        
        public DateTime? UpdatedDate { get; set; }

        [StringLength(1000)]
        public string About { get; set; }
    }
}
