namespace HealthIQ.BusinessLayer.Services.BO
{
    public class UserRoleBO
    {
        public byte UserRoleID { get; set; }
        public int? UserID { get; set; }
        public byte? RoleID { get; set; }
        public bool? IsDeleted { get; set; }

        public virtual RoleMasterBO RoleMaster { get; set; }
        public virtual UserMasterBO UserMaster { get; set; }
    }
}
