using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    public class UserReport
    {
        public int ID { get; set; }

        public int UserID { get; set; }

        [Required]
        [StringLength(50)]
        public string FileName { get; set; }

        [StringLength(1000)]
        public string FilePath { get; set; }

        public int? FileType { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? UploadedDate { get; set; }

        public int UploadedBy { get; set; }

        public int IsDeleted { get; set; }

        public int CompanyID { get; set; }
    }
}
