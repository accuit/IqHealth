using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace IqHealth.Data.Persistence.Model
{
    [Table("CommonSetup")]
    public partial class CommonSetup
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string MainType { get; set; }

        [Required]
        [StringLength(50)]
        public string SubType { get; set; }

        [Required]
        [StringLength(150)]
        public string DisplayText { get; set; }

        public int DisplayValue { get; set; }

        public int? ParentID { get; set; }

        public bool? isDeleted { get; set; }
    }
}
