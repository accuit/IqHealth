using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("OTPMaster")]
    public class OTPMaster
    {
        public long OTPMasterID { get; set; }

        public int UserID { get; set; }

        [Required]
        [StringLength(10)]
        public string OTP { get; set; }

        [StringLength(150)]
        public string GUID { get; set; }

        public DateTime CreatedDate { get; set; }

        public int? Attempts { get; set; }
    }
}
