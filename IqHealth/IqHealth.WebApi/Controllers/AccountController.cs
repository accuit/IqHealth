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
    [RoutePrefix("api/user")]
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
            List<User> users = new List<User>();
            users = _context.User.ToList();
            if (users.Count > 0)
                return Request.CreateResponse(HttpStatusCode.OK, users);
            else
                return Request.CreateResponse(HttpStatusCode.NoContent, users);
        }

        [HttpPut()]
        [Route("login")]
        public IHttpActionResult UserLogin(UserLogin u)
        {
            var user = new User();
            if (!String.IsNullOrEmpty(u.username))
            {
                user = _context.User.Where(x => x.Email == u.username && x.Password == u.password).FirstOrDefault();
                if (user != null)
                    return Ok(user);
                else
                    return Unauthorized();
            }
            else
                return NotFound();
        }

        [HttpPut]
        [ResponseType(typeof(User))]
        [Route("register")]
        public IHttpActionResult RegisterUser(User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            _context.User.Add(user);
            _context.SaveChanges();

            return CreatedAtRoute("", new { id = user.ID }, user);
        }

    }
}


