using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/customer")]
    public class CustomerController : ApiController
    {
        private readonly IqHealthDBContext _context;

        public CustomerController()
        {
            _context = new IqHealthDBContext();
        }

        [HttpGet()]
        [Route("download-reports/{id}/{customer}")]
        public JsonResponse<List<UploadedReports>> GetCustomerReports(int id, int customer)
        {
            JsonResponse<List<UploadedReports>> response = new JsonResponse<List<UploadedReports>>();
            response.SingleResult = _context.UploadedReports.Where(x => x.UserID == id && x.CompanyID == customer).ToList();
            response.StatusCode = "200";
            response.Message = "Reports fetched successfully.";
            response.IsSuccess = true;

            return response;
        }
    }
}
