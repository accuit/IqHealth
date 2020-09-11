using System;
using System.Collections.Generic;
using System.Web.Http;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects.Security;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    public class EDString
    {
        public string str { get; set; }
    }

    [RoutePrefix("api")]
    public class AdminController : BaseAPIController
    {
        [HttpPost]
        [Route("encrypt")]
        public JsonResponse<string> EncryptString(EDString str)
        {
            JsonResponse<string> result = new JsonResponse<string>();
            result.SingleResult = EncryptionEngine.EncryptString(str.str);
            return result;
        }

        [HttpGet]
        [Route("decrypt/{str}")]
        public JsonResponse<string> DecryptString(string str)
        {
            JsonResponse<string> result = new JsonResponse<string>();
            result.SingleResult = EncryptionEngine.DecryptString(str);  
            return result;
        }

        [HttpGet]
        [Route("get-blogs")]
        public JsonResponse<IList<BlogMasterDTO>> GetAllBlogs()
        {
            JsonResponse<IList<BlogMasterDTO>> response = new JsonResponse<IList<BlogMasterDTO>>();
            var UserMasterDTO = new List<UserMasterDTO>();
            try
            {
                response.SingleResult = AdminBusinessInstance.GetAllBlogs();
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
        [Route("get-blogs-by-category/{id}")]
        public JsonResponse<IList<BlogMasterDTO>> GetAllBlogsByCategory(int id)
        {
            JsonResponse<IList<BlogMasterDTO>> response = new JsonResponse<IList<BlogMasterDTO>>();
            try
            {
                response.SingleResult = AdminBusinessInstance.GetBlogsByCategory(id);
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
        [Route("submit-blog")]
        [BaseAuthentication]
        public JsonResponse<int> AddUpdateBlog(BlogMasterDTO blog)
        {
            JsonResponse<int> response = new JsonResponse<int>();
            if (blog == null)
                throw new NotImplementedException();
            try
            {
                response.SingleResult = AdminBusinessInstance.AddUpdateBlog(blog);
                response.StatusCode = "200";
                response.IsSuccess = true;
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
