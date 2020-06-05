using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HealthIQ.PresentationLayer.AdminApp.Startup))]
namespace HealthIQ.PresentationLayer.AdminApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }

    }
}