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
    [Table("UploadedReports")]
    [DataContract]
    public class UploadedReports
    {
        [Required]
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        public int UserID { get; set; }

        [DataMember]
        [Required]
        [StringLength(50)]
        public string FileName { get; set; }

        [DataMember]
        [Required]
        public byte[] File { get; set; }


        [DataMember]
        public DateTime UploadedDate { get; set; }

        [Required]
        [DataMember]
        public int UploadedBy { get; set; }

        [Required]
        public bool IsDeleted { get; set; }

        [Required]
        [DataMember]
        public int CompanyID { get; set; }
    }
}
