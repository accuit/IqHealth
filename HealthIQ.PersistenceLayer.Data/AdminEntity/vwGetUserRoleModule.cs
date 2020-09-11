using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("vwGetUserRoleModule")]
    public class vwGetUserRoleModule
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ModuleID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(150)]
        public string Name { get; set; }

        public int? ParentModuleID { get; set; }

        public int? UserID { get; set; }

        public DateTime? MaxModifiedDate { get; set; }

        public bool? IsMandatory { get; set; }

        public int? ModuleCode { get; set; }

        [StringLength(200)]
        public string Icon { get; set; }

        public bool? IsStoreWise { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Sequence { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(350)]
        public string PageURL { get; set; }

        [Key]
        [Column(Order = 4)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ModuleType { get; set; }

        [Key]
        [Column(Order = 5)]
        public bool IsMobile { get; set; }

        [Key]
        [Column(Order = 6)]
        public bool IsDeleted { get; set; }
    }
}
