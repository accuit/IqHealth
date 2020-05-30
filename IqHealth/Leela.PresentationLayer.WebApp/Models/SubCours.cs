namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SubCourses")]
    public partial class SubCours
    {
        [Key]
        [Column(Order = 0)]
        public int ID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(250)]
        public string Name { get; set; }

        [Key]
        [Column(Order = 2)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Duration { get; set; }

        [StringLength(250)]
        public string MinQualification { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MinAge { get; set; }

        public int? MaxAge { get; set; }

        [Key]
        [Column(Order = 4, TypeName = "numeric")]
        public decimal IndianAdmissionFee { get; set; }

        [Key]
        [Column(Order = 5, TypeName = "numeric")]
        public decimal ForeignAdmissionFee { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? IndianOtherFee { get; set; }

        [Column(TypeName = "numeric")]
        public decimal? ForeignOtherFee { get; set; }

        [Key]
        [Column(Order = 6)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CourseMasterID { get; set; }

        [Key]
        [Column(Order = 7)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CompanyID { get; set; }
    }
}
