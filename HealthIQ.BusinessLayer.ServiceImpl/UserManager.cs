using System;
using System.Collections.Generic;
using System.Linq;
using AutoMapper;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects.Security;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using Unity;

namespace HealthIQ.BusinessLayer.Base
{
    public class UserManager : ServiceBase, IUserService
    {
        [Dependency(ContainerDataLayerInstanceNames.USER_REPOSITORY)]
        public IUserRepository UserRepository { get; set; }

        [Dependency(ContainerDataLayerInstanceNames.SECURITY_REPOSITORY)]
        public ISecurityRepository SecurityRepository { get; set; }
        private readonly IMapper mapper;

        public UserManager(IMapper mapper)
        {
            this.mapper = mapper;
        }

        public UserMasterDTO UserLogin(string email, string password)
        {
            UserMaster result = UserRepository.UserLogin(email, password);
            var user = mapper.Map<UserMasterDTO>(result);
            user.Roles = SecurityRepository.GetUserRoles(user.UserID).Select(x => x.RoleMaster.Name).ToArray();

            return user;
        }

        public UserMasterDTO GetUserByEmail(string email)
        {
            return mapper.Map<UserMasterDTO>(UserRepository.GetUserByEmail(EncryptionEngine.EncryptString(email)));
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
            throw new NotImplementedException();
        }

        public List<UserMasterDTO> GetUsersByStatus(int status)
        {
            var result = UserRepository.GetUsersByStatus(status);
            foreach (var user in result)
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
            return mapper.Map<UserMasterDTO>(UserRepository.GetUserByID(id));
        }

        public List<UserMasterDTO> GetAllUsers()
        {
            var result = mapper.Map<List<UserMasterDTO>>(UserRepository.GetAllUsers());
            return result;
        }

    }
}
