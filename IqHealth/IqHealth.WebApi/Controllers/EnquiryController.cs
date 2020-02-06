using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using IqHealth.WebApi.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/enquiry")]
    public class EnquiryController : ApiController
    {
        private readonly IqHealthDBContext _context;

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
}
