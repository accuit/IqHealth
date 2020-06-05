using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects;
using System;
using System.Web.Http;
using HealthIQ.CommonLayer.Aspects.Utilities;
using System.Collections.Generic;
using HealthIQ.BusinessLayer.Services.BO;
using System.Web.UI;

namespace HealthIQ.PresentationLayer.WebApp.Controllers
{
    [RoutePrefix("api/product")]
    [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
    public class ProductController : BaseAPIController
    {
        [Route("get-interior")]
        [HttpGet]
        [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        public JsonResponse<List<InteriorCategoryDTO>> GetInterior()
        {
            JsonResponse<List<InteriorCategoryDTO>> response = new JsonResponse<List<InteriorCategoryDTO>>();
            response.SingleResult = ProductBusinessInstance.GetInteriorCategories();
            response.IsSuccess = true;
            return response;
        }

        [Route("get-mappings/{id}")]
        [HttpGet]
        [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        public JsonResponse<List<CompleteInteriorListingDTO>> GetInteriorMappings(int id = 1)
        {
            JsonResponse<List<CompleteInteriorListingDTO>> response = new JsonResponse<List<CompleteInteriorListingDTO>>();
            response.SingleResult = ProductBusinessInstance.GetInteriorCategoryMapping(id);
            response.IsSuccess = true;
            return response;
        }

        [Route("getCategories")]
        [HttpGet]
        [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        public JsonResponse<List<CategoryMasterDTO>> GetAllCategories()
        {
            JsonResponse<List<CategoryMasterDTO>> response = new JsonResponse<List<CategoryMasterDTO>>();
            response.SingleResult = ProductBusinessInstance.GetAllCategories();
            response.IsSuccess = true;
            return response;
        }

        [Route("getProductsList")]
        [HttpGet]
        [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        public JsonResponse<List<ProductMasterDTO>> GetAllProducts()
        {
            JsonResponse<List<ProductMasterDTO>> response = new JsonResponse<List<ProductMasterDTO>>();
            response.SingleResult = ProductBusinessInstance.GetAllProducts(); //.Where(x => x.cemailaddress == email && x.cpassword == password).FirstOrDefault();
            response.IsSuccess = true;
            return response;
        }

        [Route("productsByCategory/{code}")]
        [HttpGet]
        [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        public JsonResponse<List<ProductMasterDTO>> GetProductsByCategory(string code)
        {
            JsonResponse<List<ProductMasterDTO>> response = new JsonResponse<List<ProductMasterDTO>>();
            response.SingleResult = ProductBusinessInstance.GetAllProductsByCategory(code); //.Where(x => x.cemailaddress == email && x.cpassword == password).FirstOrDefault();
            response.IsSuccess = true;
            return response;
        }

        [Route("productHelp/{code}/{id}")]
        [HttpGet]
        [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        public JsonResponse<ProductHelpDTO> GetProductHelpByID(string code, int? id = 0)
        {
            JsonResponse<ProductHelpDTO> response = new JsonResponse<ProductHelpDTO>();
            try
            {

                response.SingleResult = ProductBusinessInstance.GetProductHelp((int)id, code);
                response.IsSuccess = true;
                response.StatusCode = "200";
            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
            }

            return response;
        }

        [Route("productHelpByCatg/{id}")]
        [HttpGet]
        [System.Web.Mvc.OutputCache(Duration = 9999 * 999, VaryByParam = "none", Location = OutputCacheLocation.Client, NoStore = false)]
        public JsonResponse<ProductHelpDTO> GetProductHelpByCatgID(string code)
        {
            JsonResponse<ProductHelpDTO> response = new JsonResponse<ProductHelpDTO>();
            response.SingleResult = ProductBusinessInstance.GetCategoryHelp(code);
            response.IsSuccess = true;
            return response;
        }
    }
}
