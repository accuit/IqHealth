using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    public class UserSystemSetting
    {
        [Key]
        public long UserSystemID { get; set; }

        public int UserID { get; set; }

        public bool IsAPKLoggingEnabled { get; set; }

        public bool IsCoverageException { get; set; }

        public DateTime CreatedDate { get; set; }

        public long CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public long? ModifiedBy { get; set; }

        public bool IsDeleted { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CoverageExceptionWindow { get; set; }

        public virtual UserMaster UserMaster { get; set; }
    }
}
