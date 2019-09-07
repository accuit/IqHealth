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
    [DataContract]
    [Table("DoctorAppointment")]
    public partial class DoctorAppointment
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(45)]
        public string Name { get; set; }

        [DataMember]
        public int Age { get; set; }

        [DataMember]
        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [DataMember]
        [StringLength(150)]
        public string Email { get; set; }

        [DataMember]
        public int Sex { get; set; }

        [DataMember]
        public DateTime? BookingDate { get; set; }

        [DataMember]
        public int? DoctorID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        [DataMember]
        public int Status { get; set; }

        [DataMember]
        public int? CompanyID { get; set; }

        public virtual DoctorMaster DoctorMaster { get; set; }
    }
}
