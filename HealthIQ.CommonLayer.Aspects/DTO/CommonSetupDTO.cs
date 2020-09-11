using System;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class CommonSetupDTO
    {
        public int CommonSetupID { get; set; }
        public string MainType { get; set; }
        public string SubType { get; set; }
        public string DisplayText { get; set; }
        public byte? DisplayValue { get; set; }
        public int? ParentID { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? CompanyID { get; set; }
        public string Description { get; set; }
    }
}
