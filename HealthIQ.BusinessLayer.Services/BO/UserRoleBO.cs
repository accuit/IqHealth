using HealthIQ.BusinessLayer.Services.BO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.BusinessLayer.Services.BO
{
    public class UserRoleBO
    {
        public byte UserRoleID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<byte> RoleID { get; set; }
        public Nullable<bool> IsDeleted { get; set; }

        public virtual RoleMasterBO RoleMaster { get; set; }
        public virtual UserMasterBO UserMaster { get; set; }
    }
}
