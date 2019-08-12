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
        public JsonResponse<EmailNotification> SendBookingEmail(BookingMaster model)
        {
            JsonResponse<EmailNotification> response = new JsonResponse<EmailNotification>();
            EmailNotification email = new EmailNotification();
            try
            {
                email.ToName = model.FirstName + " " + model.LastName;
                email.ToEmail = model.Email;
                email.Status = (int)AspectEnums.EmailStatus.Pending;
                email.Message = "This is an email message.";
                email.Mobile = model.Mobile;
                email.IsCustomerCopy = false;
                email.CreatedDate = DateTime.Now;
                email.IsHtml = true;
                email.Priority = 2;
                email.IsAttachment = false;
                EmailHelper eHelper = new EmailHelper();
                email.Body = eHelper.GetEmailBody(model);
                int status = eHelper.SendEmail(email);
                if (status == (int)AspectEnums.EmailStatus.Sent)
                {
                    response.Message = string.Format("Email successfully sent to {0} at {1}.", email.ToName, email.ToEmail);
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.SingleResult = email;
                }
                else
                {
                    response.Message = string.Format("Could not send email to {0} at {1}.", email.ToName, email.ToEmail);
                    response.StatusCode = "500";
                    response.IsSuccess = false;
                    response.SingleResult = null;
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.Message = ex.Message;
                response.StatusCode = "500";
                response.SingleResult = null;
            }
            
            return response;
        }
    }
}
