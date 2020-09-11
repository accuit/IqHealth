using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Diagnostics.CodeAnalysis;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    [Table("UserMaster")]
    public class UserMaster
    {
        [SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UserMaster()
        {
            LoginAttemptHistories = new HashSet<LoginAttemptHistory>();
            StudentInvoices = new HashSet<StudentInvoice>();
            UserRoles = new HashSet<UserRole>();
            UserServiceAccesses = new HashSet<UserServiceAccess>();
            UserSystemSettings = new HashSet<UserSystemSetting>();
        }

        [Key]
        public int UserID { get; set; }

        [Required]
        [StringLength(40)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        public bool IsDeleted { get; set; }

        [StringLength(150)]
        public string LoginName { get; set; }

        [StringLength(30)]
        public string Password { get; set; }

        [StringLength(1500)]
        public string ImagePath { get; set; }

        [StringLength(20)]
        public string UserCode { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        public int? AccountStatus { get; set; }

        public bool IsActive { get; set; }

        public int? SeniorEmpID { get; set; }

        public bool IsEmployee { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public int? ModifiedBy { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Mobile { get; set; }

        public int CompanyId { get; set; }

        public bool IsCustomer { get; set; }

        public bool IsStudent { get; set; }

        public string Image { get; set; }

        [StringLength(500)]
        public string Address { get; set; }

        public int? City { get; set; }

        public int? State { get; set; }

        public int? Country { get; set; }

        [StringLength(10)]
        public string Pin { get; set; }

        [SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LoginAttemptHistory> LoginAttemptHistories { get; set; }

        [SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentInvoice> StudentInvoices { get; set; }

        [SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserRole> UserRoles { get; set; }

        [SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserServiceAccess> UserServiceAccesses { get; set; }

        [SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserSystemSetting> UserSystemSettings { get; set; }
    }
}
