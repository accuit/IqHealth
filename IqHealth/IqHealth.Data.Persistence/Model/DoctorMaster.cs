using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{
    [Table("DoctorMaster")]
    public partial class DoctorMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DoctorMaster()
        {
            DoctorAppointments = new HashSet<DoctorAppointment>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public int Experience { get; set; }

        [StringLength(250)]
        public string Specialist { get; set; }

        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [StringLength(150)]
        public string Hospital { get; set; }

        [StringLength(250)]
        public string Designation { get; set; }

        [StringLength(500)]
        public string About { get; set; }

        [StringLength(1000)]
        public string LogoUrl { get; set; }

        public int IsDeleted { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        [StringLength(45)]
        public string RegistrationNo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DoctorAppointment> DoctorAppointments { get; set; }
    }
}
