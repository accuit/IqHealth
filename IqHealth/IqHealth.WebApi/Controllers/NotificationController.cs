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
        [Route("send-email")]
        [HttpPost]
        public JsonResponse<bool> SendBookingEmail(BookingMaster model)
        {
            JsonResponse<bool> response = new JsonResponse<bool>();
            EmailNotification email = new EmailNotification();
            try
            {
                email.ToName = model.FirstName + " " + model.LastName;
                email.Subject = "Your booking is confirmed.";
                email.ToEmail = model.Email;
                email.Status = (int)AspectEnums.EmailStatus.Pending;
                email.Message = "This is email message.";
                email.Mobile = model.Mobile;
                email.IsCustomerCopy = false;
                email.Body = email.Message;
                email.CreatedDate = DateTime.Now;
                email.IsHtml = true;
                email.Priority = 2;
                email.IsAttachment = false;
                EmailHelper eNotification = new EmailHelper();
                eNotification.SendEmail(email);
                response.Message = "Success!";
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message;
                response.StatusCode = "500";
            }
            
            return response;
        }
    }
}
