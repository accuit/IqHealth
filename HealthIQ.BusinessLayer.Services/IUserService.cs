using HealthIQ.CommonLayer.Aspects.DTO;
using System.Collections.Generic;

namespace HealthIQ.BusinessLayer.Services
{
    public interface IUserService
    {
        UserMasterDTO UserLogin(string email, string password);
        UserMasterDTO GetUserByEmail(string email);
        List<UserMasterDTO> GetUsersByStatus(int status);
        long RegisterUser(UserMasterDTO user);
        bool LogoutWebUser(int loggenInUserID, string sessionID);
    }
}
