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
    [Table("OnlineEnquiry")]
    [DataContract]
    public partial class OnlineEnquiry
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        public int Type { get; set; }

        [DataMember]
        public int? TypeValue { get; set; }

        [DataMember]
        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [DataMember]
        [Required]
        [StringLength(250)]
        public string Email { get; set; }

        [DataMember]
        [Required]
        [StringLength(15)]
        public string Phone { get; set; }

        [DataMember]
        [StringLength(15)]
        public string AltPhone { get; set; }

        [DataMember]
        [StringLength(500)]
        public string Subject { get; set; }

        [DataMember]
        [StringLength(1500)]
        public string Message { get; set; }

        [DataMember]
        public int Status { get; set; }

        [DataMember]
        [StringLength(250)]
        public string Address { get; set; }

        [DataMember]
        [StringLength(150)]
        public string Place { get; set; }

        [DataMember]
        [StringLength(100)]
        public string City { get; set; }

        [DataMember]
        [StringLength(45)]
        public string State { get; set; }

        [DataMember]
        public int Country { get; set; }

        [DataMember]
        [StringLength(10)]
        public string CaptchaText { get; set; }

        [DataMember]
        public int CaptchaVerified { get; set; }

        [DataMember]
        public int CompanyID { get; set; }

        [DataMember]
        public DateTime? CreatedDate { get; set; }
    }
}
