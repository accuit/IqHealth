using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{

    [Table("tbl_medical_tests")]
    public class MedicalTests
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public int Type { get; set; }

        public string PreTestInfo { get; set; }

        public int ResultInHours { get; set; }

        public string Components { get; set; }

        public decimal Cost { get; set; }

        public int PackageID { get; set; }

        public DateTime? CreatedDate { get; set; }

        public DateTime? UpdatedDate { get; set; }

        public bool IsDeleted { get; set; }

    }
}
