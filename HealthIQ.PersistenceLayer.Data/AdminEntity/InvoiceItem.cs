using System.ComponentModel.DataAnnotations;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    public class InvoiceItem
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
