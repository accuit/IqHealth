using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("EmailService")]
    public class EmailService
    {
        public long EmailServiceID { get; set; }

        public int TemplateID { get; set; }

        [Required]
        [StringLength(150)]
        public string FromEmail { get; set; }

        [Required]
        [StringLength(150)]
        public string ToName { get; set; }

        [Required]
        [StringLength(250)]
        public string ToEmail { get; set; }

        [StringLength(250)]
        public string CcEmail { get; set; }

        [StringLength(250)]
        public string BccEmail { get; set; }

        [Required]
        [StringLength(500)]
        public string Subject { get; set; }

        [Required]
        public string Body { get; set; }

        public bool IsHtml { get; set; }

        public int Priority { get; set; }

        public int Status { get; set; }

        public bool IsAttachment { get; set; }

        public DateTime CreatedDate { get; set; }

        [StringLength(50)]
        public string AttachmentFileName { get; set; }

        [StringLength(250)]
        public string Remarks { get; set; }

        public int? TemplateCode { get; set; }
    }
}
