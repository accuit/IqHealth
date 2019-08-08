using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{

    [Table("DoctorAppointment")]
    public partial class DoctorAppointment
    {
        public int ID { get; set; }

        [Required]
        [StringLength(45)]
        public string Name { get; set; }

        public int Age { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        public int Sex { get; set; }

        public DateTime? BookingDate { get; set; }

        public int? DoctorID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        public virtual DoctorMaster DoctorMaster { get; set; }
    }
}
