﻿using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;

namespace HealthIQ.BusinessLayer.Services.Contracts
{
    public interface ISecurityService
    {
        /// <summary>
        /// save OTP (One Time Password) to database
        /// </summary>
        /// <param name="otp"> Object of OTP</param>
        /// <returns>returns true when data is saved</returns>
        bool SaveOTP(OTPDTO otp);

        EmailTemplateDTO GetEmailTemplate(AspectEnums.EmailTemplateType TemplateTypeID);
    }
}
