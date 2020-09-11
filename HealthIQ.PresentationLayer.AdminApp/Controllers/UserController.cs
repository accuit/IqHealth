using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Results;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Resources;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    [RoutePrefix("api")]
    [BaseAuthentication]
    public class UserController : BaseAPIController
    {
        [HttpGet]
        [Route("get-all-users")]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<IList<UserMasterDTO>> GetAllUsers()
        {
            JsonResponse<IList<UserMasterDTO>> response = new JsonResponse<IList<UserMasterDTO>>();
            _ = new List<UserMasterDTO>();
            try
            {
                response.SingleResult = UserBusinessInstance.GetAllUsers();
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpGet]
        [Route("get-user-profile/{id}")]
        public JsonResponse<UserMasterDTO> GetUsersByID(int id)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            try
            {
                response.SingleResult = UserBusinessInstance.GetUserByID(id);
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
        [Route("create-user")]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<int> RegisterUserMasterDTO(UserMasterDTO user)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            var User = UserBusinessInstance.GetUserByEmail(user.Email);
            if (User == null)
            {
                try
                {
                    user.UserStatus = (int)AspectEnums.AccountStatus.Pending;
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
                catch (Exception ex)
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

        [HttpGet]
        [Route("delete-user/{id}")]
        [AuthorizePage(Roles = "Admin")]
        public IHttpActionResult DeleteUser(int id)
        {
            var user = UserBusinessInstance.GetUserByID(id);
            if (user == null)
            {
                return NotFound();
            }

            user.IsDeleted = true;
            var isDeleted = UserBusinessInstance.UpdateUser(user) > 0;
            return Ok(isDeleted);
        }

    }


}
