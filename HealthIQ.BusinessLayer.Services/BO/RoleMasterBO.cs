using System;
using System.Collections.Generic;

namespace HealthIQ.BusinessLayer.Services.BO
{
    public class RoleMasterBO
    {
        public byte RoleID { get; set; }
        public string RollName { get; set; }
        public string RollType { get; set; }
        public string RollDescription { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? CreatedOn { get; set; }

        public virtual UserMasterBO UserMaster { get; set; }
        public virtual ICollection<UserRoleBO> UserRoles { get; set; }
    }
}
