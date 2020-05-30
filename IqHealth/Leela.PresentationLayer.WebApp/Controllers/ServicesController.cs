using Leela.PresentationLayer.WebApp.Models;
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
        private readonly LeelaDBContext _context;
        //private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public ServicesController()
        {
            _context = new LeelaDBContext();
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
                    item.PageUrl = getPageUrl("service", item.ID, item.Name);
                    item.ImageUrl = getImageUrl("service", item.Name);
                    item.ServicesInclList = new List<string>();
                    if (!string.IsNullOrEmpty(item.ServicesIncluded))
                        foreach (var i in item.ServicesIncluded.Split(','))
                            item.ServicesInclList.Add(i.Trim(' '));
                }
            }

            return View(services);
        }

        //[OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        [Route("{name}-diagnostic-service/{id}")]
        public ActionResult Details(int id = 1, string name = "Service Details")
        {
            ServicesViewModel model = new ServicesViewModel();
            model.services = new List<HealthServiceMaster>();
            try
            {
                model.services = _context.HealthServiceMasters.Where(x => x.IsDeleted == 0).ToList();
                foreach (var s in model.services)
                {
                    s.PageUrl = getPageUrl("service", s.ID, s.Name);
                    s.ImageUrl = getImageUrl("service", s.Name);
                }

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
                model.service.PageUrl = getPageUrl("service", model.service.ID, model.service.Name);
                model.service.ImageUrl = getImageUrl("service", model.service.Name);
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
            foreach (var item in packages)
            {
                item.PageUrl = getPageUrl("package", item.ID, item.Name);
                item.ImageUrl = getImageUrl("package", item.Name);
            }
            return View("Packages", packages);
        }

        [OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        [Route("{name}-health-packages/{id}")]
        public ActionResult PackageDetails(int id)
        {
            PackageCategory package = _context.PackageCategories.Where(x => x.ID == id).First();
            package.PageUrl = getPageUrl("package", package.ID, package.Name);
            package.ImageUrl = getImageUrl("package", package.Name);
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

        private static string getPageUrl(string type, int id, string name)
        {
            name = name.ToLower().Replace(" ", "-").Replace("&", "").Replace(" / ", "-").Replace("/", "-").ToLower();
            string url = "https://leelahealthcare.com/" + name;
            if (type == "service")
            {
                url = url + "-diagnostic-service/" + id;
            }
            else if (type == "package")
            {
                url = url + "-health-packages/" + id;
            }

            return url;
        }

        private static string getImageUrl(string type, string name)
        {
            name = name.ToLower().Replace(" ", "-").Replace("&", "").Replace(" / ", "-").Replace("/", "-").ToLower();
            string imageUrl = "https://leelahealthcare.com/Content/img";
            if (type == "service")
            {
                imageUrl = imageUrl + "/services/" + name + ".jpg";

            }
            else if (type == "package")
            {
                imageUrl = imageUrl + "/packages/" + name + ".jpg";

            }

            return imageUrl;
        }
    }
}