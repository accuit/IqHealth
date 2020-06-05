using HealthIQ.BusinessLayer.Base;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.Repository;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.BusinessLayer.Services.Contracts;

namespace HealthIQ.BusinessLayer.ServiceImpl
{
    public class SecurityManager : ServiceBase, ISecurityService
    {
        [Unity.Dependency(ContainerDataLayerInstanceNames.SECURITY_REPOSITORY)]
        public ISecurityRepository SecurityRepository { get; set; }


        public bool SaveOTP(OTPDTO otp)
        {
            OTPMaster otpmaster = new OTPMaster();
            ObjectMapper.Map(otp, otpmaster);
            return SecurityRepository.SaveOTP(otpmaster);
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
