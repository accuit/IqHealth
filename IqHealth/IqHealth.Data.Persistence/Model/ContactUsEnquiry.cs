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

    [Table("ContactUsEnquiry")]
    [DataContract]
    public partial class ContactUsEnquiry
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [DataMember]
        [Required]
        [StringLength(150)]
        public string Email { get; set; }

        [DataMember]
        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string Message { get; set; }

        [DataMember]
        public int Status { get; set; }

        [DataMember]
        public bool IsDeleted { get; set; }

        [DataMember]
        public int CompanyID { get; set; }

        [DataMember]
        public DateTime? CreatedDate { get; set; }
    }

}
