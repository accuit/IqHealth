using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("EmailTemplate")]
    public partial class EmailTemplate
    {
        [Key]
        public int TemplateID { get; set; }
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        public string Body { get; set; }

        [Required]
        [StringLength(500)]
        public string Subject { get; set; }
        public bool IsActive { get; set; }

    }
}
