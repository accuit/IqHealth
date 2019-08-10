using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.DTO
{
    public class EmailNotification
    {
        public long EmailServiceID { get; set; }
        public int TemplateID { get; set; }
        public string FromEmail { get; set; }
        public string FromName { get; set; }
        public string ToName { get; set; }
        public string ToEmail { get; set; }
        public string CcEmail { get; set; }
        public string BccEmail { get; set; }
        [Required]
        [StringLength(150, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        public string Subject { get; set; }
        public string Body { get; set; }
        public bool IsHtml { get; set; }
        public int Priority { get; set; }
        public int Status { get; set; }
        public bool IsAttachment { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public string AttachmentFileName { get; set; }
        public string Remarks { get; set; }

        [StringLength(15, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 0)]
        public string Phone { get; set; }

        [StringLength(15, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 0)]
        public string Mobile { get; set; }

        [Required]
        [StringLength(500, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 10)]
        public string Message { get; set; }
        public bool IsCustomerCopy { get; set; }
    }
}
