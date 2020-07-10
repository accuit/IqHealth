using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    [RoutePrefix("api")]
    public class AdminController : BaseAPIController
    {
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
