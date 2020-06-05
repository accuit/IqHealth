using HealthIQ.CommonLayer.Aspects;
using HealthIQ.PersistenceLayer.Data.AdminEntity;

namespace HealthIQ.PersistenceLayer.Data.Repository
{
    public interface ISecurityRepository
    {
        /// <summary>
        /// Get Email Template based on ID
        /// </summary>
        /// <param name="TemplateTypeID">Template ID</param>
        /// <returns>Obejct of EmailTemplate</returns>
        EmailTemplate GetEmailTemplate(AspectEnums.EmailTemplateType TemplateTypeID);

        /// <summary>
        /// save OTP (One Time Password) to database
        /// </summary>
        /// <param name="otp"> Object of OTP</param>
        /// <returns>returns true when data is saved</returns>
        bool SaveOTP(OTPMaster otp);

        /// <summary>
        /// Validate GUID in the link of forget password email
        /// </summary>
        /// <param name="GUID"> uniqe string </param>
        /// <returns>true if GUID in the URL is correct</returns>
        bool ValidateGUID(string GUID);

        // <summary>
        /// Change password of User
        /// </summary>
        /// <param name="GUID"> uniqe string </param>
        /// <param name="Password">password entered by user</param>
        /// <returns></returns>
       // bool ChangePassword(string GUID, string Password);
    }
}
