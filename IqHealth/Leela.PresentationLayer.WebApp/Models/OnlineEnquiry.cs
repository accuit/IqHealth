namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OnlineEnquiry")]
    public partial class OnlineEnquiry
    {
        public int ID { get; set; }

        public int Type { get; set; }

        public int? TypeValue { get; set; }

        [Required]
        [StringLength(150)]
        public string Name { get; set; }

        [Required]
        [StringLength(250)]
        public string Email { get; set; }

        [Required]
        [StringLength(15)]
        public string Phone { get; set; }

        [StringLength(15)]
        public string AltPhone { get; set; }

        [StringLength(500)]
        public string Subject { get; set; }

        [StringLength(1500)]
        public string Message { get; set; }

        public int Status { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(150)]
        public string Place { get; set; }

        [StringLength(100)]
        public string City { get; set; }

        [StringLength(45)]
        public string State { get; set; }

        public int Country { get; set; }

        [StringLength(10)]
        public string CaptchaText { get; set; }

        public int CaptchaVerified { get; set; }

        public int CompanyID { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }
    }
}
