using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{
    [Table("tbl_Doctors")]
    public class Doctor
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string Mobile { get; set; }

        public string Designation { get; set; }

        public DateTime DateOfBirth { get; set; }

        public int Experience { get; set; }

        public int Specialist { get; set; }

        public string ImageUrl { get; set; }

        public string Hospital { get; set; }

        public string About { get; set; }

        public string LogoUrl { get; set; }

        public string RegistrationNo { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public Boolean IsDeleted { get; set; }
    }
}
