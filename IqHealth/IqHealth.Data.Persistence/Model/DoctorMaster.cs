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
    [Table("DoctorMaster")]
    public partial class DoctorMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DoctorMaster()
        {
            DoctorAppointments = new HashSet<DoctorAppointment>();
            DoctorSpecialities = new HashSet<DoctorSpeciality>();
        }

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
        public DateTime? DateOfBirth { get; set; }

        [DataMember]
        public int Experience { get; set; }

        [DataMember]
        [StringLength(250)]
        public string Specialist { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [DataMember]
        [StringLength(150)]
        public string Hospital { get; set; }

        [DataMember]
        [StringLength(250)]
        public string Designation { get; set; }

        [DataMember]
        public int Sequence { get; set; }

        [DataMember]
        [StringLength(500)]
        public string About { get; set; }

        [DataMember]
        [StringLength(1000)]
        public string LogoUrl { get; set; }

        public int IsDeleted { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        [DataMember]
        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [DataMember]
        [StringLength(250)]
        public string Email { get; set; }

        [DataMember]
        [StringLength(45)]
        public string RegistrationNo { get; set; }

        public int? HospitalID { get; set; }

        [DataMember]
        public int? SpecialityID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorAppointment> DoctorAppointments { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorSpeciality> DoctorSpecialities { get; set; }

        [DataMember]
        public virtual HospitalMaster HospitalMaster { get; set; }

        [DataMember]
        public virtual SpecialityMaster SpecialityMaster { get; set; }
    }
}
