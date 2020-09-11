using System;
using System.ComponentModel.DataAnnotations;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class InteriorAndCategoryMappingDTO
    {
       
        public int ID { get; set; }
        [Required]
        public int InteriorID { get; set; }
        [Required]
        [StringLength(50)]
        public string CategoryCode { get; set; }
        public int ProductID { get; set; }
        public int Multiplier { get; set; }
        public int Divisor { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
        public int? CompanyID { get; set; }
        public bool IsDefault { get; set; }
    }
}
