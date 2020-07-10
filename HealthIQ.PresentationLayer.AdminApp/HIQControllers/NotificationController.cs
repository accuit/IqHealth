using AutoMapper;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PresentationLayer.AdminApp.Helpers;
using System;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.HIQControllers
{
    [RoutePrefix("api/notification")]
    public class NotificationController : ApiController
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        [Route("email-booking")]
        [HttpPost]
        public JsonResponse<int> SendBookingEmail(BookingMaster model)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            try
            {
                int status = EmailHelper.PrepareAndSendBookingEmail(model);

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


        [Route("send-corporate-email")]
        [HttpPost]
        public JsonResponse<int> SendCorporateTieUpEmail(CorporateTieUpEnquiry model)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<CorporateTieUpEnquiry, EmailModel>();
            });

            AutoMapper.IMapper iMapper = config.CreateMapper();
            EmailModel email = iMapper.Map<CorporateTieUpEnquiry, EmailModel>(model);

            string otherContent = "Company: " + model.CompanyName;
            email.Subject = "Enquiry for Corporate Tie Up.";
            int status = EmailHelper.PrepareAndSendEmail(email, otherContent);
            if (status == (int)AspectEnums.EmailStatus.Sent)
            {
                log.Info(string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email));
                response.Message = string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email);
                response.StatusCode = "200";
                response.IsSuccess = true;
                response.SingleResult = status;
            }
            else
            {
                log.Info(string.Format("Could not send email to {0} at {1}.", model.Name, model.Email));
                response.Message = string.Format("Could not send email to {0} at {1}.", model.Name, model.Email);
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.SingleResult = status;
            }

            return response;
        }


        [Route("send-email")]
        [HttpPost]
        public JsonResponse<int> SendEmail(EmailModel model)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            int status = EmailHelper.PrepareAndSendEmail(model);
            if (status == (int)AspectEnums.EmailStatus.Sent)
            {
                log.Info(string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email));
                response.Message = string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email);
                response.StatusCode = "200";
                response.IsSuccess = true;
                response.SingleResult = status;
            }
            else
            {
                log.Info(string.Format("Could not send email to {0} at {1}.", model.Name, model.Email));
                response.Message = string.Format("Could not send email to {0} at {1}.", model.Name, model.Email);
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.SingleResult = status;
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
                int status = EmailHelper.PrepareAndSendAppointmentEmail(model);
                if (status == (int)AspectEnums.EmailStatus.Sent)
                {
                    log.Info(string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email));
                    response.Message = string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email);
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.SingleResult = status;
                }
                else
                {
                    log.Debug(string.Format("Could not send email to {0} at {1}.", model.Name, model.Email));
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

        [Route("email-enquiry")]
        [HttpPost]
        public JsonResponse<int> SendEnquiryEmail(OnlineEnquiry model)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            try
            {
                int status = 0;
                if (model.Type == (int)AspectEnums.EnquiryType.Student)
                {
                    status = EmailHelper.PrepareAndSendStudentEnquiryEmail(model);
                }
                else
                {
                    status = EmailHelper.PrepareAndSendEnquiryEmail(model);
                }

                if (status == (int)AspectEnums.EmailStatus.Sent)
                {
                    log.Info(string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email));
                    response.Message = string.Format("Email successfully sent to {0} at {1}.", model.Name, model.Email);
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.SingleResult = status;
                }
                else
                {
                    log.Debug(string.Format("Could not send email to {0} at {1}.", model.Name, model.Email));
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
