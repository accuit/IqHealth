namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BlogCategoryMapping")]
    public partial class BlogCategoryMapping
    {
        public int ID { get; set; }

        public int BlogID { get; set; }

        public int CategoryID { get; set; }

        public bool IsDeleted { get; set; }

        public virtual BlogMaster BlogMaster { get; set; }

        public virtual BlogCategoryMaster BlogCategoryMaster { get; set; }
    }
}
