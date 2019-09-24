using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.UI.WebControls;

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

        protected void UploadFile(int customerID, HttpPostedFile file, string fileName, int UploadedBy, int Company)
        {
          
                using (Stream fs = file.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string constr = ConfigurationManager.ConnectionStrings["IqHealthConnection"].ConnectionString;
                        using (MySqlConnection con = new MySqlConnection(constr))
                        {
                            string query = "INSERT INTO `UploadedReports`(`UserID`,`FileName` ,`UploadedDate`,`UploadedBy` ,`CompanyID`,`File`) " +
                                "VALUES (@CustomerID, @FileName, @UploadedDate, @UploadedBy, @CompanyID, @File)";
                            using (MySqlCommand cmd = new MySqlCommand(query))
                            {
                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@CustomerID", customerID);
                                cmd.Parameters.AddWithValue("@FileName", fileName);
                                cmd.Parameters.AddWithValue("@UploadedDate", DateTime.Now);
                                cmd.Parameters.AddWithValue("@UploadedBy", UploadedBy);
                                cmd.Parameters.AddWithValue("@CompanyID", Company);
                                cmd.Parameters.AddWithValue("@File", bytes);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                    }
                }
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
                        UploadFile(CustomerID, postedFile, U.FileName, UserID, CompanyID);
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
