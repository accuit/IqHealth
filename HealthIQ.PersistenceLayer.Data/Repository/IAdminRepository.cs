using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.LocalEntity;
using System.Collections.Generic;

namespace HealthIQ.PersistenceLayer.Data.Repository
{
    public interface IAdminRepository
    {
        IList<BlogMaster> GetAllBlogs();
        IList<BlogMaster> GetBlogsByCategory(int id);
        int AddUpdateBlog(BlogMaster blog);
        BlogMaster GetBlogDetails(int id);
    }
}
