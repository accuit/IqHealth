using System;
using System.Collections.Generic;
using System.Web.Http;
using HealthIQ.CommonLayer.Aspects.DTO;
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

    }


}
