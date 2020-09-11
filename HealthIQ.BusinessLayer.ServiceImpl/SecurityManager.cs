using System.Collections.Generic;
using System.Linq;
using HealthIQ.BusinessLayer.Base;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using Unity;

namespace HealthIQ.BusinessLayer.ServiceImpl
{
    public class SecurityManager : ServiceBase, ISecurityService
    {
        [Dependency(ContainerDataLayerInstanceNames.SECURITY_REPOSITORY)]
        public ISecurityRepository SecurityRepository { get; set; }

        public List<RoleMasterDTO> GetRoles()
        {
            List<RoleMasterDTO> roles = new List<RoleMasterDTO>();
            ObjectMapper.Map(SecurityRepository.GetRoles(), roles);
            return roles;
        }
        public List<UserRoleDTO> GetUserRoles(int userId)
        {
            List<UserRoleDTO> roles = new List<UserRoleDTO>();
            ObjectMapper.Map(SecurityRepository.GetUserRoles(userId), roles);
            return roles;
        }

        public string[] GetUserRoleNames(int userId)
        {
            return SecurityRepository.GetUserRoles(userId).Select(x => x.RoleMaster.Name).ToArray();
        }
        public bool SaveOTP(OTPDTO otp)
        {
            OTPMaster otpmaster = new OTPMaster();
            ObjectMapper.Map(otp, otpmaster);
            return SecurityRepository.SaveOTP(otpmaster);
        }

        public bool ChangePassword(string GUID, string Password)
        {
            return SecurityRepository.ChangePassword(GUID, Password);
        }

        public bool ValidateGUID(string GUID)
        {
            return SecurityRepository.ValidateGUID(GUID);
        }

        /// <summary>
        /// Get Email Template based on ID
        /// </summary>
        /// <param name="TemplateTypeID">Template ID</param>
        /// <returns>Obejct of EmailTemplate</returns>
        public EmailTemplateDTO GetEmailTemplate(AspectEnums.EmailTemplateType TemplateTypeID)
        {
            EmailTemplateDTO emailTemplate = new EmailTemplateDTO();
            ObjectMapper.Map(SecurityRepository.GetEmailTemplate(TemplateTypeID), emailTemplate);
            return emailTemplate;
        }
    }
}
