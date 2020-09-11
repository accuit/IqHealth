using System.ComponentModel.DataAnnotations;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class InvoiceItemsDTO
    {

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

        public  StudentInvoiceDTO StudentInvoice { get; set; }
    }
}
