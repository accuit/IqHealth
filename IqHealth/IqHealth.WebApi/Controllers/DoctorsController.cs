using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
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
        public JsonResponse<List<DoctorMaster>> GetDoctors()
        {
            JsonResponse<List<DoctorMaster>> response = new JsonResponse<List<DoctorMaster>>();

            try
            {
                List<DoctorMaster> doctors = _context.DoctorMasters.Where(x => x.IsDeleted == 0).ToList();
                if (doctors != null)
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Data collected.";
                }
                else
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "No data available.";
                }
                response.SingleResult = doctors;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpGet]
        [Route("specialities")]
        public JsonResponse<List<SpecialityMaster>> GetSpecialities()
        {
            JsonResponse<List<SpecialityMaster>> response = new JsonResponse<List<SpecialityMaster>>();

            List<SpecialityMaster> doctors = _context.SpecialityMasters.Where(x => x.IsDeleted == 0).ToList();
            if (doctors != null)
            {
                response.StatusCode = "200";
                response.IsSuccess = true;
                response.Message = "Data collected.";
            }
            else
            {
                response.StatusCode = "500";
                response.IsSuccess = true;
                response.Message = "Something went wrong! Contact administrator.";
            }
            response.SingleResult = doctors;

            return response;
        }

        [HttpGet]
        [Route("doctor-speciality")]
        public JsonResponse<List<DoctorSpeciality>> GetDocSpeciality()
        {
            JsonResponse<List<DoctorSpeciality>> response = new JsonResponse<List<DoctorSpeciality>>();

            try
            {
                List<DoctorSpeciality> specialities = _context.DoctorSpecialities.SqlQuery("SELECT DoctorSpecialities.ID, DoctorSpecialities.SpecialityID, DoctorSpecialities.DoctorID, DoctorMaster.FirstName,  DoctorMaster.LastName, SpecialityMaster.Title  FROM DoctorSpecialities INNER JOIN DoctorMaster ON DoctorSpecialities.DoctorID = DoctorMaster.ID INNER JOIN SpecialityMaster ON DoctorSpecialities.SpecialityID = SpecialityMaster.ID ").ToList();

                if (specialities != null)
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Data collected.";
                }
                else
                {
                    response.StatusCode = "500";
                    response.IsSuccess = true;
                    response.Message = "Something went wrong! Contact administrator.";
                }
                response.SingleResult = specialities;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpGet]
        [Route("doctors-by-all-speciality")]
        public JsonResponse<List<DoctorSpeciality>> GetDocByAllSpeciality(int id)
        {
            JsonResponse<List<DoctorSpeciality>> response = new JsonResponse<List<DoctorSpeciality>>();

            try
            {
                List<DoctorSpeciality> specialities = _context.DoctorSpecialities.SqlQuery("SELECT DoctorSpecialities.ID, DoctorSpecialities.SpecialityID, DoctorSpecialities.DoctorID, DoctorMaster.FirstName,  DoctorMaster.LastName, SpecialityMaster.Title  FROM DoctorSpecialities INNER JOIN DoctorMaster ON DoctorSpecialities.DoctorID = DoctorMaster.ID INNER JOIN SpecialityMaster ON DoctorSpecialities.SpecialityID = SpecialityMaster.ID WHERE SpecialityMaster.ID = " + id).ToList();

                if (specialities != null)
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Data collected.";
                }
                else
                {
                    response.StatusCode = "500";
                    response.IsSuccess = true;
                    response.Message = "Something went wrong! Contact administrator.";
                }
                response.SingleResult = specialities;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpGet]
        [Route("doctors-by-speciality/{id}")]
        public JsonResponse<List<DoctorMaster>> GetDocBySpeciality(int id)
        {
            JsonResponse<List<DoctorMaster>> response = new JsonResponse<List<DoctorMaster>>();

            try
            {
                List<DoctorMaster> specialities = _context.DoctorMasters.Where(x => x.SpecialityID == id).ToList();
                if (specialities != null)
                    response.Message = "Doctors successfully found for this speciality.";
                else
                    response.Message = "No doctor found for this speciality.";

                response.StatusCode = "200";
                response.IsSuccess = true;
                response.SingleResult = specialities;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            return response;
        }


        [HttpPost]
        [Route("submit")]
        public JsonResponse<int> SubmitDoctor(DoctorMaster doc)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            if (!ModelState.IsValid)
            {
                response.IsSuccess = false;
                response.Message = "Model validation failed.";
                return response;
            }
            try
            {
                var docs = _context.DoctorMasters.Where(x => x.ID == doc.ID).FirstOrDefault();
                if (docs == null)
                {
                    if (!isDuplicateDocName(doc.FirstName, doc.LastName))
                    {
                        _context.DoctorMasters.Add(doc);
                        response.IsSuccess = _context.SaveChanges() > 0 ? true : false;
                        response.Message = "Your appointment with Dr. " + doc.FirstName + " is fixed.";
                    }
                }
                else
                {
                    docs.FirstName = doc.FirstName;
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
                    response.StatusCode = "200";
                    response.IsSuccess = _context.SaveChanges() > 0 ? true : false;
                    response.Message = "Your appointment with Dr. " + doc.FirstName + " is updated.";
                }
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;
                response.Message = ex.Message;
            }



            return response;
        }

        private bool isDuplicateDocName(string FirstName, string LastName)
        {
            int count = _context.DoctorMasters.Where(x => x.FirstName == FirstName && x.LastName == LastName).ToList().Count();
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

            var doctor = _context.DoctorMasters.Where(x => x.ID == Id).FirstOrDefault();
            if (doctor != null)
            {
                doctor.IsDeleted = 1;
                _context.Entry(doctor).State = EntityState.Modified;
                _context.SaveChanges();
                return Ok(true);
            }

            return Content(HttpStatusCode.OK, "No service found.");
        }

        private static List<DoctorMaster> FormatData(List<DoctorMaster> list)
        {
            List<DoctorMaster> result = new List<DoctorMaster>();

            foreach (DoctorMaster doc in list)
            {
                //doc.CreatedDateStr = doc.CreatedDate.ToShortDateString();
                //doc.DateOfBirthStr = doc.DateOfBirth.ToShortDateString();
                //doc.UpdatedDateStr = doc.UpdatedDate.ToShortDateString();
            }

            return result;
        }

    }
}
