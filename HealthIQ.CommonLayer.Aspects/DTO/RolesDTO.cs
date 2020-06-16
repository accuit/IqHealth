using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class RoleMasterDTO
    {

        public int RoleID { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        [StringLength(50)]
        public string Code { get; set; }

        public int? Type { get; set; }

        public int Status { get; set; }

        public bool IsAdmin { get; set; }

        public bool IsDeleted { get; set; }

        [StringLength(250)]
        public string RoleDescription { get; set; }

        public int CreatedBy { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public  List<RoleModuleDTO> RoleModules { get; set; }

        public  List<UserRoleDTO> UserRoles { get; set; }
    }

    public  class UserRoleDTO
    {
        public int UserRoleID { get; set; }

        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public string RoleCode { get; set; }
        public int? UserID { get; set; }

        public bool IsActive { get; set; }

        public bool isDeleted { get; set; }

        public int CreatedBy { get; set; }

        public int? ModifiedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public  RoleMasterDTO RoleMaster { get; set; }

        public  UserMasterDTO UserMaster { get; set; }
    }

    public  class RoleModuleDTO
    {
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

        public virtual ModuleMasterDTO ModuleMaster { get; set; }

        public virtual RoleMasterDTO RoleMaster { get; set; }

        public virtual List<UserRoleModulePermissionDTO> UserRoleModulePermissions { get; set; }
    }

}
