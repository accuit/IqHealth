using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("DailyLoginHistory")]
    public class DailyLoginHistory
    {
        [Key]
        public long DailyLoginID { get; set; }

        public int? UserID { get; set; }

        public int? CustomerID { get; set; }

        [StringLength(200)]
        public string SessionID { get; set; }

        [StringLength(50)]
        public string IpAddress { get; set; }

        [StringLength(30)]
        public string BrowserName { get; set; }

        public int? LoginType { get; set; }

        public DateTime? LogOutTime { get; set; }

        public DateTime? LoginTime { get; set; }

        public bool IsLogin { get; set; }

        [StringLength(50)]
        public string ApkDeviceName { get; set; }

        [StringLength(7)]
        public string APKVersion { get; set; }

        [StringLength(50)]
        public string Lattitude { get; set; }

        [StringLength(50)]
        public string Longitude { get; set; }
    }
}
