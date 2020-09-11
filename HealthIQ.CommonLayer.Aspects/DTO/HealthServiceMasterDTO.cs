using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class HealthServiceMasterDTO
    {
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public string Description { get; set; }

        [StringLength(1000)]
        public string ImageUrl { get; set; }

        public string PageUrl { get; set; }
        public DateTime? CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Type { get; set; }

        public string ServicesIncluded { get; set; }

        public int? CompanyID { get; set; }

        public List<string> ServicesInclList { get; set; }
    }
}
