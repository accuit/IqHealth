using Microsoft.Owin.Security.OAuth;
using System.Configuration;
using System.Web.Http;
using System.Web.Http.Cors;

namespace HealthIQ.PresentationLayer.AdminApp
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
           

            //bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "Y" ? true : false;
            //string CorsUrl = isDebugMode ? ConfigurationManager.AppSettings["DBugCORSUrl"] : ConfigurationManager.AppSettings["CORSUrl"];
            //var corsAttr = new EnableCorsAttribute(CorsUrl, "*", "*");
            //config.EnableCors(corsAttr);

            config.MapHttpAttributeRoutes();
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.SuppressDefaultHostAuthentication();
            config.Filters.Add(new HostAuthenticationFilter(OAuthDefaults.AuthenticationType));

            // WebAPI when dealing with JSON & JavaScript!
            // Setup json serialization to serialize classes to camel (std. Json format)
            var formatter = GlobalConfiguration.Configuration.Formatters.JsonFormatter;
            formatter.SerializerSettings.ContractResolver = new Newtonsoft.Json.Serialization.CamelCasePropertyNamesContractResolver();

            // Adding JSON type web api formatting.
            config.Formatters.Clear();
            config.Formatters.Add(formatter);
        }
    }
}
