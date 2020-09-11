using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("StudentInvoice")]
    public class StudentInvoice
    {
        [SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StudentInvoice()
        {
            InvoiceItems = new HashSet<InvoiceItem>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        public DateTime InvoiceDate { get; set; }

        public decimal SubTotal { get; set; }

        public decimal Tax { get; set; }

        public int Status { get; set; }

        public int PaymentStatus { get; set; }

        public int PaymentMode { get; set; }

        [StringLength(250)]
        public string CopyEmail { get; set; }

        [Required]
        [StringLength(500)]
        public string Address { get; set; }

        public int? City { get; set; }

        public int? State { get; set; }

        [StringLength(10)]
        public string Pin { get; set; }

        public int? Country { get; set; }

        [Required]
        [StringLength(50)]
        public string Mobile { get; set; }

        public int UserID { get; set; }

        public int? CourseID { get; set; }

        public bool IsDeleted { get; set; }

        public DateTime CreatedDate { get; set; }

        public int CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public int? ModifiedBy { get; set; }

        public int CompanyId { get; set; }

        public virtual CourseMaster CourseMaster { get; set; }

        [SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InvoiceItem> InvoiceItems { get; set; }

        public virtual UserMaster UserMaster { get; set; }
    }
}
