using HealthIQ.BusinessLayer.Services.BO;
using System;
using System.Collections.Generic;

namespace MVC_Ecommerce.ViewModels
{
    public class RolesModel
    {
        public List<RoleMasterBO> roles { get; set; }
        public List<UserRoleBO> userRoles { get; set; }
    }


}