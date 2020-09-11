using System.ComponentModel.DataAnnotations.Schema;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("BlogCategoryMapping")]
    public class BlogCategoryMapping
    {
        public int ID { get; set; }

        public int BlogID { get; set; }

        public int CategoryID { get; set; }

        public bool IsDeleted { get; set; }

        public virtual BlogMaster BlogMaster { get; set; }

        public virtual BlogCategoryMaster BlogCategoryMaster { get; set; }
    }
}
