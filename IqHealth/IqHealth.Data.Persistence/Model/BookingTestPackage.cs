namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BookingTestPackage")]
    public partial class BookingTestPackage
    {
        public int ID { get; set; }

        public int? BookingID { get; set; }

        public int? TestID { get; set; }

        public int? PackageID { get; set; }
    }
}
