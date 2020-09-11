using System;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class EmailModel
    {
        public string Name { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
        public string Mobile { get; set; }
        public string Phone { get; set; }
        public int Age { get; set; }
        public int Sex { get; set; }
        public DateTime BookingDate { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CompanyID { get; set; }
    }
}
