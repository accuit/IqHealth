using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{
    [Table("PackageCategory")]
    [DataContract]
    public partial class PackageCategory
    {

        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(255)]
        public string Name { get; set; }

        [DataMember]
        [Required]
        [StringLength(255)]
        public string Title { get; set; }

        [DataMember]
        [StringLength(500)]
        public string SubTitle { get; set; }

        [DataMember]
        [StringLength(1005)]
        public string ImageUrl { get; set; }

        [StringLength(1500)]
        public string About { get; set; }

        public int IsDeleted { get; set; }

        public int? CompanyID { get; set; }

        public virtual CompanyMaster CompanyMaster { get; set; }


        [DataMember]
        public List<PackageMaster> PackageMasters { get; set; }
    }
}
