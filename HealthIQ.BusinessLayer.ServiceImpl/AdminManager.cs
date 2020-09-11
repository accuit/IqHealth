using System.Collections.Generic;
using AutoMapper;
using HealthIQ.BusinessLayer.Base;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using Unity;

namespace HealthIQ.BusinessLayer.ServiceImpl
{
    public class AdminManager : ServiceBase, IAdminService
    {
        [Dependency(ContainerDataLayerInstanceNames.ADMIN_REPOSITORY)]
        public IAdminRepository AdminRepository { get; set; }
        private readonly IMapper mapper;

        public AdminManager(IMapper mapper)
        {
            this.mapper = mapper;
        }
        public IList<BlogMasterDTO> GetAllBlogs()
        {
            var result = AdminRepository.GetAllBlogs();
            return mapper.Map<List<BlogMasterDTO>>(result);
        }

        public IList<BlogMasterDTO> GetBlogsByCategory(int id)
        {
            var result = AdminRepository.GetBlogsByCategory(id);
            return mapper.Map<List<BlogMasterDTO>>(result);
        }

        public int AddUpdateBlog(BlogMasterDTO blog)
        {
            BlogMaster Blog = mapper.Map<BlogMaster>(blog);
            return AdminRepository.AddUpdateBlog(Blog);
        }

        public BlogMasterDTO GetBlogDetails(int id)
        {
            var result = AdminRepository.GetBlogDetails(id);
            return mapper.Map<BlogMasterDTO>(result);
        }
    }
}
