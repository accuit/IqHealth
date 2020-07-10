using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.HIQControllers
{

    [RoutePrefix("api/bookings")]
    public class BookingController : ApiController
    {
        private readonly HIQAdminEntities _context;

        public BookingController()
        {
            _context = new HIQAdminEntities();
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
        public JsonResponse<int> AddBooking(BookingMaster booking)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            if (!ModelState.IsValid)
            {
                
                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            try
            {
                booking.CreatedDate = DateTime.Now;
                booking.IsDeleted = 0;
                _context.BookingMasters.Add(booking);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    response.StatusCode = "200";
                    response.Message = "Your medical test has been booked successfully. We will send you email shortly.";
                    response.SingleResult = booking.ID;
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
            response.IsSuccess = true;
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
                response.FailedValidations = ModelState.Keys.ToArray();
                response.StatusCode = "200";
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }

            try
            {
                appointment.CreatedDate = DateTime.Now;
                appointment.IsDeleted = 0;
                appointment.Status = 1;
                _context.DoctorAppointments.Add(appointment);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;
                response.StatusCode = "200";
                response.Message = "Your appointment is fixed successfully.";

            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
            }

            response.SingleResult = appointment.ID;
            return response;
        }

    }
}
