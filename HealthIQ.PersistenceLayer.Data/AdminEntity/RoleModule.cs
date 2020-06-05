namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RoleModule")]
    public partial class RoleModule
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RoleModule()
        {
            UserRoleModulePermissions = new HashSet<UserRoleModulePermission>();
        }

        public int RoleModuleID { get; set; }

        public int RoleID { get; set; }

        public int ModuleID { get; set; }

        public int Sequence { get; set; }

        public bool IsMandatory { get; set; }

        public bool IsDeleted { get; set; }

        public int CreatedBy { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public virtual ModuleMaster ModuleMaster { get; set; }

        public virtual RoleMaster RoleMaster { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserRoleModulePermission> UserRoleModulePermissions { get; set; }
    }
}
