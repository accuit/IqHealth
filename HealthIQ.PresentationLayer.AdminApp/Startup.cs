using System;
using System.Threading.Tasks;
using Microsoft.Owin;
using Owin;
using Microsoft.Owin.Cors;
using Microsoft.Owin.Security.OAuth;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;
using System.Web.Http;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Owin.Security.Jwt;
using Microsoft.Owin.Security;
using HealthIQ.CommonLayer.Aspects.Utilities;
using HealthIQ.CommonLayer.Aspects;
using System.Configuration;

[assembly: OwinStartup(typeof(HealthIQ.PresentationLayer.AdminApp.Startup))]
namespace HealthIQ.PresentationLayer.AdminApp
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            _ = app.UseJwtBearerAuthentication(
                new JwtBearerAuthenticationOptions
                {
                    AuthenticationMode = AuthenticationMode.Active,
                    TokenValidationParameters = new TokenValidationParameters()
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = "https://health-iq.in", //some string, normally web url,  
                        ValidAudience = "https://health-iq.in",
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(AppUtil.GetAppSettings(AspectEnums.ConfigKeys.JWTSecretKey)))
                    }
                });
        }
    }
}