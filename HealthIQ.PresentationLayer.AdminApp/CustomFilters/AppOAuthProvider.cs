using HealthIQ.BusinessLayer.Services;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.AopContainer;
using HealthIQ.CommonLayer.Aspects;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;

namespace HealthIQ.PresentationLayer.AdminApp.CustomFilters
{
    /// <summary>
    /// Application OAUTH Provider class.
    /// </summary>
    public class AppOAuthProvider : OAuthAuthorizationServerProvider
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

        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        #region Grant resource owner credentials override method.
        public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {

            string username = context.UserName;
            string password = context.Password;
            var user = UserBusinessInstance.UserLogin(username, password);

            if (user != null)
            {
                var identity = new ClaimsIdentity(context.Options.AuthenticationType);
                identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.UserID.ToString()));
                identity.AddClaim(new Claim(ClaimTypes.Email, user.Email));
                identity.AddClaim(new Claim(ClaimTypes.Name, user.FirstName + " " + user.LastName));
                identity.AddClaim(new Claim("LoggedOn", DateTime.Now.ToString()));
                var userRoles = SecurityBusinessInstance.GetUserRoles(user.UserID);
                foreach (var role in userRoles)
                {
                    identity.AddClaim(new Claim(ClaimTypes.Role, role.RoleName));
                }
                var additionalData = new AuthenticationProperties(new Dictionary<string, string>{
                    {
                        "role", Newtonsoft.Json.JsonConvert.SerializeObject(userRoles)
                    }
                });
                var token = new AuthenticationTicket(identity, additionalData);
                context.Validated(token);
            }
            else
                return;

            //// Initialization.
            //var claims = new List<Claim>();
            //claims.Add(new Claim(ClaimTypes.Name, user.FirstName + " " + user.LastName));
            //claims.Add(new Claim(ClaimTypes.Email, user.Email));
            //claims.Add(new Claim(ClaimTypes.MobilePhone, user.Mobile));
            //claims.Add(new Claim(ClaimTypes.Role, user.Email));
            //// Setting Claim Identities for OAUTH 2 protocol.
            //ClaimsIdentity oAuthClaimIdentity = new ClaimsIdentity(claims, OAuthDefaults.AuthenticationType);
            //ClaimsIdentity cookiesClaimIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationType);

            //// Setting user authentication.
            //AuthenticationProperties properties = CreateProperties(user.Email);
            //AuthenticationTicket ticket = new AuthenticationTicket(oAuthClaimIdentity, properties);

            //// Grant access to authorize user.
            //context.Validated(ticket);
            //context.Request.Context.Authentication.SignIn(cookiesClaimIdentity);
        }

        #endregion

        #region Token endpoint override method.
        public override Task TokenEndpoint(OAuthTokenEndpointContext context)
        {
            foreach (KeyValuePair<string, string> property in context.Properties.Dictionary)
            {
                // Adding.
                context.AdditionalResponseParameters.Add(property.Key, property.Value);
            }

            // Return info.
            return Task.FromResult<object>(null);
        }

        #endregion
    }
}