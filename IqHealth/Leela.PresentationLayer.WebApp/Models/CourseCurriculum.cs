namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CourseCurriculum")]
    public partial class CourseCurriculum
    {
        public int ID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        public int CourseMasterID { get; set; }

        public int? SubCourcesID { get; set; }
    }
}
