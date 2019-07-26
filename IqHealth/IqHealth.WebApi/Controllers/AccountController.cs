using IqHealth.WebApi.Model;
using IqHealth.WebApi.Model.DataModels;
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
        private readonly IqHealthDBContext context = new IqHealthDBContext();

        [HttpGet]
        [Route("test-api")]
        public string Get()
        {
            return "Welcome to IQHealth";
        }

        [HttpPost]
        [Route("login")]
        public User Post(UserLogin u)
        {
            if (!String.IsNullOrEmpty(u.username))
                 return context.User.Where(x => x.Email.Contains(u.username) && (x.Password == u.password)).FirstOrDefault();
            else
                return null;
        }


        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}

public class UserLogin
{
    public string username { get; set; }
    public string password { get; set; }
}

