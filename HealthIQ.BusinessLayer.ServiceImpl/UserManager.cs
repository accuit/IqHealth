using AutoMapper;
using HealthIQ.BusinessLayer.Services;
using HealthIQ.BusinessLayer.Services.BO;
using HealthIQ.CommonLayer.Aspects.DTO;
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
            UserMasterDTO user = new UserMasterDTO();
            UserMaster result = UserRepository.UserLogin(email, password);
            user = mapper.Map<UserMasterDTO>(result);
            ObjectMapper.Map(UserRepository.UserLogin(email, password), user);

            return mapper.Map<UserMasterDTO>(UserRepository.UserLogin(email, password));
        }

        public UserMasterDTO GetUserByEmail(string email)
        {
            return mapper.Map<UserMasterDTO>(UserRepository.GetUserByEmail(email));
        }

        public long RegisterUser(UserMasterDTO user)
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
            return mapper.Map<List<UserMasterDTO>>(result);
        }

        //public int GetUserRoleID(int userID)
        //{
        //    return UserRepository.GetUserRoleID(userID);
        //}
    }
}
