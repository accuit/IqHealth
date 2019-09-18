using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;
using System.Runtime.Serialization;

namespace IqHealth.Data.Persistence.Model
{
    [Table("CommonSetup")]
    [DataContract]
    public partial class CommonSetup
    {
        [DataMember]
        public int ID { get; set; }

        [Required]
        [DataMember]
        [StringLength(50)]
        public string MainType { get; set; }

        [Required]
        [DataMember]
        [StringLength(50)]
        public string SubType { get; set; }

        [Required]
        [DataMember]
        [StringLength(150)]
        public string DisplayText { get; set; }

        [DataMember]
        public int DisplayValue { get; set; }

        [DataMember]
        public int? ParentID { get; set; }

        public bool? isDeleted { get; set; }
    }
}
