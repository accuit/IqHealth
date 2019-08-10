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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BookingMaster()
        {
            BookingTestPackages = new HashSet<BookingTestPackage>();
        }

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

        [DataMember]
        [StringLength(150)]
        public string Email { get; set; }

        [DataMember]
        public int Sex { get; set; }

        [DataMember]
        public DateTime? BookingDate { get; set; }

        [DataMember]
        public int CollectionType { get; set; }

        [DataMember]
        [StringLength(250)]
        public string Address { get; set; }

        [DataMember]
        [Required]
        [StringLength(50)]
        public string City { get; set; }

        [DataMember]
        [StringLength(250)]
        public string Landmark { get; set; }

        [DataMember]
        [StringLength(10)]
        public string PinCode { get; set; }

        public DateTime CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        [DataMember]
        public int Status { get; set; }

        [DataMember]
        public int? PackageID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingTestPackage> BookingTestPackages { get; set; }
    }
}
