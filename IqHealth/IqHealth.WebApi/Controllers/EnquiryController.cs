using HealthIQ.CommonLayer.AuditLog;
using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using IqHealth.WebApi.Helpers;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/enquiry")]
    public class EnquiryController : ApiController
    {
        private readonly IqHealthDBContext _context;
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public EnquiryController()
        {
            _context = new IqHealthDBContext();
        }

        [HttpPost]
        [Route("new")]
        public JsonResponse<int> NewEnquiry(OnlineEnquiry appointment)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            if (!ModelState.IsValid)
            {

                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            try
            {
                appointment.CreatedDate = DateTime.Now;
                _context.OnlineEnquiries.Add(appointment);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    response.StatusCode = "200";
                    response.Message = "Your enquiry is successfully posted.  We will send you email shortly.";
                    response.SingleResult = appointment.ID;
                    log.Info("[Success] NewEnquiry for Email: " + appointment.Email);
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
                log.Error("NewEnquiry for Email: " + ex.Message);
            }

            return response;
        }

        [HttpPost]
        [Route("contact-us-enquiry")]
        public JsonResponse<int> ContactUsEnquiry(ContactUsEnquiry enquiry)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            if (!ModelState.IsValid)
            {

                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            try
            {
                enquiry.CreatedDate = DateTime.Now;
                enquiry.Status = (int)AspectEnums.EnquiryStatus.Received;
                _context.ContactUsEnquiry.Add(enquiry);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    response.StatusCode = "200";
                    response.Message = "Your enquiry is successfully posted.  We will send you email shortly.";
                    response.SingleResult = enquiry.ID;
                    log.Info("[Success] ContactUsEnquiry for Email: " + enquiry.Email);
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



        [HttpPost]
        [Route("partner-enquiry")]
        public JsonResponse<int> PartnerEnquiry(PartnerEnquiry partner)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            if (!ModelState.IsValid)
            {

                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            try
            {
                partner.CreatedDate = DateTime.Now;
                partner.Status = (int)AspectEnums.EnquiryStatus.Received;
                _context.PartnerEnquiries.Add(partner);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    response.StatusCode = "200";
                    response.Message = "Your enquiry is successfully posted.  We will send you email shortly.";
                    response.SingleResult = partner.ID;
                    log.Info("[Success] PartnerEnquiry for Email: " + partner.Email);
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

        [HttpPost]
        [Route("corporate-enquiry")]
        public JsonResponse<int> CorporateEnquiry(CorporateTieUpEnquiry enquiry)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            if (!ModelState.IsValid)
            {

                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            try
            {
                enquiry.CreatedDate = DateTime.Now;
                enquiry.Status = (int)AspectEnums.EnquiryStatus.Received;
                _context.CorporateTieUpEnquiries.Add(enquiry);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    response.StatusCode = "200";
                    response.Message = "Your enquiry is successfully posted.  We will send you email shortly.";
                    response.SingleResult = enquiry.ID;
                    log.Info("[Success] CorporateEnquiry for Email: " + enquiry.Email);
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

        [HttpPost]
        [Route("organize-camp-enquiry")]
        public JsonResponse<int> OrganizeCamp(OrganizeCampEnquiry enquiry)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            log.Info("[Started] OrganizeCamp");
            if (!ModelState.IsValid)
            {

                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                return response;
            }
            try
            {
                enquiry.CreatedDate = DateTime.Now;
                enquiry.State = (int)AspectEnums.EnquiryStatus.Received;
                _context.OrganizeCampEnquiry.Add(enquiry);
                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    response.StatusCode = "200";
                    response.Message = "Your enquiry is successfully posted.  We will send you email shortly.";
                    response.SingleResult = enquiry.ID;
                    log.Info("[Success] OrganizeCamp");
                }
                
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
            }
            log.Info("[Finished] OrganizeCamp");
            return response;
        }


        [HttpPost]
        [Route("post-job")]
        public JsonResponse<int> SubmitJobApplication(JobApplication application)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            log.Info("[Started] SubmitJobApplication");

            if (!ModelState.IsValid)
            {

                response.FailedValidations = ModelState.Keys.ToArray();
                response.Message = string.Format("Kindly check {0}. It is missing or in incorrect format.", response.FailedValidations[0].Split('.').LastOrDefault());
                log.Info("[Invalid Request] " + response.Message);
                return response;
            }
            try
            {
                var app = _context.JobApplications.Where(x => x.Email == application.Email).FirstOrDefault();
                application.CreatedDate = DateTime.Now;

                if (app != null)
                {
                    log.Info("Email " + app.Email + " already exists. Updating data.");
                    app.FirstName = application.FirstName;
                    app.LastName = application.LastName;
                    app.ResumeText = application.ResumeText;
                    app.Phone = application.Phone;
                    app.CreatedDate = application.CreatedDate;
                    _context.Entry(app).State = EntityState.Modified;
                }
                else
                    _context.JobApplications.Add(application);

                response.IsSuccess = _context.SaveChanges() > 0 ? true : false;

                if (response.IsSuccess)
                {
                    log.Info("Email " + application.Email + " applied for a job successfully.");
                    response.StatusCode = "200";
                    response.Message = "Your resume is successfully posted.  We will send you email shortly.";
                    response.SingleResult = application.ID == 0 ? app.ID : application.ID;
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
                log.Error("Error Message: " + ex.Message + " Inner Ex: " + ex.InnerException);
            }

            log.Info("[Finished] SubmitJobApplication"); ;
            return response;
        }

        [HttpPost]
        [Route("upload-cv")]
        public JsonResponse<int> UploadCV()
        {
            JsonResponse<int> response = new JsonResponse<int>();
            log.Info("[Started] Upload CV");
            try
            {
                var httpRequest = HttpContext.Current.Request;
                if (httpRequest.Files.Count > 0)
                {
                    int applicationID = Convert.ToInt32(httpRequest.Form["applicationID"]);
                    int companyID = Convert.ToInt32(httpRequest.Form["companyID"]);

                    log.Debug("Upload CV for ApplicationID: " + applicationID);

                    foreach (string file in httpRequest.Files)
                    {
                        UploadedReports U = new UploadedReports();
                        var postedFile = httpRequest.Files[file];

                        var application = _context.JobApplications.Where(x => x.ID == applicationID && x.CompanyID == companyID).FirstOrDefault();
                        if (application != null)
                            StoreResume(postedFile, application);

                    }
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                }
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
                log.Error("Error Message: " + ex.Message + " Inner Ex: " + ex.InnerException);
                log.Error("[Failed] Upload CV");
            }
            log.Debug("[Finished] Upload CV");
            return response;
        }

        private async void StoreResume(HttpPostedFile file, JobApplication job)
        {
            log.Info("[Started] StoreResume");
            string fileName = job.Phone + "_" + job.Email + "" + Path.GetExtension(file.FileName);
            string fileDirectory = AppUtil.GetUploadDirectory(AspectEnums.FileType.Resume);

            log.Debug("[Started] [StoreResume] FileName: " + fileName + " and File Directory: " + fileDirectory);

            if (!Directory.Exists(fileDirectory))
                Directory.CreateDirectory(fileDirectory);

            if (file != null)
            {
                file.SaveAs(fileDirectory + fileName);

                job.ResumePath = fileDirectory + fileName;
                _context.Entry(job).State = EntityState.Modified;
                await _context.SaveChangesAsync().ConfigureAwait(false);
                log.Info("[EntitySaved] Successfully saved CV on ResumePath: " + job.ResumePath);
            }
            log.Info("[Finished] StoreResume");
        }
    }
}
