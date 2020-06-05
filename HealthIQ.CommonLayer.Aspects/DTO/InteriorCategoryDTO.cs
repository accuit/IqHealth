using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class InteriorCategoryDTO
    {
        public int ID { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        [Required]
        [StringLength(100)]
        public string Title { get; set; }
        [StringLength(1500)]
        public string Image { get; set; }
        public bool IsDeleted { get; set; }
        public int? CompanyID { get; set; }
        public  ICollection<InteriorProductDTO> InteriorProducts { get; set; }
    }
}
