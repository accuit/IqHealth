namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ServiceQuestion
    {
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(500)]
        public string Title { get; set; }

        [Required]
        public string Answer { get; set; }

        [StringLength(1000)]
        public string ImageUrl { get; set; }

        [StringLength(5)]
        public string ServiceCode { get; set; }

        public int? ServiceID { get; set; }

        public virtual HealthServiceMaster HealthServiceMaster { get; set; }
    }
}
