using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.AopContainer;
using HealthIQ.CommonLayer.Aspects;

namespace HealthIQ.PresentationLayer.AdminApp.CustomFilters
{
    public class BaseAuthenticationAttribute : AuthorizationFilterAttribute
    {
        #region Private Properties


        private IUserService userBusinessInstance;

        public IUserService UserBusinessInstance
        {
            get
            {
                if (userBusinessInstance == null)
                {
                    userBusinessInstance = AopEngine.Resolve<IUserService>(AspectEnums.AspectInstanceNames.UserManager, AspectEnums.ApplicationName.HealthIQ);
                }
                return userBusinessInstance;
            }
        }

        private ISecurityService securityBusinessInstance;
        public ISecurityService SecurityBusinessInstance
        {
            get
            {
                if (securityBusinessInstance == null)
                {
                    securityBusinessInstance = AopEngine.Resolve<ISecurityService>(AspectEnums.AspectInstanceNames.SecurityManager, AspectEnums.ApplicationName.HealthIQ);
                }
                return securityBusinessInstance;
            }
        }

        #endregion

        private const string Realm = "HIQRealm";
        public override void OnAuthorization(HttpActionContext actionContext)
        {
            if (string.IsNullOrEmpty(actionContext.Request.Headers.Authorization?.Parameter))
            {
                actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized);
                if (actionContext.Response.StatusCode == HttpStatusCode.Unauthorized)
                {
                    actionContext.Response.Headers.Add("WWW-Authenticate", string.Format("Basic realm=\"{0}\"", Realm));
                }
            }
            else
            {
                string authenticationToken = actionContext.Request.Headers.Authorization.Parameter;
                string decodedAuthenticationToken = Encoding.UTF8.GetString(Convert.FromBase64String(authenticationToken));
                string[] usernamePasswordArray = decodedAuthenticationToken.Split(':');
                string username = usernamePasswordArray[0];
                string password = usernamePasswordArray[1];
                var user = UserBusinessInstance.UserLogin(username, password);
                if (user != null)
                {
                    var identity = new GenericIdentity(username);
                    identity.AddClaim(new Claim("Email", user.Email));
                    identity.AddClaim(new Claim(ClaimTypes.Name, user.FirstName + " " + user.LastName));
                    identity.AddClaim(new Claim("ID", Convert.ToString(user.UserID)));

                    var userRoles = user.UserRoles;
                    IPrincipal principal = new GenericPrincipal(identity, userRoles.Select(x => x.RoleMaster.Name).ToArray());
                    Thread.CurrentPrincipal = principal;
                    if (HttpContext.Current != null)
                    {
                        HttpContext.Current.User = principal;
                    }
                }
                else
                {
                    actionContext.Response = actionContext.Request
                        .CreateResponse(HttpStatusCode.Unauthorized);
                }
            }
        }
    }
}