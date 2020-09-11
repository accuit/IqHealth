using System.ComponentModel.DataAnnotations;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    public class Permission
    {
        public int PermissionID { get; set; }

        [Required]
        [StringLength(150)]
        public string PermissionValue { get; set; }
    }
}
