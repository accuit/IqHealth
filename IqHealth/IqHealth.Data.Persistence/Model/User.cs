using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace IqHealth.Data.Persistence.Model
{
  

    [Table("tbl_User")]
    public class User
    {
        [Key]
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }

        public string UserName { get; set; }

        public string Password { get; set; }

        public DateTime DateOfBirth { get; set; }

        public int BloodGroup { get; set; }

        public string Address { get; set; }

        public string City { get; set; }

        public int State { get; set; }

        public int UserStatus { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public Boolean IsDeleted { get; set; }

        //public List<Login> Login { get; set; }
    }

    public class UserLogin
    {
        public string username { get; set; }
        public string password { get; set; }
    }
}