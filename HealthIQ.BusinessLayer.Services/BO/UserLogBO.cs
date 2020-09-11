using System;

namespace HealthIQ.BusinessLayer.Services.BO
{
    public class UserLogBO
    {
        public byte LogID { get; set; }
        public int? UserID { get; set; }
        public DateTime? LoginDate { get; set; }
        public bool? Status { get; set; }
        public DateTime? LogOutDate { get; set; }
    }
}
