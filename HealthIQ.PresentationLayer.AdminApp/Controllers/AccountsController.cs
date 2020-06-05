using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Log;
using HealthIQ.CommonLayer.Resources;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    [RoutePrefix("api/account")]
    public class AccountsController : BaseAPIController
    {

        [HttpGet]
        [Route("get-by-status")]
        public JsonResponse<IList<UserMasterDTO>> GetUsersByStatus()
        {
            int type = 1;
            JsonResponse<IList<UserMasterDTO>> response = new JsonResponse<IList<UserMasterDTO>>();
            var UserMasterDTO = new List<UserMasterDTO>();
            try
            {
                response.SingleResult = UserBusinessInstance.GetUsersByStatus(type);
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

        [HttpPost]
        [Route("user-login")]
        public JsonResponse<UserMasterDTO> UserMasterLogin(UserMasterDTOLogin u)
        {
            ActivityLog.SetLog("[Started] UserMasterLogin.", LogLoc.INFO);
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            UserMasterDTO UserMasterDTO = new UserMasterDTO();
            if (!String.IsNullOrEmpty(u.email))
            {
                UserMasterDTO = UserBusinessInstance.UserLogin(u.email, u.password);

                response.SingleResult = UserMasterDTO != null ? UserMasterDTO : null;
                response.StatusCode = UserMasterDTO != null ? "200" : "500";
                response.IsSuccess = UserMasterDTO != null ? true : false;
                response.Message = UserMasterDTO != null ? "Successfully loggedin" : Messages.LoginWrongPassword + " : Incorrect Password!"; ; ;
            }
            else
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = "Username or Email can not be empty.";
            }
            ActivityLog.SetLog("[Finished] UserMasterLogin.", LogLoc.INFO);
            return response;
        }

        [HttpPost]
        [Route("user-register")]
        public JsonResponse<long> RegisterUserMasterDTO(UserMasterDTO user)
        {
            JsonResponse<long> response = new JsonResponse<long>();

            var User = UserBusinessInstance.GetUserByEmail(user.Email);
            if (User == null)
            {
                try
                {
                    user.UserStatus = 1; // (int)AspectEnums.AccountStatus.Pending;
                    user.CreatedDate = DateTime.Now;
                    response.SingleResult = UserBusinessInstance.RegisterUser(user);
                    response.StatusCode = response.SingleResult > 0 ? "200" : "500";
                    response.IsSuccess = response.SingleResult > 0 ? true : false;
                    response.Message = "User successfully submitted.";
                }
                catch (FormattedDbEntityValidationException ex)
                {
                    response.IsSuccess = false;
                    response.StatusCode = "500";
                    response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
                }
                catch(Exception ex)
                {
                    response.IsSuccess = false;
                    response.StatusCode = "500";
                    response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
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
        public JsonResponse<UserMasterDTO> UpdateUserMasterDTO(UserMasterDTO user)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();

            try
            {
                var User = UserBusinessInstance.GetUserByEmail(user.Email);
                if (User == null)
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "User does not exist in our system.";
                    return response;
                }
                User.FirstName = user.FirstName;
                User.LastName = user.LastName;
                User.ImageUrl = user.ImageUrl;
                User.Email = user.Email;
                User.Mobile = user.Mobile;
                User.Password = user.Password;
                User.Address = user.Address;
                User.City = user.City;
                User.State = user.State;
                User.UserName = user.Email;
                User.IsDeleted = user.IsDeleted;
                user.UpdatedDate = DateTime.Now;

                response.IsSuccess = UserBusinessInstance.RegisterUser(user) > 0 ? true : false;
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
        public JsonResponse<UserMasterDTO> ChangeUserPassword(UserMasterDTO user)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
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
                var User = UserBusinessInstance.GetUserByEmail(user.Email);
                if (User == null)
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "User does not exist in our system.";
                    return response;
                }

                if (User.Password == user.ConfirmPassword)
                {
                    User.Password = user.Password;
                    User.UpdatedDate = DateTime.Now;

                    response.IsSuccess = UserBusinessInstance.RegisterUser(user) > 0 ? true : false;
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

    public class UserMasterDTOLogin
    {
        public string username { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public int companyId { get; set; }

    }
}


