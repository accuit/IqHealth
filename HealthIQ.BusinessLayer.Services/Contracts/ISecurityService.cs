using System.Collections.Generic;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;

namespace HealthIQ.BusinessLayer.Services.Contracts
{
    public interface ISecurityService
    {
        List<RoleMasterDTO> GetRoles();
        List<UserRoleDTO> GetUserRoles(int userId);
        /// <summary>
        /// save OTP (One Time Password) to database
        /// </summary>
        /// <param name="otp"> Object of OTP</param>
        /// <returns>returns true when data is saved</returns>
        bool SaveOTP(OTPDTO otp);
        bool ValidateGUID(string GUID);
        bool ChangePassword(string GUID, string Password);
        EmailTemplateDTO GetEmailTemplate(AspectEnums.EmailTemplateType TemplateTypeID);

    }
}
