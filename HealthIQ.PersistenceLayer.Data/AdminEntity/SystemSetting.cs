namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SystemSetting
    {
        [Key]
        public int SettingID { get; set; }

        public int CompanyID { get; set; }

        public int LogoutTime { get; set; }

        public int LoginFailedAttempt { get; set; }

        public int MaxLeaveMarkDays { get; set; }

        [StringLength(50)]
        public string WeeklyOffDays { get; set; }

        public DateTime CreatedDate { get; set; }

        public long CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public long? ModifiedBy { get; set; }

        public int IdleSystemDay { get; set; }
    }
}
