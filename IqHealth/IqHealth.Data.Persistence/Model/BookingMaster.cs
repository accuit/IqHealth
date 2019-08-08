using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{

    [Table("BookingMaster")]
    public partial class BookingMaster
    {

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BookingMaster()
        {
            BookingTestPackages = new HashSet<BookingTestPackage>();
        }


        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required]
        [StringLength(45)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(45)]
        public string LastName { get; set; }

        public int Age { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        public int Sex { get; set; }

        public DateTime? BookingDate { get; set; }

        public int CollectionType { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [Required]
        [StringLength(50)]
        public string City { get; set; }

        [StringLength(250)]
        public string Landmark { get; set; }

        [StringLength(10)]
        public string PinCode { get; set; }

        public DateTime CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BookingTestPackage> BookingTestPackages { get; set; }
    }
}
