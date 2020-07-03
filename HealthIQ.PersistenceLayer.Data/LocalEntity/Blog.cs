
using HealthIQ.PersistenceLayer.Data.AdminEntity;

namespace HealthIQ.PersistenceLayer.Data.LocalEntity
{
    public class Blog
    {
        public  BlogMaster BlogMaster {get; set;}
        public BlogCategoryMaster BlogCategoryMaster { get; set; }
    }
}
