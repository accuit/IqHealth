using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class BlogMasterDTO
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [Required]
        [StringLength(250)]
        public string Title { get; set; }

        [StringLength(500)]
        public string SubTitle { get; set; }

        public DateTime PostDate { get; set; }

        public string BannerImage { get; set; }

        public string ThumbImage { get; set; }

        public int Sequence { get; set; }

        public string Content { get; set; }

        public string Tags { get; set; }

        public bool IsLive { get; set; }

        public bool IsDeleted { get; set; }

        public int CreatedBy { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public int? UpdatedBy { get; set; }

        public int? CompanyID { get; set; }
        public ICollection<BlogCategoryMappingDTO> BlogCategoryMappings { get; set; }
    }

    public class BlogCategoryMasterDTO
    {
        public int ID { get; set; }
        [Required]
        [StringLength(250)]
        public string Name { get; set; }
        [Required]
        [StringLength(250)]
        public string Title { get; set; }
        [StringLength(500)]
        public int Type { get; set; }
        public string BannerImage { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsLive { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public int CompanyID { get; set; }
        public ICollection<BlogCategoryMappingDTO> BlogCategoryMappings { get; set; }
    }

    public class BlogCategoryMappingDTO
    {
        public int ID { get; set; }
        public int BlogID { get; set; }
        public int CategoryID { get; set; }
        public BlogMasterDTO Blog { get; set; }
        public BlogCategoryMasterDTO BlogCategoryMaster { get; set; }
        public bool IsDeleted { get; set; }
    }
}
