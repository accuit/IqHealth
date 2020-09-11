using System.Collections.Generic;
using HealthIQ.PersistenceLayer.Data.AdminEntity;

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
