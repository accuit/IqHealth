using System.Collections.Generic;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;

namespace HealthIQ.BusinessLayer.Services.Contracts
{
    public interface ISecurityService
    {
        List<RoleMasterDTO> GetRoles();
        List<UserRoleDTO> GetUserRoles(int userId);
        string[] GetUserRoleNames(int userId);
        bool SaveOTP(OTPDTO otp);
        bool ValidateGUID(string GUID);
        bool ChangePassword(string GUID, string Password);
        EmailTemplateDTO GetEmailTemplate(AspectEnums.EmailTemplateType TemplateTypeID);

    }
}
