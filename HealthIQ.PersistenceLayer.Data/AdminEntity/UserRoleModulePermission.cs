namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserRoleModulePermission")]
    public partial class UserRoleModulePermission
    {
        [Key]
        public long UserRolePermissionID { get; set; }

        public int? RoleModuleID { get; set; }

        public int? UserID { get; set; }

        public int? ModuleID { get; set; }

        public int PermissionID { get; set; }

        [Required]
        [StringLength(150)]
        public string PermissionValue { get; set; }

        public int CreatedBy { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public virtual RoleModule RoleModule { get; set; }
    }
}
