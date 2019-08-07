using IqHealth.Data.Persistence;
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
        [ResponseType(typeof(BookingMaster))]
        [Route("add", Name = "AddBooking")]
        public IHttpActionResult AddBooking(BookingMaster appointment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.BookingMasters.Add(appointment);
            _context.SaveChanges();
            return Ok(appointment.ID);
        }


    }
}
