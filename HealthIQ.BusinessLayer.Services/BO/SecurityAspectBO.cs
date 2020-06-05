using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.BusinessLayer.Services.BO
{
    public class SecurityAspectBO
    {
        public int PermissionID { get; set; }
        public string PermissionValue { get; set; }
        public int RoleID { get; set; }
        public int ModuleID { get; set; }
        public long UserID { get; set; }
        public long UserRolePermissionID { get; set; }
        public int ModuleCode { get; set; }
    }
}
