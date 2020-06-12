using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Resources;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    [RoutePrefix("api/student")]
    public class StudentController : BaseAPIController
    {
        [HttpGet]
        [Route("get")]
        public JsonResponse<IList<UserMasterDTO>> GetStudents()
        {
            JsonResponse<IList<UserMasterDTO>> response = new JsonResponse<IList<UserMasterDTO>>();
            var UserMasterDTO = new List<UserMasterDTO>();
            try
            {
                response.SingleResult = StudentBusinessInstance.GetAllStudents();
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
        [Route("add-student")]
        public JsonResponse<long> AddNewStudent(UserMasterDTO user)
        {
            JsonResponse<long> response = new JsonResponse<long>();

            var User = UserBusinessInstance.GetUserByEmail(user.Email);
            if (User == null)
            {
                try
                {
                    user.UserStatus = 1; // (int)AspectEnums.AccountStatus.Pending;
                    user.CreatedDate = DateTime.Now;
                    response.SingleResult = StudentBusinessInstance.SubmitNewStudent(user);
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
    }
}
