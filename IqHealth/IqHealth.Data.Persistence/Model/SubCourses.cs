using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Runtime.Serialization;

    [Table("SubCourses")]
    [DataContract]
    public partial class SubCourses
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [DataMember]
        public int Duration { get; set; }

        [DataMember]
        [StringLength(250)]
        public string MinQualification { get; set; }

        [DataMember]
        public int MinAge { get; set; }

        [DataMember]
        public int? MaxAge { get; set; }

        [DataMember]
        public decimal IndianAdmissionFee { get; set; }

        [DataMember]
        public decimal ForeignAdmissionFee { get; set; }

        [DataMember]
        public decimal? IndianOtherFee { get; set; }

        [DataMember]
        public decimal? ForeignOtherFee { get; set; }

        [DataMember]
        public int CourseMasterID { get; set; }

        [DataMember]
        public int CompanyID { get; set; }

        public virtual CompanyMaster CompanyMaster { get; set; }

        public virtual CourseMaster CourseMaster { get; set; }
    }
}
