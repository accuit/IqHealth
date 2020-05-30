namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CommonSetup")]
    public partial class CommonSetup
    {
        [Key]
        [Column(Order = 0)]
        public int ID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string MainType { get; set; }

        [StringLength(50)]
        public string SubType { get; set; }

        [StringLength(150)]
        public string DisplayText { get; set; }

        public int? DisplayValue { get; set; }

        public int? ParentID { get; set; }

        public int? isDeleted { get; set; }

        public int? CompanyID { get; set; }
    }
}
