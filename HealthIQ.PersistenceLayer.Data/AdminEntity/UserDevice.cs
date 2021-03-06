using System;
using System.ComponentModel.DataAnnotations;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    public class UserDevice
    {
        public int UserDeviceID { get; set; }

        public int UserID { get; set; }

        [StringLength(50)]
        public string IMEINumber { get; set; }

        [StringLength(150)]
        public string LoginName { get; set; }

        [StringLength(100)]
        public string SenderKey { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreatedDate { get; set; }

        public long CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public long? ModifiedBy { get; set; }

        public bool IsDeleted { get; set; }
    }
}
