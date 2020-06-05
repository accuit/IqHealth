using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HealthIQ.PresentationLayer.WebApp.Startup))]
namespace HealthIQ.PresentationLayer.WebApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }

    }
}