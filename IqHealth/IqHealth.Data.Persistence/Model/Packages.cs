using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{
    [Table("tbl_test_packages")]
    public class Packages
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public decimal Cost { get; set; }

        public decimal Status { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public bool IsDeleted { get; set; }

        //public ICollection<MedicalTests> MedicalTests { get; set; }
    }
}
