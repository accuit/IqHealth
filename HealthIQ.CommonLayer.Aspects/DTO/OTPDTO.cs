using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class OTPDTO
    {
        public long OTPMasterID { get; set; }
        public long UserID { get; set; }
        public string GUID { get; set; }
        public string OTP { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> Attempts { get; set; }
    }
}
