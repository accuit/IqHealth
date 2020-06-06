using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using HealthIQ.BusinessLayer.Services.BO;
using HealthIQ.PresentationLayer.AdminApp.Core;

namespace HealthIQ.PresentationLayer.AdminApp.CustomFilter
{
    public class UserAccessRules
    {
        public int UserId { get; set; }
        public bool IsAdmin { get; set; }
        public string LoginName { get; set; }
        private List<UserRoleBO> Roles = new List<UserRoleBO>();
        private UserProfileBO profile = new UserProfileBO();

        public UserAccessRules(string _username)
        {
            this.LoginName = _username;
            this.IsAdmin = false;
            GetDatabaseUserRolesPermissions();
        }

        private void GetDatabaseUserRolesPermissions()
        {
            //Get user roles and permissions from database tables...  
            profile = HttpContext.Current.Session[PageConstants.SESSION_PROFILE_KEY] as UserProfileBO;
            if (profile != null)
            {
                IsAdmin = profile.IsAdmin;
                LoginName = profile.LoginName;
                UserId = profile.UserID;
            }
        }

        public List<int> HasPermission(int module)
        {
            IList<SecurityAspectBO> permissions = HttpContext.Current.Session[PageConstants.SESSION_PERMISSIONS] as List<SecurityAspectBO>;
            if (permissions != null && permissions.Any(x=>x.ModuleCode == module))
            {
                List<int> permissionIds = permissions.Select(x => x.PermissionID).ToList();
                //var adminPerm = permissions.FirstOrDefault(k => k.ModuleCode == (int)module && k.PermissionID == (int)AspectEnums.RolePermissionEnums.CRUD);
                return permissionIds;
            }
            else
            {
                return null;
            }
             
        }

        public bool HasRole(int roleID)
        {
            if (profile.RoleID == roleID)
            { return true; }
            else
            { return false; }

        }

        public bool HasRoles(string roles)
        {
            bool bFound = false;
            string[] _roles = roles.Split(',');
            foreach (UserRoleBO role in this.Roles)
            {
                try
                {
                    // bFound = _roles.Contains(role.RoleID);
                    if (bFound)
                        return bFound;
                }
                catch (Exception)
                {
                }
            }
            return bFound;
        }
    }
}