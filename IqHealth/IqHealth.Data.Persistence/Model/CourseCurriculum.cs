
namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [Table("CourseCurriculum")]
    [DataContract]
    public partial class CourseCurriculum
    {
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [DataMember]
        public int CourseMasterID { get; set; }

        [DataMember]
        public int? SubCourcesID { get; set; }

        public virtual CourseMaster CourseMaster { get; set; }
    }
}
