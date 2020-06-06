using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace HealthIQ.PresentationLayer.AdminApp.CustomFilter
{
    public static class UserAccessRules_Extended
    {
        public static bool HasRole(this ControllerBase controller, int role)
        {
            bool Found = false;
            try
            {
                //Check if the requesting user has the specified role...
                Found = new UserAccessRules(controller.ControllerContext
                                     .HttpContext.User.Identity.Name).HasRole(role);
            }
            catch { }
            return Found;
        }

        public static bool HasRoles(this ControllerBase controller, string roles)
        {
            bool bFound = false;
            try
            {
                //Check if the requesting user has any of the specified roles...
                //Make sure you separate the roles using ';' (ie "Sales Manager;Sales Operator")
                bFound = new UserAccessRules(controller.ControllerContext
                                      .HttpContext.User.Identity.Name).HasRoles(roles);
            }
            catch { }
            return bFound;
        }

        public static List<int> HasPermission(this ControllerBase controller,  int modulecode)
        {
            List<int> Found = new List<int>();
            try
            {
                //Check if the requesting user has the specified application permission...
                Found = new UserAccessRules(controller.ControllerContext
                                     .HttpContext.User.Identity.Name).HasPermission(modulecode);
            }
            catch { }
            return Found;
        }

        public static bool IsSysAdmin(this ControllerBase controller)
        {
            bool IsSysAdmin = false;
            try
            {
                //Check if the requesting user has the System Administrator privilege...
                IsSysAdmin = new UserAccessRules(controller.ControllerContext
                                          .HttpContext.User.Identity.Name).IsAdmin;
            }
            catch { }
            return IsSysAdmin;
        }
    }
}