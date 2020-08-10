using AutoMapper;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects.Security;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using System.Collections.Generic;

namespace HealthIQ.BusinessLayer.Base
{
    public class UserManager : ServiceBase, IUserService
    {
        [Unity.Dependency(ContainerDataLayerInstanceNames.USER_REPOSITORY)]
        public IUserRepository UserRepository { get; set; }
        private readonly IMapper mapper;

        public UserManager(IMapper mapper)
        {
            this.mapper = mapper;
        }

        public UserMasterDTO UserLogin(string email, string password)
        {
            UserMasterDTO User = new UserMasterDTO();
            UserMaster result = UserRepository.UserLogin(email, password);
            User = mapper.Map<UserMasterDTO>(result);
           
            return User;
        }

        public UserMasterDTO GetUserByEmail(string email)
        {
            return mapper.Map<UserMasterDTO>(UserRepository.GetUserByEmail(email));
        }

        public int RegisterUser(UserMasterDTO user)
        {
            UserMaster U = mapper.Map<UserMaster>(user);           
            U.UserID = UserRepository.RegisterUser(U);
            if (U.UserID > 0)
            {
                UserRepository.AddUserRole(U, user.IsAdmin);
            }
            return U.UserID;
        }

        public int UpdateUser(UserMasterDTO user)
        {
            UserMaster U = mapper.Map<UserMaster>(user);
            return UserRepository.RegisterUser(U);
        }

        public bool LogoutWebUser(int loggenInUserID, string sessionID)
        {
            throw new System.NotImplementedException();
        }

        public List<UserMasterDTO> GetUsersByStatus(int status)
        {
            var result = UserRepository.GetUsersByStatus(status);
            foreach(var user in result)
            {
                user.Email = EncryptionEngine.DecryptString(user.Email);
            }
            return mapper.Map<List<UserMasterDTO>>(result);
        }

        public UserMasterDTO GetUserByGUID(string GUID)
        {
            var result = UserRepository.GetUserByGUID(GUID);
            return mapper.Map<UserMasterDTO>(result);
        }

        public UserMasterDTO GetUserByID(int id)
        {
            var result = UserRepository.GetUserByID(id);
            result.Email = EncryptionEngine.DecryptString(result.Email);
            result.Password = EncryptionEngine.DecryptString(result.Password);
            return mapper.Map<UserMasterDTO>(result);
        }

    }
}
