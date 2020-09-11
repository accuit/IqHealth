using System;
using System.Collections.Generic;
using System.Linq;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;

namespace HealthIQ.PersistenceLayer.Data.Impl
{
    public class AdminDataImpl : BaseDataImpl, IAdminRepository
    {
        public int AddUpdateBlog(BlogMaster blog)
        {
            blog.CreatedDate = DateTime.Now;
            HIQAdminContext.BlogMasters.Add(blog);
            HIQAdminContext.SaveChanges();

            return blog.ID;
        }

        public IList<BlogMaster> GetAllBlogs()
        {
            var blogs = HIQAdminContext.BlogMasters.Where(x => !x.IsDeleted).ToList();
            return blogs;
        }

        public BlogMaster GetBlogDetails(int id)
        {
            return HIQAdminContext.BlogMasters.FirstOrDefault(x => x.ID == id);
        }

        public IList<BlogMaster> GetBlogsByCategory(int id)
        {
            var data = HIQAdminContext.BlogMasters.SelectMany(x => x.BlogCategoryMappings, (blog, categ) => new { blog, categ })
                .Where(r => r.categ.CategoryID == id)
                .Select(r => new
                {
                    Blog = r.blog
                });

            List<BlogMaster> result = new List<BlogMaster>();
            foreach (var item in data)
            {
                result.Add(item.Blog);
            }
            return result;

        }
    }
}
