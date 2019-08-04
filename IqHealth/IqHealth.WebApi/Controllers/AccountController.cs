using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/users")]
    public class AccountController : ApiController
    {
        private readonly IqHealthDBContext _context;

        public AccountController()
        {
            _context = new IqHealthDBContext();
        }

        [HttpGet]
        [Route("data")]
        public HttpResponseMessage GetTestData()
        {
            List<UserMaster> UserMasters = new List<UserMaster>();
            UserMasters = _context.UserMasters.ToList();
            if (UserMasters.Count > 0)
                return Request.CreateResponse(HttpStatusCode.OK, UserMasters);
            else
                return Request.CreateResponse(HttpStatusCode.NoContent, UserMasters);
        }

        [HttpPut()]
        [Route("login")]
        public IHttpActionResult UserMasterLogin(UserMasterLogin u)
        {
            var UserMaster = new UserMaster();
            if (!String.IsNullOrEmpty(u.username))
            {
                UserMaster = _context.UserMasters.Where(x => x.Email == u.username && x.Password == u.password).FirstOrDefault();
                if (UserMaster != null)
                    return Ok(UserMaster);
                else
                    return Unauthorized();
            }
            else
                return NotFound();
        }

        [HttpPut]
        [ResponseType(typeof(UserMaster))]
        [Route("register")]
        public IHttpActionResult RegisterUserMaster(UserMaster UserMaster)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.UserMasters.Add(UserMaster);
            _context.SaveChanges();

            return Ok(UserMaster);
        }

    }

    public class UserMasterLogin
    {
        public string username { get; set; }
        public string password { get; set; }

    }
}


