namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ModuleMaster")]
    public partial class ModuleMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ModuleMaster()
        {
            RoleModules = new HashSet<RoleModule>();
        }

        [Key]
        public int ModuleID { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        public int? ParentModuleID { get; set; }

        public int? ModuleCode { get; set; }

        public bool IsMobile { get; set; }

        public int Sequence { get; set; }

        public int Status { get; set; }

        public bool IsSystemModule { get; set; }

        [StringLength(200)]
        public string Icon { get; set; }

        public bool? IsStoreWise { get; set; }

        public int ModuleType { get; set; }

        [Required]
        [StringLength(250)]
        public string ModuleDescription { get; set; }

        [Required]
        [StringLength(350)]
        public string PageURL { get; set; }

        public bool? IsMandatory { get; set; }

        public bool IsDeleted { get; set; }

        public int CreatedBy { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RoleModule> RoleModules { get; set; }
    }
}
