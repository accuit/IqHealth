﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace HealthIQ.PresentationLayer.AdminApp.CustomFilters
{
    public class AuthorizePageAttribute: System.Web.Http.AuthorizeAttribute
    {
        //private readonly string _roleID;

        //public AuthorizePageAttribute( string paramRole)
        //{
        //    _roleID = paramRole.ToString();
        //}


        // 401 (Unauthorized) - indicates that the request has not been applied because it lacks valid 
        // authentication credentials for the target resource.
        // 403 (Forbidden) - when the user is authenticated but isn’t authorized to perform the requested 
        // operation on the given resource.
        protected override void HandleUnauthorizedRequest(System.Web.Http.Controllers.HttpActionContext actionContext)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                base.HandleUnauthorizedRequest(actionContext);
            }
            else
            {
                actionContext.Response = new System.Net.Http.HttpResponseMessage(System.Net.HttpStatusCode.Forbidden);
            }
        }
    }
}