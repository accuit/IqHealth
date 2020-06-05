namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoginAttemptHistory")]
    public partial class LoginAttemptHistory
    {
        [Key]
        public long LoginAttemptID { get; set; }

        public int? FailedAttempt { get; set; }

        public int UserID { get; set; }

        public DateTime? LoginDate { get; set; }

        public DateTime? LastLoginDate { get; set; }

        [StringLength(30)]
        public string Lattitude { get; set; }

        [StringLength(30)]
        public string Longitude { get; set; }

        [StringLength(30)]
        public string IpAddress { get; set; }

        [StringLength(30)]
        public string Browser { get; set; }

        public virtual UserMaster UserMaster { get; set; }
    }
}
