using System;
using System.Collections.Generic;
using System.Web.Http;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Resources;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    [RoutePrefix("api/student")]
    [BaseAuthentication]
    public class StudentController : BaseAPIController
    {
        [HttpGet]
        [Route("get")]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<IList<UserMasterDTO>> GetStudents()
        {
            JsonResponse<IList<UserMasterDTO>> response = new JsonResponse<IList<UserMasterDTO>>();
            var UserMasterDTO = new List<UserMasterDTO>();
            try
            {
                response.SingleResult = StudentBusinessInstance.GetAllStudents();
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpGet]
        [Route("get-profile/{id}")]
        [AuthorizePage(Roles = "Student")]
        public JsonResponse<UserMasterDTO> GetStudentProfile(int id)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            var UserMasterDTO = new UserMasterDTO();
            try
            {
                response.SingleResult = StudentBusinessInstance.GetStudentProfile(id);
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpPost]
        [Route("add-student")]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<int> AddNewStudent(UserMasterDTO user)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            UserMasterDTO User = new UserMasterDTO();
            if (!string.IsNullOrEmpty(user.Email))
                User = UserBusinessInstance.GetUserByEmail(user.Email);
            if (User == null)
            {
                try
                {
                    user.UserStatus = 1; // (int)AspectEnums.AccountStatus.Pending;
                    user.CreatedDate = DateTime.Now;
                    response.SingleResult = StudentBusinessInstance.SubmitNewStudent(user);
                    response.StatusCode = response.SingleResult > 0 ? "200" : "500";
                    response.IsSuccess = response.SingleResult > 0 ? true : false;
                    response.Message = "User successfully submitted.";
                }
                catch (FormattedDbEntityValidationException ex)
                {
                    response.IsSuccess = false;
                    response.StatusCode = "500";
                    response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
                }
                catch (Exception ex)
                {
                    response.IsSuccess = false;
                    response.StatusCode = "500";
                    response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
                }
            }
            else
            {
                response.SingleResult = 0;
                response.IsSuccess = false;
                response.StatusCode = "200";
                response.Message = string.Format("User with email address {0} already exists. Try again.", user.Email);
            }
            return response;
        }

        [HttpGet]
        [Route("get-invoices/{userId}")]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<IList<StudentInvoiceDTO>> GetStudentInvoices(int userId)
        {
            JsonResponse<IList<StudentInvoiceDTO>> response = new JsonResponse<IList<StudentInvoiceDTO>>();
            var StudentInvoiceDTO = new List<StudentInvoiceDTO>();
            try
            {
                response.SingleResult = StudentBusinessInstance.GetStudentInvoices(userId);
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpGet]
        [Route("get-all-invoices")]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<IList<StudentInvoiceDTO>> GetAllInvoices()
        {
            JsonResponse<IList<StudentInvoiceDTO>> response = new JsonResponse<IList<StudentInvoiceDTO>>();
            var StudentInvoiceDTO = new List<StudentInvoiceDTO>();
            try
            {
                response.SingleResult = StudentBusinessInstance.GetAllInvoices();
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpGet]
        [Route("get-invoice-details/{Id}")]
        [AuthorizePage(Roles = "Student")]
        public JsonResponse<StudentInvoiceDTO> GetInvoiceDetails(int Id)
        {
            JsonResponse<StudentInvoiceDTO> response = new JsonResponse<StudentInvoiceDTO>();
            var StudentInvoiceDTO = new List<StudentInvoiceDTO>();
            try
            {
                response.SingleResult = StudentBusinessInstance.GetInvoiceDetails(Id);
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpPost]
        [Route("create-invoice")]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<long> CreateORUpdateStudentinvoice(StudentInvoiceDTO invoice)
        {
            JsonResponse<long> response = new JsonResponse<long>();

            try
            {
                response.SingleResult = StudentBusinessInstance.AddUpdateStudentInvoice(invoice);
                response.StatusCode = response.SingleResult > 0 ? "200" : "500";
                response.IsSuccess = response.SingleResult > 0 ? true : false;
                response.Message = "User successfully submitted.";
            }
            catch (FormattedDbEntityValidationException ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
            }

            return response;
        }
    }
}
