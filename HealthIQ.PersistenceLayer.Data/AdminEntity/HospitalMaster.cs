namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HospitalMaster")]
    public partial class HospitalMaster
    {
        public int ID { get; set; }

        [Required]
        [StringLength(245)]
        public string Name { get; set; }

        public int Type { get; set; }

        [StringLength(245)]
        public string Address { get; set; }

        public int City { get; set; }

        public int? State { get; set; }

        [StringLength(10)]
        public string PinCode { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }
    }
}
