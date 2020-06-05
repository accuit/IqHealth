using System.Collections.Generic;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class CompleteInteriorListingDTO
    {
        public int InteriorCatgID { get; set; }
        public CategoryMasterDTO Category { get; set; }
        public List<ProductMasterDTO> Products { get; set; }
        public decimal? Multiplier { get; set; }
        public decimal? Divisor { get; set; }
        public int WebPartType { get; set; }
        public bool isMultiSelect { get; set; }
        public bool IsDefault { get; set; }
    }
}
