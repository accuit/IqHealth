namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CorporateTieUpEnquiry")]
    public partial class CorporateTieUpEnquiry
    {
        public int ID { get; set; }

        [Required]
        [StringLength(45)]
        public string Name { get; set; }

        [Required]
        [StringLength(15)]
        public string Mobile { get; set; }

        [Required]
        [StringLength(150)]
        public string Email { get; set; }

        [Required]
        [StringLength(100)]
        public string CompanyName { get; set; }

        public int? Designation { get; set; }

        [StringLength(500)]
        public string Address { get; set; }

        public int? City { get; set; }

        public int? State { get; set; }

        [Required]
        [StringLength(1000)]
        public string Message { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? CreatedDate { get; set; }

        public int IsDeleted { get; set; }

        public int Status { get; set; }

        public int? CompanyID { get; set; }
    }
}
