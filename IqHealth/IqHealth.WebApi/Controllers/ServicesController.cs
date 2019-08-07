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
            var services = new List<HealthServiceMaster>();
            services = _context.HealthServiceMasters.Where(x => x.IsDeleted == 0).ToList();
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

        [HttpGet()]
        [Route("all-tests", Name = "GetAllTests")]
        public IHttpActionResult GetAllTests()
        {
            var tests = new List<TestMaster>();
            tests = _context.TestMasters.Where(x => x.IsDeleted == 0).ToList();
            if (tests != null)
            {
                return Ok(tests);
            }
            else
                return Ok("No tests found.");
        }

        [HttpGet()]
        [Route("all-packages", Name = "GetAllPackages")]
        public IHttpActionResult GetAllPackages()
        {
            var tests = new List<PackageMaster>();
            tests = _context.PackageMasters.Where(x => x.IsDeleted == 0).ToList();
            if (tests != null)
            {
                return Ok(tests);
            }
            else
                return Ok("No package found.");
        }

        [HttpPost]
        [ResponseType(typeof(HealthServiceMaster))]
        [Route("submit", Name = "SubmitService")]
        public IHttpActionResult SubmitService(HealthServiceMaster service)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var serv = _context.HealthServiceMasters.Where(x => x.ID == service.ID).FirstOrDefault();
            if (serv == null)
            {
                if (!isDuplicateName(service.Name))
                {
                    _context.HealthServiceMasters.Add(service);
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
            int count = _context.HealthServiceMasters.Where(x => x.Name == name).ToList().Count();
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

            var service = _context.HealthServiceMasters.Where(x => x.ID == Id).FirstOrDefault();
            if (service != null)
            {
                service.IsDeleted = 1;
                _context.Entry(service).State = EntityState.Modified;
                _context.SaveChanges();
                return Ok(true);
            }

            return Content(HttpStatusCode.NoContent, "No service found.");
        }

        [HttpGet]
        [Route("tests")]
        public IHttpActionResult GetAppointments()
        {
            var appointments = new List<TestMaster>();
            appointments = _context.TestMasters.ToList();
            if (appointments != null)
                return Ok(appointments);

            else
                return NotFound();
        }

    }
}
