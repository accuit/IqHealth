using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class PermissionsDTO
    {
        public int PermissionID { get; set; }

        [Required]
        [StringLength(150)]
        public string PermissionValue { get; set; }
    }

    public partial class UserRoleModulePermissionDTO
    {
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

        public virtual RoleModuleDTO RoleModule { get; set; }
    }

}
