using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace IqHealth.WebApi.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/bookings")]
    public class BookingController : ApiController
    {
        private readonly IqHealthDBContext _context;

        public BookingController()
        {
            _context = new IqHealthDBContext();
        }

        [HttpPost]
        [Route("cors")]
        public IHttpActionResult TestCors()
        {
            var appointments = new List<BookingMaster>();
            appointments = _context.BookingMasters.ToList();
            return Ok(appointments);
        }

        [HttpGet()]
        [Route("data")]
        public IHttpActionResult GetBookingss()
        {
            var appointments = new List<BookingMaster>();
            appointments = _context.BookingMasters.ToList();
            if (appointments != null)
                return Ok(appointments);

            else
                return NotFound();
        }

        [HttpPost]
        [Route("search")]
        public IHttpActionResult SearchBookings(BookingMaster appointment)
        {
            var appointments = new List<BookingMaster>();
            appointments = _context.BookingMasters.Where(x => x.IsDeleted == 0).ToList();
            if (appointments != null)
            {
                if (!string.IsNullOrEmpty(appointment.Email))
                    appointments = appointments.Where(x => x.Email == appointment.Email).ToList();
                if (!string.IsNullOrEmpty(appointment.FirstName))
                    appointments = appointments.Where(x => x.FirstName == appointment.FirstName).ToList();
                if (!string.IsNullOrEmpty(appointment.LastName))
                    appointments = appointments.Where(x => x.LastName == appointment.LastName).ToList();
                if (!string.IsNullOrEmpty(appointment.Mobile))
                    appointments = appointments.Where(x => x.Mobile == appointment.Mobile).ToList();
                if (!string.IsNullOrEmpty(appointment.PinCode))
                    appointments = appointments.Where(x => x.PinCode == appointment.PinCode).ToList();
                if (appointments.Count == 0)
                    return Ok("No such bookings found.");
            }
            else
                return Ok("No booking found with data.");
            return Ok(appointments);
        }


        [HttpPost]
        [Route("add")]
        public JsonResponse<int> AddBooking(BookingMaster appointment)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            appointment.CreatedDate = DateTime.Now;
            appointment.IsDeleted = 0;

            if (!ModelState.IsValid)
            {
                response.IsSuccess = false;
                response.StatusCode = "200";
                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check field {0}. It is not in correct format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            try
            {
                _context.BookingMasters.Add(appointment);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    response.StatusCode = "200";
                    response.Message = "Your appointment is successfully fixed.";
                    response.SingleResult = appointment.ID;
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpGet]
        [Route("doctor-appointments")]
        public JsonResponse<List<DoctorAppointment>> GetDoctorAppointment()
        {
            JsonResponse<List<DoctorAppointment>> response = new JsonResponse<List<DoctorAppointment>>();

            response.SingleResult = _context.DoctorAppointments.Where(x => x.IsDeleted == 0).ToList();
            response.StatusCode = "200";
            response.Message = "Appointment records are fetched successfully.";

            return response;
        }

        [HttpPost]
        [Route("new-appointment")]
        public JsonResponse<int> AddDoctorAppointment(DoctorAppointment appointment)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            if (!ModelState.IsValid)
            {
                response.IsSuccess = false;
                response.Message = "Model validation failed.";
                return response;
            }

            _context.DoctorAppointments.Add(appointment);
            response.IsSuccess = _context.SaveChanges() > 0 ? true : false;


            if (response.IsSuccess)
            {
                response.StatusCode = "200";
                response.Message = "Data submitted successfully.";
            }
            else
            {
                response.StatusCode = "500";
                response.Message = "Something went wrong!.";
            }

            response.SingleResult = appointment.ID;
            return response;
        }

    }
}
