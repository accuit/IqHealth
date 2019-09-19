using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        [HttpGet]
        [Route("data/{type}")]
        public JsonResponse<List<UserMaster>> UserMasterLogin(int type)
        {
            JsonResponse<List<UserMaster>> response = new JsonResponse<List<UserMaster>>();
            var UserMaster = new List<UserMaster>();
            try
            {
                response.SingleResult = _context.UserMasters.Where(x => x.UserType == type).ToList();
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpPost()]
        [Route("login")]
        public JsonResponse<UserMaster> UserMasterLogin(UserMasterLogin u)
        {
            JsonResponse<UserMaster> response = new JsonResponse<UserMaster>();
            var UserMaster = new UserMaster();
            if (!String.IsNullOrEmpty(u.email))
            {
                UserMaster = _context.UserMasters.Where(x => x.Email == u.email && x.Password == u.password).FirstOrDefault();

                response.SingleResult = UserMaster != null ? UserMaster : null;
                response.StatusCode = UserMaster != null ? "200" : "500";
                response.IsSuccess = UserMaster != null ? true : false;
                response.Message = UserMaster != null ? "Successfully loggedin" : "Incorrect credentials. Please try again."; ;
            }
            else
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = "Username or Email can not be empty.";
            }
            return response;
        }

        [HttpPost]
        [Route("register")]
        public JsonResponse<int> RegisterUserMaster(UserMaster user)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            if (!ModelState.IsValid)
            {
                response.SingleResult = 0;
                response.IsSuccess = false;
                response.FailedValidations = ModelState.Keys.ToArray();
                response.StatusCode = "200";
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            var User = _context.UserMasters.Where(x => x.Email == user.Email).FirstOrDefault();
            if (User == null)
            {
                try
                {
                    _context.UserMasters.Add(user);
                    response.SingleResult = _context.SaveChanges();
                    response.StatusCode = response.SingleResult > 0 ? "200" : "500";
                    response.IsSuccess = response.SingleResult > 0 ? true : false;
                    response.Message = "User successfully submitted.";
                }
                catch (Exception ex)
                {
                    response.IsSuccess = false;
                    response.StatusCode = "500";
                    response.Message = ex.Message;
                }

            }
            else
            {
                response.SingleResult = 0;
                response.IsSuccess = false;
                response.StatusCode = "200";
                response.Message = string.Format("User with email address {0} already exists. Try again.", user.Email);

            }
            return response;
        }

        [HttpPost]
        [Route("update-user")]
        public JsonResponse<UserMaster> UpdateUserMaster(UserMaster user)
        {
            JsonResponse<UserMaster> response = new JsonResponse<UserMaster>();
            if (!ModelState.IsValid)
            {
                response.SingleResult = user;
                response.IsSuccess = false;
                response.FailedValidations = ModelState.Keys.ToArray();
                response.StatusCode = "200";
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }

            try
            {
                var User = _context.UserMasters.Where(x => x.ID == user.ID && x.CompanyID == user.CompanyID).FirstOrDefault();
                if (User == null)
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "User does not exist in our system.";
                    return response;
                }
                User.FirstName = user.FirstName;
                User.LastName = user.LastName;
                //User.ImageUrl = user.ImageUrl;
                User.Email = user.Email;
                User.Mobile = user.Mobile;
                User.Password = user.Password;
                User.Address = user.Address;
                User.City = user.City;
                User.State = user.State;
                User.UserName = user.Email;
                User.IsDeleted = user.IsDeleted;
                user.UpdatedDate = DateTime.Now;

                _context.Entry(user).State = EntityState.Modified;
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;
                response.SingleResult = user;
                response.StatusCode = "200";

            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpPost]
        [Route("reset-password")]
        public JsonResponse<UserMaster> ChangeUserPassword(UserMaster user)
        {
            JsonResponse<UserMaster> response = new JsonResponse<UserMaster>();
            if (user.Password != user.ConfirmPassword)
            {
                response.SingleResult = user;
                response.IsSuccess = false;
                response.StatusCode = "200";
                response.Message = "Password and Confirm password does not match. Try again please.";
                return response;
            }

            try
            {
                var User = _context.UserMasters.Where(x => x.Email == user.Email && x.CompanyID == user.CompanyID).FirstOrDefault();
                if (User == null)
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "User does not exist in our system.";
                    return response;
                }

                if (User.Password == user.oldPassword)
                {
                    User.Password = user.Password;
                    User.UpdatedDate = DateTime.Now;

                    _context.Entry(User).State = EntityState.Modified;
                    response.IsSuccess = _context.SaveChanges() > 0 ? true : false;
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "Your password has been successfully updated.";
                }
                else
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "User password does not match";
                    return response;
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

    }

    public class UserMasterLogin
    {
        public string username { get; set; }
        public string email { get; set; }
        public string password { get; set; }

    }
}


