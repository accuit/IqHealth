namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class InvoiceItem
    {
        public int ID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        public decimal Cost { get; set; }

        public decimal? Tax { get; set; }

        public int? Type { get; set; }

        public int? TypeID { get; set; }

        [StringLength(10)]
        public string TypeText { get; set; }

        public int Status { get; set; }

        public int? InvoiceID { get; set; }

        public bool IsDeleted { get; set; }

        [StringLength(250)]
        public string Description { get; set; }

        public int? Quantity { get; set; }

        public virtual StudentInvoice StudentInvoice { get; set; }
    }
}
