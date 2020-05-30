namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DoctorSpeciality
    {
        public int ID { get; set; }

        public int DoctorID { get; set; }

        public int SpecialityID { get; set; }
    }
}
