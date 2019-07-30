using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/services")]
    public class ServicesController : ApiController
    {
        private readonly IqHealthDBContext _context;

        public ServicesController()
        {
            _context = new IqHealthDBContext();
        }

        [HttpGet()]
        [Route("health-services")]
        public IHttpActionResult UserLogin()
        {
            var services = new List<HealthServices>();
            services = _context.HealthServices.Where(x => x.IsDeleted == false).ToList();
            if (services != null)
                return Ok(services);
            else
                return NotFound();
        }

    }
}
