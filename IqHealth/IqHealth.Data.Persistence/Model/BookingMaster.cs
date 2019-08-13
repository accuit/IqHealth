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
    [Table("BookingMaster")]
    public partial class BookingMaster
    {

        [DataMember]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [DataMember]
        [Required]
        [StringLength(45)]
        public string FirstName { get; set; }

        [DataMember]
        [Required]
        [StringLength(45)]
        public string LastName { get; set; }

        [DataMember]
        public int Age { get; set; }


        [DataMember]
        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [Required]
        [DataMember]
        [StringLength(150)]
        public string Email { get; set; }

        [Required]
        [DataMember]
        public int Sex { get; set; }

        [Required]
        [DataMember]
        public DateTime? BookingDate { get; set; }

        [Required]
        [DataMember]
        public int CollectionType { get; set; }

        [Required]
        [DataMember]
        [StringLength(250)]
        public string Address { get; set; }

        [Required]
        [DataMember]
        [StringLength(50)]
        public string City { get; set; }


        [DataMember]
        [StringLength(250)]
        public string Landmark { get; set; }

        [Required]
        [DataMember]
        [StringLength(10)]
        public string PinCode { get; set; }


        public DateTime CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        [Required]
        [DataMember]
        public int? PackageID { get; set; }


        [DataMember]
        public int? TestID { get; set; }

        [NotMapped]
        public virtual PackageMaster PackageMaster { get; set; }

        [NotMapped]
        public virtual TestMaster TestMaster { get; set; }

    }
}
