using System;

namespace HealthIQ.BusinessLayer.Services.BO
{
    public class UserProfileBO
    {
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool isDeleted { get; set; }
        public string LoginName { get; set; }
        public string Password { get; set; }
        public DateTime? JoiningDate { get; set; }
        public string ImagePath { get; set; }
        public string UserCode { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public int AccountStatus { get; set; }
        public bool IsAdmin { get; set; }
        public int RoleID { get; set; }
        public int? CategoryID { get; set; }
        public int userRoleID { get; set; }

        public DateTime? PurchaseDate { get; set; }
        public bool IsEmployee { get; set; }
        public int CompanyID { get; set; }
    }

}
