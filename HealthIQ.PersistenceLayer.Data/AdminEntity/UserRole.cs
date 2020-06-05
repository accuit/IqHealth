namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class UserRole
    {
        public int UserRoleID { get; set; }

        public int RoleID { get; set; }

        public int? UserID { get; set; }

        public bool IsActive { get; set; }

        public bool isDeleted { get; set; }

        public int CreatedBy { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public virtual RoleMaster RoleMaster { get; set; }

        public virtual UserMaster UserMaster { get; set; }
    }
}
