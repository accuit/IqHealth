namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StudentInvoice")]
    public partial class StudentInvoice
    {
        public StudentInvoice()
        {
            InvoiceItems = new HashSet<InvoiceItems>();

        }
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }
        public decimal SubTotal { get; set; }
        public decimal? Tax { get; set; }
        public int Status { get; set; }
        public DateTime InvoiceDate { get; set; }
        public int PaymentStatus { get; set; }
        public int Paymentmode { get; set; }
        public string CopyEmail { get; set; }
        public string Mobile { get; set; }
        [StringLength(500)]
        public string Address { get; set; }
        public int City { get; set; }
        public int State { get; set; }
        public int Country { get; set; }
        public string Pin { get; set; }
        public int UserID { get; set; }
        public int? CourseID { get; set; }

        [ForeignKey("UserID")]
        public virtual UserMaster User { get; set; }
        public virtual IEnumerable<InvoiceItems> InvoiceItems { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int CreatedBy { get; set; }
        public int? ModifiedBy { get; set; }
        public int CompanyID { get; set; }
    }
}
