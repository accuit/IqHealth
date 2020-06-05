namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AddressMaster")]
    public partial class AddressMaster
    {
        [Key]
        public int AddressID { get; set; }

        [StringLength(250)]
        public string Address1 { get; set; }

        [StringLength(250)]
        public string Address2 { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [Required]
        [StringLength(50)]
        public string State { get; set; }

        public int Country { get; set; }

        public int PinCode { get; set; }

        public int? AddressType { get; set; }

        public int? AddressStatus { get; set; }

        public DateTime CreatedDate { get; set; }

        public int CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public int? ModifiedBy { get; set; }

        public bool IsDeleted { get; set; }

        public int? UserID { get; set; }

        public int? AddressOwnerType { get; set; }

        public int? AddressOwnerTypePKID { get; set; }

        public int? VenueID { get; set; }

        [StringLength(50)]
        public string Lattitude { get; set; }

        [StringLength(50)]
        public string Longitude { get; set; }
    }
}
