using System.Collections.Generic;
using HealthIQ.CommonLayer.Aspects.DTO;

namespace HealthIQ.BusinessLayer.Services.Contracts
{
    public interface IAdminService
    {
        IList<BlogMasterDTO> GetAllBlogs();
        IList<BlogMasterDTO> GetBlogsByCategory(int id);
        int AddUpdateBlog(BlogMasterDTO blog);
        BlogMasterDTO GetBlogDetails(int id);
    }
}
