

using HealthIQ.PersistenceLayer.Data.AdminEntity;
using System.Collections.Generic;

namespace HealthIQ.PersistenceLayer.Data.Repository
{
    public interface IUserRepository
    {
        UserMaster UserLogin(string email, string password);
        UserMaster GetUserByEmail(string email);
        List<UserMaster> GetUsersByStatus(int status);
        long RegisterUser(UserMaster user);
    }
}
