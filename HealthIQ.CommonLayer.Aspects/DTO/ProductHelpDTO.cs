using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public partial class ProductHelpDTO
    {

        public int ID { get; set; }

        public string Title { get; set; }

        public int? ProductID { get; set; }

        public string ImageUrl { get; set; }

        public string Description { get; set; }
        public string AdditionalInfo { get; set; }
        public string Specification { get; set; }

        public DateTime CreatedDate { get; set; }

        public int CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public int ModifiedBy { get; set; }

        public bool IsDeleted { get; set; }

        public int CategoryID { get; set; }

        public int CompanyID { get; set; }

    }
}
