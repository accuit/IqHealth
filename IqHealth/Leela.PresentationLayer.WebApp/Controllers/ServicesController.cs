using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using Leela.PresentationLayer.WebApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace Leela.PresentationLayer.WebApp.Controllers
{
    public class ServicesController : Controller
    {
        private readonly IqHealthDBContext _context;
        //private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public ServicesController()
        {
            _context = new IqHealthDBContext();
        }

        [OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = true)]
        [Route("diagnostic-services")]
        public ActionResult Index()
        {
            List<HealthServiceMaster> services = new List<HealthServiceMaster>();
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
            }

            return View(services);
        }

        [OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        [Route("diagnostic-service/{id}/{name}-diagnostic-service")]
        public ActionResult Details(int id = 1, string name = "Service Details")
        {

            ServicesViewModel model = new ServicesViewModel();

            model.services = new List<HealthServiceMaster>();
            try
            {
                model.services = _context.HealthServiceMasters.Where(x => x.IsDeleted == 0).ToList();
                model.service = model.services.Where(x => x.ID == id).FirstOrDefault();
                if (model.services.Count > 0)
                {
                    model.service.ServicesInclList = new List<string>();
                    if (!string.IsNullOrEmpty(model.service.ServicesIncluded))
                    {
                        foreach (var i in model.service.ServicesIncluded.Split(','))
                            model.service.ServicesInclList.Add(i.Trim(' '));
                    }
                }

            }
            catch (Exception ex)
            {
            }

            ViewBag.ID = id;
            return View(model);
        }

        [OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = true)]
        [Route("health-packages")]
        public ActionResult Packages()
        {
            List<PackageCategory> packages = new List<PackageCategory>();
            packages = _context.PackageCategories.Where(x => x.IsDeleted == 0).ToList();
            return View("Packages", packages);
        }

        [OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        [Route("{name}-health-packages/{id}")]
        public ActionResult PackageDetails(int id)
        {
            PackageCategory package = _context.PackageCategories.Include("PackageMasters").Where(x => x.ID == id).First();
            return View("PackageDetails", package);
        }

        [OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = true)]
        [Route("doctors")]
        public ActionResult Speciality()
        {
            List<SpecialityMaster> specialities = new List<SpecialityMaster>();
            specialities = _context.SpecialityMasters.Where(x => x.IsDeleted == 0).ToList();
            return View(specialities);
        }

        [OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = true)]
        [Route("{speciality}-doctors/{id}")]
        public ActionResult Doctors(int id)
        {
            List<DoctorMaster> doctors = new List<DoctorMaster>();
            doctors = _context.DoctorMasters.Where(x => x.IsDeleted == 0 && x.SpecialityID == id).ToList();
            return View(doctors);
        }
    }
}