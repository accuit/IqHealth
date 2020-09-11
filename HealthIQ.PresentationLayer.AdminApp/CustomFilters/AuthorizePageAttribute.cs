using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;

namespace HealthIQ.PresentationLayer.AdminApp.CustomFilters
{
    public class AuthorizePageAttribute: AuthorizeAttribute
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
        protected override void HandleUnauthorizedRequest(HttpActionContext actionContext)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                base.HandleUnauthorizedRequest(actionContext);
            }
            else
            {
                actionContext.Response = new HttpResponseMessage(HttpStatusCode.Forbidden);
            }
        }
    }
}