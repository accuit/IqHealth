namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [Table("BookingTestPackage")]
    public partial class BookingTestPackage
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        public int? BookingID { get; set; }

        [DataMember]
        public int? TestID { get; set; }

        [DataMember]
        public int? PackageID { get; set; }

        public virtual BookingMaster BookingMaster { get; set; }

        public virtual PackageMaster PackageMaster { get; set; }
    }
}
