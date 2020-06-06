namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserServiceAccess")]
    public partial class UserServiceAccess
    {
        [Key]
        public long ServiceAccessID { get; set; }

        public int UserID { get; set; }

        [StringLength(50)]
        public string APIKey { get; set; }

        [StringLength(50)]
        public string APIToken { get; set; }

        public bool IsActive { get; set; }

        public DateTime CreatedDate { get; set; }

        public long CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public long? ModifiedBy { get; set; }

        public virtual UserMaster UserMaster { get; set; }
    }
}
