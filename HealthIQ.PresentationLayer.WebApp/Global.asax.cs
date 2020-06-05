using HealthIQ.CommonLayer.AOPRegistrations;
using System.Web.Http;
using System.Web.Mvc;

namespace MVC_Ecommerce
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            UnityRegistration.InitializeAopContainer();
            _ = log4net.Config.XmlConfigurator.Configure();
        }
    }
}
