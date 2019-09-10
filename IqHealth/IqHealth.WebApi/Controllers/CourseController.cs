using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Results;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/courses")]
    public class CourseController : ApiController
    {

        private readonly IqHealthDBContext _context;

        public CourseController()
        {
            _context = new IqHealthDBContext();
        }


        [HttpGet()]
        [Route("data", Name = "GetCourses")]
        public JsonResponse<List<CourseMaster>> GetCourses()
        {
            JsonResponse<List<CourseMaster>> response = new JsonResponse<List<CourseMaster>>();

            try
            {
                List<CourseMaster> courses = _context.CourseMasters.Where(x => x.IsDeleted == 0 ).OrderBy(x => x.ID).ToList();
                if (courses != null)
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Data collected.";
                }
                else
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "No data available.";
                }
                response.SingleResult = courses;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpGet()]
        [Route("get-sub-courses", Name = "GetSubCourses")]
        public JsonResponse<List<SubCourses>> GetSubCourses()
        {
            JsonResponse<List<SubCourses>> response = new JsonResponse<List<SubCourses>>();

            try
            {
                List<SubCourses> courses = _context.SubCourses.OrderBy(x => x.ID).ToList();
                if (courses != null)
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Data collected.";
                }
                else
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "No data available.";
                }
                response.SingleResult = courses;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            return response;
        }


        [HttpGet()]
        [Route("get-course-details/{id}")]
        public JsonResponse<CourseMaster> GetCourseDetails(int id)
        {
            JsonResponse<CourseMaster> response = new JsonResponse<CourseMaster>();

            try
            {
                CourseMaster C = _context.CourseMasters.Where(c => c.IsDeleted == 0 && c.ID == id).FirstOrDefault();
                
                if (C != null)
                {
                    C.CourseCurriculums = _context.CourseCurriculums.Where(x => x.CourseMasterID == id).ToList();
                    C.SubCourses = _context.SubCourses.Where(x => x.CourseMasterID == id).ToList();

                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Data collected.";
                }
                else
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "No data available.";
                }
                response.SingleResult = C;
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            return response;
        }
    }
}