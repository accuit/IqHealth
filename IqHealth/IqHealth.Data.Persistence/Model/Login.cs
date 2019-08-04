namespace IqHealth.Data.Persistence.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Login")]
    public partial class Login
    {
        public int Id { get; set; }

        public int? UserID { get; set; }

        [Required]
        [StringLength(20)]
        public string Password { get; set; }

        
        public DateTime? LastLoginDate { get; set; }

        public int? LastLoginStatus { get; set; }

        
        public DateTime? LoginDate { get; set; }
    }
}
