using System.Collections.Generic;
using HealthIQ.CommonLayer.Aspects.DTO;

namespace HealthIQ.BusinessLayer.Services.Contracts
{
    public interface IUserService
    {
        UserMasterDTO UserLogin(string email, string password);
        UserMasterDTO GetUserByEmail(string email);
        List<UserMasterDTO> GetUsersByStatus(int status);
        List<UserMasterDTO> GetAllUsers();
        int RegisterUser(UserMasterDTO user);
        int UpdateUser(UserMasterDTO user);
        bool LogoutWebUser(int loggenInUserID, string sessionID);
        UserMasterDTO GetUserByGUID(string GUID);
        UserMasterDTO GetUserByID(int id);
    }
}
