using System.Collections.Generic;
using HealthIQ.PersistenceLayer.Data.AdminEntity;

namespace HealthIQ.PersistenceLayer.Data.Repository
{
    public interface IUserRepository
    {
        UserMaster UserLogin(string email, string password);
        UserMaster GetUserByEmail(string email);
        List<UserMaster> GetUsersByStatus(int status);
        List<UserMaster> GetAllUsers();
        int RegisterUser(UserMaster user);
        int AddUserRole(UserMaster user, bool isAdmin);
        UserMaster GetUserByGUID(string GUID);
        UserMaster GetUserByID(int id);
    }
}
