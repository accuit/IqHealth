using HealthIQ.CommonLayer.Aspects;
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
            return HIQAdminContext.UserMasters.Where(x => x.Email == email && x.Password == password).FirstOrDefault();
        }

        public long RegisterUser(UserMaster user)
        {
            HIQAdminContext.UserMasters.Add(user);
            return HIQAdminContext.SaveChanges() > 0 ? user.UserID : 0;
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
            {
                return HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == objOTP.UserID);
            }
            else
            {
                return null;
            }
        }

        public UserMaster GetUserByID(int id)
        {
            return HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == id);

        }
    }
}
