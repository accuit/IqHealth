namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TestPackage")]
    public partial class TestsPackage
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int PackageID { get; set; }

        public int TestID { get; set; }

        
        public DateTime CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        
        public DateTime? UpdatedDate { get; set; }

        public int? CreatedBy { get; set; }

        public virtual PackageMaster PackageMaster { get; set; }

        public virtual TestMaster TestMaster { get; set; }
    }
}
