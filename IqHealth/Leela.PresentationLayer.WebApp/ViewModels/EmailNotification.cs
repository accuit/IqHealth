using System;
using System.ComponentModel.DataAnnotations;

namespace Leela.PresentationLayer.WebApp.ViewModels
{
    public class EmailModel
    {
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
        public string Mobile { get; set; }
        public string Phone { get; set; }
        public int Age { get; set; }
        public int Sex { get; set; }
        public DateTime BookingDate { get; set; }
        public DateTime CreatedDate { get; set; }

        public string CompanyID { get; set; }
    }

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
