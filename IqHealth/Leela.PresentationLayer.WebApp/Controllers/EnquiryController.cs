using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace Leela.PresentationLayer.WebApp.Controllers
{
    public class EnquiryController : Controller
    {
        private readonly IqHealthDBContext _context;
        //private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public EnquiryController()
        {
            _context = new IqHealthDBContext();
        }
        [Route("doctor-appointment")]
        [HttpGet]
        public ActionResult DoctorAppointment()
        {
            ViewBag.Message = string.Empty;
            ViewBag.docsList = GetAllDocsList();
            return View();
        }

        [Route("doctor-appointment")]
        [HttpPost]
        public ActionResult DoctorAppointment(DoctorAppointment appointment)
        {

            ViewBag.docsList = GetAllDocsList();
            appointment.CreatedDate = DateTime.Now;
            appointment.IsDeleted = 0;
            appointment.Status = 1;
            appointment.CompanyID = 1;
            try
            {
                _context.DoctorAppointments.Add(appointment);
                bool isSuccess = _context.SaveChanges() > 0 ? true : false;
                if (isSuccess)
                {
                    ViewBag.Message = "Appointment created Successfully.";
                    ViewBag.ShowMsg = true;
                }
                else
                {
                    ViewBag.Message = "Something went wrong. Please try again later.";
                    ViewBag.ShowMsg = true;
                }
            }
            catch (DbEntityValidationException ex)
            {
                StringBuilder msg = new StringBuilder();
                ex.EntityValidationErrors.ToList().ForEach(x => x.ValidationErrors.ToList().ForEach(y => { msg.Append(y.PropertyName).Append(", "); }));
                ViewBag.Message = string.Format("Kindly check {0}. These fields are missing or in incorrect format.", msg);
                return View(appointment);
            }
            catch (Exception ex)
            {
                ViewBag.Message = "An error occured. Please try again later.";
                ViewBag.ShowMsg = true;
                return View(appointment);
            }
            return View();
        }

        [Route("book-a-test")]
        public ActionResult BookATest()
        {
            ViewBag.Message = string.Empty;
            ViewBag.packages = GetAllPackagesList();
            return View();
        }

        [Route("book-a-test")]
        [HttpPost]
        public ActionResult BookATest(BookingMaster appointment)
        {

            ViewBag.packages = GetAllPackagesList();

            appointment.CreatedDate = DateTime.Now;
            appointment.IsDeleted = 0;
            appointment.Status = 1;
            appointment.CompanyID = 1;
            try
            {
                _context.BookingMasters.Add(appointment);
                bool isSuccess = _context.SaveChanges() > 0 ? true : false;
                if (isSuccess)
                {
                    ViewBag.Message = "Appointment created Successfully.";
                    ViewBag.ShowMsg = true;
                }
                else
                {
                    ViewBag.Message = "Something went wrong. Please try again later.";
                    ViewBag.ShowMsg = true;
                }
            }
            catch (DbEntityValidationException ex)
            {
                StringBuilder msg = new StringBuilder();
                ex.EntityValidationErrors.ToList().ForEach(x => x.ValidationErrors.ToList().ForEach(y => { msg.Append(y.PropertyName).Append(", "); }));
                ViewBag.Message = string.Format("Kindly check {0}. These fields are missing or in incorrect format.", msg);
                return View(appointment);
            }
            catch (Exception ex)
            {
                ViewBag.Message = "An error occured. Please try again later.";
                ViewBag.ShowMsg = true;
                return View(appointment);
            }

            return View();
        }

        public IEnumerable<SelectListItem> GetAllDocsList()
        {
            var doctors = _context.DoctorMasters.Where(x => x.IsDeleted == 0).ToList();
            List<SelectListItem> docsListItem = new List<SelectListItem>();
            //docsListItem.Add(new SelectListItem() { Text = "--Please select doctor--", Value = "" });
            foreach (var doc in doctors)
            {
                docsListItem.Add(new SelectListItem() { Text = doc.FirstName + " " + doc.LastName, Value = doc.ID.ToString() });
            }

            return docsListItem;
        }

        public IEnumerable<SelectListItem> GetAllPackagesList()
        {
            var doctors = _context.PackageMasters.Where(x => x.IsDeleted == 0).ToList();
            List<SelectListItem> docsListItem = new List<SelectListItem>();
            //docsListItem.Add(new SelectListItem() { Text = "--Please select package--", Value = "0" });
            foreach (var doc in doctors)
            {
                docsListItem.Add(new SelectListItem() { Text = doc.Name, Value = doc.ID.ToString() });
            }

            return docsListItem;
        }

    }
}