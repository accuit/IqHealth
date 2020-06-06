using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    [RoutePrefix("api/dashboard")]
    public class DashboardController : BaseAPIController
    {
        [Route("get")]
        public IList<string> Get()
        {
            return  new string[] { "student1", "student2" };
        }
    }
}
