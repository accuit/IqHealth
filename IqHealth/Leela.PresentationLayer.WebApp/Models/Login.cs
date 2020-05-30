namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Login")]
    public partial class Login
    {
        [Key]
        [Column(Order = 0)]
        public int Id { get; set; }

        public int? UserID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(20)]
        public string Password { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? LastLoginDate { get; set; }

        public int? LastLoginStatus { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? LoginDate { get; set; }
    }
}
