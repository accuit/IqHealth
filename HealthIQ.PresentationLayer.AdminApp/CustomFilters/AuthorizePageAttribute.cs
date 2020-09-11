using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;

namespace HealthIQ.PresentationLayer.AdminApp.CustomFilters
{
    public class AuthorizePageAttribute: AuthorizeAttribute
    {
        private readonly string _roleID;

        public AuthorizePageAttribute(string roles)
        {
            _roleID = roles;
        }

        public AuthorizePageAttribute() : base()
        {
        }

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