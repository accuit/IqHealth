using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.Security;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;

namespace HealthIQ.PersistenceLayer.Data.Impl
{
    public class UserDataImpl : BaseDataImpl, IUserRepository
    {
        public UserMaster UserLogin(string email, string password)
        {
            email = EncryptionEngine.EncryptString(email);
            password = EncryptionEngine.EncryptString(password);
            return HIQAdminContext.UserMasters.FirstOrDefault(x => x.Email == email && x.Password == password);
        }

        public int RegisterUser(UserMaster user)
        {
            if (user.UserID == 0)
            {
                user.IsActive = true;
                user.AccountStatus = 1;
                user.Password = string.IsNullOrEmpty(user.Password) ? "123456" : user.Password;
                user.CreatedDate = DateTime.Now;
                HIQAdminContext.UserMasters.Add(user);
                return HIQAdminContext.SaveChanges() > 0 ? user.UserID : 0;
            }

            UserMaster User = HIQAdminContext.UserMasters.FirstOrDefault(x => x.UserID == user.UserID);
            User.ModifiedBy = user.ModifiedBy;
            User.ModifiedDate = DateTime.Now;
            User.Password = user.Password;
            User.Address = user.Address;
            User.City = user.City;
            User.Mobile = user.Mobile;
            User.Phone = user.Phone;
            User.Pin = user.Pin;
            User.Image = user.Image;
            User.IsDeleted = user.IsDeleted;

            HIQAdminContext.Entry<UserMaster>(User).State = System.Data.Entity.EntityState.Modified;
            return HIQAdminContext.SaveChanges() > 0 ? user.UserID : 0;
        }

        public int AddUserRole(UserMaster user, bool isAdmin)
        {
            int roleId = user.IsEmployee ? (int)AspectEnums.RoleType.Employee : user.IsCustomer ? (int)AspectEnums.RoleType.Customer : (int)AspectEnums.RoleType.Student;

            HIQAdminContext.UserRoles.Add(new UserRole { UserID = user.UserID, RoleID = roleId, CreatedBy = user.CreatedBy, CreatedDate = DateTime.Now, IsActive = true });
            if (isAdmin)
            {
                HIQAdminContext.UserRoles.Add(new UserRole { UserID = user.UserID, RoleID = (int)AspectEnums.RoleType.Admin, CreatedBy = user.CreatedBy, CreatedDate = DateTime.Now, IsActive = true });
            }
            return HIQAdminContext.SaveChanges();
        }

        public UserMaster GetUserByEmail(string email)
        {
            return HIQAdminContext.UserMasters.FirstOrDefault(x => x.Email == email && !x.IsDeleted);
        }

        public List<UserMaster> GetUsersByStatus(int status)
        {
            return HIQAdminContext.UserMasters.Where(x => x.AccountStatus == (int)AspectEnums.UserAccountStatus.Active && x.IsActive && !x.IsDeleted).ToList();
        }

        public UserMaster GetUserByGUID(string GUID)
        {
            OTPMaster objOTP = HIQAdminContext.OTPMasters.FirstOrDefault(x => x.GUID == GUID);
            if (objOTP != null)
                return HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == objOTP.UserID);
            else
                return null;

        }

        public UserMaster GetUserByID(int id)
        {
            return HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == id);
        }
    }
}
