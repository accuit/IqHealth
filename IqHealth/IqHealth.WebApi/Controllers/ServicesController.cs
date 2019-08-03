using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

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
        [Route("data")]
        public IHttpActionResult GetServices()
        {
            var services = new List<HealthServices>();
            services = _context.HealthServices.Where(x => x.IsDeleted == false).ToList();
            if (services != null)
            {
                foreach (var item in services)
                {
                    item.ServicesInclList = new List<string>();
                    if (!string.IsNullOrEmpty(item.ServicesIncluded))
                        foreach (var i in item.ServicesIncluded.Split(','))
                            item.ServicesInclList.Add(i.Trim(' '));
                }
                return Ok(services);
            }
            else
                return NotFound();
        }

        [HttpPut]
        [ResponseType(typeof(HealthServices))]
        [Route("submit", Name = "SubmitService")]
        public IHttpActionResult SubmitService(HealthServices service)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var serv = _context.HealthServices.Where(x => x.ID == service.ID).FirstOrDefault();
            if (serv == null)
            {
                if (!isDuplicateName(service.Name))
                {
                    _context.HealthServices.Add(service);
                    return Ok("Service with this Name already exists. Try different name.");
                }
            }
            else
            {
                serv.Name = service.Name;
                serv.Description = service.Description;
                serv.ImageUrl = service.ImageUrl;
                serv.PageUrl = service.PageUrl;
                serv.Type = service.Type;
                serv.ServicesIncluded = service.ServicesIncluded;
                serv.Type = service.Type;
                serv.UpdatedDate = DateTime.Now;
                _context.Entry(serv).State = EntityState.Modified;
            }

            _context.SaveChanges();
            return Ok(service);
        }

        private bool isDuplicateName(string name)
        {
            int count = _context.HealthServices.Where(x => x.Name == name).ToList().Count();
            if (count > 1)
                return true;
            else
                return false;

        }

        [HttpGet]
        [Route("delete/{id}")]
        public IHttpActionResult DeleteService(int Id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var service = _context.HealthServices.Where(x => x.ID == Id).FirstOrDefault();
            if (service != null)
            {
                service.IsDeleted = true;
                _context.Entry(service).State = EntityState.Modified;
                _context.SaveChanges();
                return Ok(true);
            }

            return Content(HttpStatusCode.NoContent, "No service found.");
        }

    }
}
