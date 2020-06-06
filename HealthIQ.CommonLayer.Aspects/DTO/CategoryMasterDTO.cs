using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class CategoryMasterDTO
    {
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string CategoryCode { get; set; }
        [StringLength(150)]
        public string Title { get; set; }
        public Nullable<int> CompanyID { get; set; }
        public List<ProductMasterDTO> ProductMasters { get; set; }

    }
}
