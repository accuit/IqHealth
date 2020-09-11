using System.ComponentModel.DataAnnotations;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class InteriorProductDTO
    {
       public int ID { get; set; }
        [StringLength(50)]
        public string Name { get; set; }
        [StringLength(100)]
        public string Title { get; set; }
        [StringLength(1500)]
        public string Image { get; set; }
        public int InteriorCategoryID { get; set; }
        public int Type { get; set; }
        public bool IsDeleted { get; set; }
        public int? CompanyID { get; set; }
    }
}
