using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.Model
{
    [DataContract]
    public partial class DoctorSpeciality
    {
        [DataMember]
        public int ID { get; set; }

        [DataMember]
        public int DoctorID { get; set; }

        [DataMember]
        public int SpecialityID { get; set; }

        
        [DataMember]
        public string FirstName { get; set; }

        
        [DataMember]
        public string LastName { get; set; }

        [NotMapped]
        [DataMember]
        public string Speciality { get; set; }
        
        public virtual DoctorMaster DoctorMaster { get; set; }

        public virtual SpecialityMaster SpecialityMaster { get; set; }
    }
}

