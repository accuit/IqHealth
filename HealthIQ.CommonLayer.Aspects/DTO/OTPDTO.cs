using System;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class OTPDTO
    {
        public long OTPMasterID { get; set; }
        public long UserID { get; set; }
        public string GUID { get; set; }
        public string OTP { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? Attempts { get; set; }
    }
}
