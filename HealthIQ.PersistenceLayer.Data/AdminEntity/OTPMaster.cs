namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OTPMaster")]
    public partial class OTPMaster
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
