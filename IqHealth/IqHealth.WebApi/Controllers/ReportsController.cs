using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using IqHealth.WebApi.Helpers;
using Microsoft.AspNetCore.Hosting;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/reports")]
    public class ReportsController : ApiController
    {
        private readonly IqHealthDBContext _context;
        private readonly IHostingEnvironment host;

        public ReportsController()
        {
            _context = new IqHealthDBContext();
        }

        protected int UploadFile(HttpPostedFile file, UploadedReports U)
        {

            using (Stream fs = file.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string constr = ConfigurationManager.ConnectionStrings["IqHealthConnection"].ConnectionString;
                    using (MySqlConnection con = new MySqlConnection(constr))
                    {
                        string query = "INSERT INTO `UploadedReports`(`UserID`,`FileName` ,`UploadedDate`,`UploadedBy` ,`CompanyID`,`File`)  OUTPUT INSERTED.ID" +
                            "VALUES (@CustomerID, @FileName, @UploadedDate, @UploadedBy, @CompanyID, @File)";
                        using (MySqlCommand cmd = new MySqlCommand(query))
                        {
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@CustomerID", U.UserID);
                            cmd.Parameters.AddWithValue("@FileName", file.FileName);
                            cmd.Parameters.AddWithValue("@FilePath", U.FilePath);
                            cmd.Parameters.AddWithValue("@UploadedDate", DateTime.Now);
                            cmd.Parameters.AddWithValue("@UploadedBy", U.UploadedBy);
                            cmd.Parameters.AddWithValue("@CompanyID", U.CompanyID);
                            cmd.Parameters.AddWithValue("@File", null);
                            con.Open();
                            int id = (Int32)cmd.ExecuteNonQuery();
                            con.Close();
                            return id;
                        }
                    }
                }
            }
        }


        [HttpPost]
        [Route("upload-diagnostic")]
        public JsonResponse<int> UploadCustomerReport()
        {
            JsonResponse<int> response = new JsonResponse<int>();

            try
            {

                var httpRequest = HttpContext.Current.Request;
                if (httpRequest.Files.Count > 0)
                {
                    int EmpID = Convert.ToInt32(httpRequest.Headers["UserID"]);
                    int UserType = Convert.ToInt32(httpRequest.Headers["UserType"]);
                    int CompanyID = Convert.ToInt32(httpRequest.Headers["Company"]);
                    int CustomerID = Convert.ToInt32(httpRequest.Form["customerID"]);

                    foreach (string file in httpRequest.Files)
                    {
                        UploadedReports U = new UploadedReports();
                        var postedFile = httpRequest.Files[file];
                        U.UploadedBy = EmpID;
                        U.UserID = CustomerID;
                        U.FileName = postedFile.FileName;
                        U.FilePath = postedFile.FileName;
                        U.CompanyID = CompanyID;
                        U.UploadedDate = DateTime.Now;
                        U.FileType = (int)AspectEnums.FileType.DiagnosticReport;

                        var fileExist = _context.UploadedReports.Where(x => x.FileName == U.FileName && x.CompanyID == U.CompanyID).FirstOrDefault();
                        if(fileExist != null)
                        {
                            response.StatusCode = "200";
                            response.IsSuccess = false;
                            response.Message = "File with name " + U.FileName + " already exist. Rename and try again.";
                            response.SingleResult = 0;
                            return response;
                        }


                        _context.UploadedReports.Add(U);
                        _context.SaveChanges();
                        response.SingleResult = U.ID;
                        SaveFileInFolder(postedFile, U);
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
            catch (DataException ex)
            {
                response.SingleResult = 0;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.InnerException.Message;
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


        private async void SaveFileInFolder(HttpPostedFile file, UploadedReports U)
        {
        
            try
            {
                var filePath = U.UserID.ToString();
                string fileName = U.UserID.ToString() + "_" + DateTime.Now.ToLongDateString();
                string fileDirectory = AppUtil.GetUploadDirectory(AspectEnums.FileType.DiagnosticReport) + filePath;

                if (!Directory.Exists(fileDirectory))
                    Directory.CreateDirectory(fileDirectory);

                if (file != null)
                {
                    file.SaveAs(fileDirectory + file.FileName);

                    U.FilePath = filePath;
                    U.FileName = file.FileName;
                    _context.Entry(U).State = EntityState.Modified;
                    await _context.SaveChangesAsync().ConfigureAwait(false);
                }
            }
            catch (Exception e)
            {
                //ActivityLog.SetLog("Image uploading failed! Message: " + e.Message + " Inner Ex: " + e.InnerException, LogLoc.INFO);
            }

        }

        [HttpGet()]
        [Route("get-user-files/{id}")]
        public JsonResponse<List<UploadedReports>> GetCustomerReports(int id)
        {
            JsonResponse<List<UploadedReports>> response = new JsonResponse<List<UploadedReports>>();
            var data = _context.UploadedReports.AsEnumerable<UploadedReports>().Where(x => x.UserID == id).Select(x => new { x.ID, x.FileName });

            response.SingleResult = _context.UploadedReports.Where(x => x.UserID == id).ToList();
            response.StatusCode = "200";
            response.Message = "Reports fetched successfully.";
            response.IsSuccess = true;

            return response;
        }

        [HttpGet]
        [Route("getFile/{name}/{userID}")]
        public HttpResponseMessage GetFile(string name, int userID)
        {
            //Create HTTP Response.
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK);

            //Set the File Path.
            string filePath = HttpContext.Current.Server.MapPath("~/Content/DiagnosticReports/" + userID + "/") + name;

            //Check whether File exists.
            if (!File.Exists(filePath))
            {
                //Throw 404 (Not Found) exception if File not found.
                response.StatusCode = HttpStatusCode.NotFound;
                response.ReasonPhrase = string.Format("File not found: {0} .", name);
                throw new HttpResponseException(response);
            }

            //Read the File into a Byte Array.
            byte[] bytes = File.ReadAllBytes(filePath);

            //Set the Response Content.
            response.Content = new ByteArrayContent(bytes);

            //Set the Response Content Length.
            response.Content.Headers.ContentLength = bytes.LongLength;

            //Set the Content Disposition Header Value and FileName.
            response.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");
            response.Content.Headers.ContentDisposition.FileName = name;

            //Set the File Content Type.
            response.Content.Headers.ContentType = new MediaTypeHeaderValue(MimeMapping.GetMimeMapping(name));
            return response;
        }
    }
}
