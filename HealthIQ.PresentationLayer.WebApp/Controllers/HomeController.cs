
using System.Web.Mvc;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.PresentationLayer.WebApp.CustomFilters;

namespace MVC_Ecommerce.Controllers
{
    //[AuthorizePage((int)AspectEnums.RoleType.Employee)]
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            
            return View();
        }
        //[HttpGet]
        //public JsonResult EmpDetails()
        //{
        //    List<UserMasterBO> users = UserBusinessInstance.GetUser();
        //    return Json(users, JsonRequestBehavior.AllowGet);

        //}
        //public ActionResult PartialGetUsers()
        //{
        //    List<UserMasterBO> users = UserBusinessInstance.GetUser();
        //    return PartialView("_PartialGetUsers", users);
        //}

        [OutputCache(Duration = 1000)]
        [AuthorizePage((int)AspectEnums.RoleType.Admin)]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}