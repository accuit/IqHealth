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
    [RoutePrefix("api/doctors")]
    public class DoctorsController : ApiController
    {
        private readonly IqHealthDBContext _context;

        public DoctorsController()
        {
            _context = new IqHealthDBContext();
        }

        [HttpGet()]
        [Route("data")]
        public IHttpActionResult GetServices()
        {
            var services = new List<Doctor>();
            services = _context.Doctor.Where(x => x.IsDeleted == false).ToList();
            if (services != null)
                return Ok(services);
            else
                return NotFound();
        }

        [HttpPut]
        [ResponseType(typeof(Doctor))]
        [Route("submit", Name = "SubmitDoctor")]
        public IHttpActionResult SubmitDoctor(Doctor doc)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            string message = "";
            var docs = _context.Doctor.Where(x => x.ID == doc.ID).FirstOrDefault();
            if (docs == null)
            {
                if (!isDuplicateDocName(doc.FirstName, doc.LastName))
                {
                    _context.Doctor.Add(doc);
                    return Content(HttpStatusCode.OK, "Service with this Name already exists. Try different name.");
                }
                message = "Doctor details successfully added.";
            }
            else
            {
                docs.FirstName = doc.LastName;
                docs.LastName = doc.LastName;
                docs.ImageUrl = doc.ImageUrl;
                docs.Email = doc.Email;
                docs.Mobile = doc.Mobile;
                docs.Designation = doc.Designation;
                docs.Experience = doc.Experience;
                docs.Specialist = doc.Specialist;
                docs.Hospital = doc.Hospital;
                docs.LogoUrl = doc.LogoUrl;
                docs.RegistrationNo = doc.RegistrationNo;
                docs.IsDeleted = doc.IsDeleted;
                docs.UpdatedDate = DateTime.Now;
                _context.Entry(docs).State = EntityState.Modified;
                message = "Doctor details successfully updated.";
            }

            _context.SaveChanges();
            return Ok(doc);
        }

        private bool isDuplicateDocName(string FirstName, string LastName)
        {
            int count = _context.Doctor.Where(x => x.FirstName == FirstName && x.LastName == LastName).ToList().Count();
            if (count > 1)
                return true;
            else
                return false;

        }

        [HttpGet]
        [Route("delete/{id}")]
        public IHttpActionResult DeleteDoctor(int Id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var doctor = _context.Doctor.Where(x => x.ID == Id).FirstOrDefault();
            if (doctor != null)
            {
                doctor.IsDeleted = true;
                _context.Entry(doctor).State = EntityState.Modified;
                _context.SaveChanges();
                return Ok(true);
            }

            return Content(HttpStatusCode.OK, "No service found.");
        }

    }
}
