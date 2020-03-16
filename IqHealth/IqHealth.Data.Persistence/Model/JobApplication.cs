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

    [Table("JobApplication")]
    [DataContract]
    public partial class JobApplication
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [DataMember]
        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [DataMember]
        [Required]
        [StringLength(250)]
        public string Email { get; set; }

        [DataMember]
        [Required]
        [StringLength(10)]
        public string Phone { get; set; }

        [DataMember]
        [StringLength(5000)]
        public string ResumeText { get; set; }

        [DataMember]
        [StringLength(1500)]
        public string ResumePath { get; set; }

        [DataMember]
        [StringLength(500)]
        public string Address { get; set; }

        [DataMember]
        [StringLength(50)]
        public string City { get; set; }

        [DataMember]
        [StringLength(10)]
        public string ZipCode { get; set; }

        [DataMember]
        public int CompanyID { get; set; }

        [DataMember]
        public DateTime? CreatedDate { get; set; }
    }
}
