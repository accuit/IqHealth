namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("InvoiceItems")]
    public partial class InvoiceItems
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }
        public decimal Cost { get; set; }
        public decimal? Tax { get; set; }
        public int ItemType { get; set; }
        public int TypeID { get; set; }

        [StringLength(50)]
        public string TypeText { get; set; }
        public int InvoiceID { get; set; }

        [ForeignKey("ID")]
        public virtual StudentInvoice StudentInvoice { get; set; }

    }
}
