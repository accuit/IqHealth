using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class CommonSetupDTO
    {
        public int CommonSetupID { get; set; }
        public string MainType { get; set; }
        public string SubType { get; set; }
        public string DisplayText { get; set; }
        public Nullable<byte> DisplayValue { get; set; }
        public Nullable<int> ParentID { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> CompanyID { get; set; }
        public string Description { get; set; }
    }
}
