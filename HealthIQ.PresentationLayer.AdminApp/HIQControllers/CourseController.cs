using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using AutoMapper;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;

namespace HealthIQ.PresentationLayer.AdminApp.HIQControllers
{
    [RoutePrefix("api/courses")]
    public class CourseController : ApiController
    {

        private readonly HIQAdminEntities _context;

        public CourseController()
        {
            _context = new HIQAdminEntities();
        }


        [HttpGet]
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

        [HttpGet]
        [Route("get-sub-courses", Name = "GetSubCourses")]
        public JsonResponse<List<SubCourse>> GetSubCourses()
        {
            JsonResponse<List<SubCourse>> response = new JsonResponse<List<SubCourse>>();

            try
            {
                List<SubCourse> courses = _context.SubCourses.OrderBy(x => x.ID).ToList();
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


        [HttpGet]
        [Route("get-course-details/{id}")]
        public JsonResponse<CourseMasterDTO> GetCourseDetails(int id)
        {
            JsonResponse<CourseMasterDTO> response = new JsonResponse<CourseMasterDTO>();
            var config = new MapperConfiguration(map =>
            {
                map.CreateMap<CourseMaster, CourseMasterDTO>();
                map.CreateMap<CourseMasterDTO, CourseMaster>();
                map.CreateMap<SubCourse, SubCourseDTO>();
                map.CreateMap<SubCourseDTO, SubCourse>();
                map.CreateMap<CourseCurriculum, CourseCurriculumDTO>();
                map.CreateMap<CourseCurriculumDTO, CourseCurriculum>();
            });
            try
            {
                CourseMaster Course = _context.CourseMasters.Where(c => c.IsDeleted == 0 && c.ID == id).FirstOrDefault();
                IMapper iMapper = config.CreateMapper();
                CourseMasterDTO C = iMapper.Map<CourseMasterDTO>(Course);

                if (C != null)
                {
                    C.CourseCurriculum = iMapper.Map<List<CourseCurriculumDTO>>(_context.CourseCurriculums.Where(x => x.CourseMasterID == id).ToList());
                    C.SubCourses = iMapper.Map<List<SubCourseDTO>>(_context.SubCourses.Where(x => x.CourseMasterID == id).ToList());

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