using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using IqHealth.WebApi.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/notification")]
    public class NotificationController : ApiController
    {
        [Route("email-booking")]
        [HttpPost]
        public JsonResponse<int> SendBookingEmail(BookingMaster model)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            
            try
            {
                EmailHelper eHelper = new EmailHelper();
                int status =  eHelper.PrepareAndSendEmail(model);
               
                if (status == (int)AspectEnums.EmailStatus.Sent)
                {
                    response.Message = string.Format("Email successfully sent to {0} at {1}.", model.FirstName, model.Email);
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.SingleResult = status;
                }
                else
                {
                    response.Message = string.Format("Could not send email to {0} at {1}.", model.FirstName, model.Email);
                    response.StatusCode = "500";
                    response.IsSuccess = false;
                    response.SingleResult = status;
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message;
                response.StatusCode = "500";
                response.SingleResult = 0;
            }
            
            return response;
        }
        [Route("email-appointment")]
        [HttpPost]
        public JsonResponse<int> SendAppointmentEmail(DoctorAppointment model)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            
            try
            {
               
                EmailHelper eHelper = new EmailHelper();
                int status = eHelper.PrepareAndSendAppointmentEmail(model);
                if (status == (int)AspectEnums.EmailStatus.Sent)
                {
                    response.Message = string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email);
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.SingleResult = status;
                }
                else
                {
                    response.Message = string.Format("Could not send email to {0} at {1}.", model.Name, model.Email);
                    response.StatusCode = "500";
                    response.IsSuccess = false;
                    response.SingleResult = status;
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message;
                response.StatusCode = "500";
                response.SingleResult = 0;
            }

            return response;
        }
    }
}
