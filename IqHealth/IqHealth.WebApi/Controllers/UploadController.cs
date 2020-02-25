using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
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
using System.Web;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/upload")]
    public class UploadController : ApiController
    {
        private readonly IqHealthDBContext _context;

        public UploadController()
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
        [Route("medical-report")]
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
                        U.FileType = (int)AspectEnums.FileType.MedicalReport;
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
                response.Message = "File with this name has already uploaded. Rename and try again.";
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


        private async void SaveFileInFolder(HttpPostedFile postedFile, UploadedReports U)
        {
            var docfiles = new List<string>();

            string savedFileName = U.ID + "_" + postedFile.FileName;
            string folder = HttpContext.Current.Server.MapPath("~/Content/DiagnosticReports/" + U.UserID);
            var filePath = folder + "/" + savedFileName;
            System.IO.Directory.CreateDirectory(folder);
            postedFile.SaveAs(filePath);
            docfiles.Add(filePath);

            U.FilePath = filePath;
            U.FileName = savedFileName;
            _context.Entry(U).State = EntityState.Modified;
            await _context.SaveChangesAsync();


        }
    }
}
