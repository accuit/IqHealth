using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/employee")]
    public class EmployeeController : ApiController
    {
        private readonly IqHealthDBContext _context;

        public EmployeeController()
        {
            _context = new IqHealthDBContext();
        }


        [HttpPost]
        [Route("upload-report")]
        public JsonResponse<int> UploadCustomerReport()
        {
            JsonResponse<int> response = new JsonResponse<int>();
           
            try
            {
                var httpRequest = HttpContext.Current.Request;
                if (httpRequest.Files.Count > 0)
                {
                    int UserID = Convert.ToInt32(httpRequest.Headers["UserID"]);
                    int UserType = Convert.ToInt32(httpRequest.Headers["UserType"]);
                    int CompanyID = Convert.ToInt32(httpRequest.Headers["CompanyID"]);

                    int CustomerID = Convert.ToInt32(httpRequest.Form["UserID"]);

                    var docfiles = new List<string>();
                    foreach (string file in httpRequest.Files)
                    {
                        UploadedReports U = new UploadedReports();
                        var postedFile = httpRequest.Files[file];
                        U.FileName = "Report_" + CustomerID + "_" + postedFile.FileName;
                        var filePath = HttpContext.Current.Server.MapPath("~/Content/Customer/Reports/" + U.FileName);
                        postedFile.SaveAs(filePath);
                        docfiles.Add(filePath);

                        U.FileLocation = filePath;
                        U.UploadedDate = DateTime.Now;
                        U.UploadedBy = UserID;
                        U.CompanyID = CompanyID;
                        U.IsDeleted = false;
                        U.UserID = CustomerID;
                        _context.UploadedReports.Add(U);
                        response.IsSuccess = _context.SaveChanges() > 1? true: false;
                        response.SingleResult = U.ID;
                    }
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                }
                else
                {
                    response.StatusCode = "400";
                    response.IsSuccess = false;
                    response.Message = "No any file to upload. Something went wrong. Contact Administrator.";
                }
               
            }
            catch (Exception ex)
            {
                response.SingleResult = 0;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }
    }
}
