namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EmailTemplate")]
    public partial class EmailTemplate
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int TemplateID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public string Body { get; set; }

        [StringLength(500)]
        public string Subject { get; set; }

        public bool IsActive { get; set; }
    }
}
