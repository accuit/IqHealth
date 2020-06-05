using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects;
using System;
using System.Web.Http;
using HealthIQ.CommonLayer.Aspects.Utilities;
using System.Collections.Generic;
using HealthIQ.BusinessLayer.Services.BO;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Threading.Tasks;
using HealthIQ.PresentationLayer.WebApp.Helpers;
using HealthIQ.CommonLayer.Log;

namespace HealthIQ.PresentationLayer.WebApp.Controllers
{
    [RoutePrefix("api/notification")]
    public class NotificationController : BaseAPIController
    {

        [HttpPost]
        [Route("contact-us-enquiry")]
        public JsonResponse<int> ContactUsEnquiry(ContactEnquiryDTO enquiry)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            ActivityLog.SetLog("[START][ContactUsEnquiry]", LogLoc.INFO);
            try
            {
                enquiry.Status = (int)AspectEnums.EnquiryStatus.Received;
                response.SingleResult = NotificationBusinessInstance.SubmitContactEnquiry(enquiry);
                response.IsSuccess = response.SingleResult > 0? true: false;

                if (response.IsSuccess)
                {
                    EmailHelper helper = new EmailHelper();
                    helper.PrepareAndSendContactEmail(enquiry);
                    response.StatusCode = "200";
                    response.Message = "Your enquiry is successfully posted.  We will send you email shortly.";
                }
            }
            catch (Exception ex)
            {
                ActivityLog.SetLog("Message: "+ ex.Message + "Inner Ex: "+ ex.InnerException, LogLoc.ERROR);
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = "Your enquiry is failed.";
            }
            ActivityLog.SetLog("[END][ContactUsEnquiry]", LogLoc.INFO);
            return response;
        }

        [HttpPost]
        [Route("business-enquiry")]
        public JsonResponse<int> EntrepreneurEnquiry(EntrepreneurEnquiryDTO enquiry)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            ActivityLog.SetLog("[START][EntrepreneurEnquiry]", LogLoc.INFO);
            try
            {
                enquiry.Status = (int)AspectEnums.EnquiryStatus.Received;
                response.SingleResult = NotificationBusinessInstance.SubmitEntrepreneurEnquiry(enquiry);
                response.IsSuccess = response.SingleResult > 0 ? true : false;

                if (response.IsSuccess)
                {
                    EmailHelper helper = new EmailHelper();
                    helper.PrepareAndSendEntrepreneurEmail(enquiry);
                    response.StatusCode = "200";
                    response.Message = "Your enquiry is successfully posted.  We will send you email shortly.";
                }
            }
            catch (Exception ex)
            {
                ActivityLog.SetLog("Message: " + ex.Message + "Inner Ex: " + ex.InnerException, LogLoc.ERROR);
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = "Your enquiry is failed.";
            }
            ActivityLog.SetLog("[END][EntrepreneurEnquiry]", LogLoc.INFO);
            return response;
        }


        [Route("login/{email}/{password}")]
        [HttpGet]
        public JsonResponse<UserMasterBO> Login(string email, string password)
        {
            JsonResponse<UserMasterBO> response = new JsonResponse<UserMasterBO>();
            UserMasterBO user = UserBusinessInstance.UserLogin(email, password); //.Where(x => x.cemailaddress == email && x.cpassword == password).FirstOrDefault();
            response.SingleResult = user;
            return response;
        }

        [Route("verify-otp")]
        [HttpPost]
        public async Task<JsonResponse<int>> VerifyOTP(OTPDTO otp)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            //#region Prepare OTP Data
            //string UniqueString = AppUtil.GetUniqueGuidString();
            //string OTPString = AppUtil.GetUniqueRandomNumber(100000, 999999); // Generate a Six Digit OTP
            //OTPDTO objOTP = new OTPDTO() { GUID = otp.GUID, OTP = otp.OTP, CreatedDate = DateTime.Now, UserID = 0, Attempts = 0 };
            //#endregion

            string BaseUrl = "https://2factor.in/API/V1/070815b0-3e08-11ea-9fa5-0200cd936042/SMS/VERIFY/"+ otp.GUID + "/" + otp.OTP;

            using (var client = new HttpClient())
            {
                //Passing service base url  
                client.BaseAddress = new Uri(BaseUrl);

                client.DefaultRequestHeaders.Clear();
                //Define request data format  
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //Sending request to find web api REST service resource GetAllEmployees using HttpClient  
                HttpResponseMessage Res = await client.GetAsync(BaseUrl);

                //Checking the response is successful or not which is sent using HttpClient  
                if (Res.IsSuccessStatusCode)
                {
                    //Storing the response details recieved from web api   
                    var Response = Res.Content.ReadAsStringAsync().Result;

                    //Deserializing the response recieved from web api and storing into the Employee list  
                    var res = JsonConvert.DeserializeObject<OtpResponse>(Response);
                    if (res.Status == "Success")
                    {
                        OTPDTO objOTP = new OTPDTO() { GUID = otp.GUID, OTP = otp.OTP, CreatedDate = DateTime.Now, UserID = 0, Attempts = 0 };
                        response.IsSuccess = SecurityBusinessInstance.SaveOTP(objOTP);
                        response.StatusCode = "200";
                    }
                    else
                    {
                        response.IsSuccess = false;
                        response.StatusCode = "500";
                    }
                }
            }
            return response;
        }

        [Route("appointment/{UserId}")]
        [HttpGet]
        public JsonResponse<int> SendAppointmentEmail(int UserId)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            try
            {
                #region Prepare OTP Data
                string UniqueString = AppUtil.GetUniqueGuidString();
                string OTPString = AppUtil.GetUniqueRandomNumber(100000, 999999); // Generate a Six Digit OTP
                OTPDTO objOTP = new OTPDTO() { GUID = UniqueString, OTP = OTPString, CreatedDate = DateTime.Now, UserID = UserId, Attempts = 0 };
                #endregion

                #region Save OTP and Send Email
                if (SecurityBusinessInstance.SaveOTP(objOTP))
                {
                    #region Send Email
                    string hostName = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.HostName);
                    string rawURL = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.ForgotPasswordURL);
                    string PasswordResetURL = String.Format(rawURL, hostName) + "?id=" + UniqueString;

                    EmailTemplateDTO objEmailTemplate = SecurityBusinessInstance.GetEmailTemplate(AspectEnums.EmailTemplateType.ForgotPassword);
                    var userProfile = new Object(); // UserBusinessInstance.DisplayUserProfile(UserId);
                    EmailServiceDTO emailService = new EmailServiceDTO();
                    //emailService.Body = string.Format(objEmailTemplate.Body, userProfile.FirstName, OTPString, PasswordResetURL);
                    //emailService.Priority = 1;
                    //emailService.IsHtml = true;
                    //emailService.Status = (int)AspectEnums.EmailStatus.Pending;
                    //emailService.ToName = userProfile.FirstName;
                    //emailService.ToEmail = userProfile.EmailID;
                    //emailService.FromEmail = userProfile.EmailID;
                    //emailService.Subject = objEmailTemplate.Subject;
                    //BatchBusinessInstance.InsertEmailRecord(emailService);

                    response.IsSuccess = true;
                    #endregion
                }
                #endregion

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

    public class OtpResponse
    {
        public string Status { get; set; }
        public string Details { get; set; }
    }
}
