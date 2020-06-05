namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TestMaster")]
    public partial class TestMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        public int Type { get; set; }

        [StringLength(500)]
        public string PreTestInfo { get; set; }

        public int ResultInHours { get; set; }

        [StringLength(150)]
        public string Components { get; set; }

        [Column(TypeName = "numeric")]
        public decimal Cost { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UpdatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int? PackageID { get; set; }

        public int CompanyID { get; set; }
    }
}
