using System;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class EmailServiceDTO
    {
        public long EmailServiceID { get; set; }
        public int? TemplateID { get; set; }
        public string FromEmail { get; set; }
        public string FromName { get; set; }
        public string ToName { get; set; }
        public string ToEmail { get; set; }
        public string CcEmail { get; set; }
        public string BccEmail { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public bool IsHtml { get; set; }
        public int Priority { get; set; }
        public int Status { get; set; }
        public bool IsAttachment { get; set; }
        public string AttachmentFileName { get; set; }
        public long? CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public long? ModifyBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Remarks { get; set; }
    }
}
