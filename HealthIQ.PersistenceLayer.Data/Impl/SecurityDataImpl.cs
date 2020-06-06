using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.Utilities;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using System;
using System.Linq;

namespace HealthIQ.PersistenceLayer.Data.Impl
{
    /// <summary>
    /// Implementation class for system/user authorization and security in application
    /// </summary>
    public class SecurityDataImpl : BaseDataImpl, ISecurityRepository
    {
        /// <summary>
        /// Method to fetch user authorization parameters for various modules in application
        /// </summary>
        /// <param name="userID">user ID</param>
        /// <returns>returns entity collection</returns>
        //public IList<SecurityAspect> GetUserAuthorization(long userID)
        //{
        //    return (from urm in HealthIQHIQAdminContext.UserRoleModulePermissions
        //            join rm in HealthIQHIQAdminContext.RoleModules on urm.RoleModuleID equals rm.RoleModuleID
        //            join m in HealthIQHIQAdminContext.Modules on rm.ModuleID equals m.ModuleID
        //            join rl in HealthIQHIQAdminContext.RoleMasters on rm.RoleID equals rl.RoleID
        //            join ur in HealthIQHIQAdminContext.UserRoles on rl.RoleID equals ur.RoleID
        //            join um in HealthIQHIQAdminContext.UserMasters on ur.UserID equals um.UserID
        //            where um.UserID == userID && !um.IsDeleted && !m.IsDeleted && !rl.IsDeleted && urm.PermissionValue.Equals("1")
        //            && ur.IsActive && !ur.IsDeleted
        //            orderby urm.UserRolePermissionID
        //            select new SecurityAspect()
        //            {
        //                ModuleID = m.ModuleID,
        //                PermissionID = urm.PermissionID,
        //                PermissionValue = urm.PermissionValue,
        //                RoleID = ur.RoleID,
        //                UserID = um.UserID,
        //                UserRolePermissionID = urm.UserRolePermissionID,
        //                ModuleCode = m.ModuleCode.HasValue ? m.ModuleCode.Value : 0,
        //            }).ToList();

        //}


        #region Forgot Password Functions
        /// <summary>
        /// Validate Employee if given Employee Code is correct or not
        /// </summary>
        /// <param name="EmplCode">Employee Code of User</param>
        /// <param name="Type">Validation type (Only Employee Code, Employee Code and Email etc)</param>
        /// <returns></returns>
        //public bool ValidateEmployee(long userID, AspectEnums.EmployeeValidationType Type)
        //{
        //    bool IsValid = false;
        //    UserMaster user = null;
        //    //if (Type == AspectEnums.EmployeeValidationType.EmplCode)
        //    //{
        //    //    user = HealthIQHIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
        //    //}
        //    if (Type == AspectEnums.EmployeeValidationType.EmplCode_Email)
        //    {
        //        user = HealthIQHIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == userID && !k.IsDeleted && !string.IsNullOrEmpty(k.EmailID));
        //    }
        //    if (Type == AspectEnums.EmployeeValidationType.FotgotPasswordAttempts)
        //    {

        //        DateTime Today = DateTime.Today;
        //        DateTime Tomorrow = DateTime.Today.AddDays(1);
        //        //UserMaster user1 = HealthIQHIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
        //        //// Check Max Attempts
        //        //if (user1 != null)
        //        //{
        //        int TodaysAttempts = HealthIQHIQAdminContext.OTPMasters.Where(k => k.UserID == userID && k.CreatedDate >= Today && k.CreatedDate < Tomorrow).Count();
        //        int PasswordAttempts = Convert.ToInt32(AppUtil.GetAppSettings(AspectEnums.ConfigKeys.FotgotPasswordAttempts));
        //        IsValid = TodaysAttempts < PasswordAttempts;
        //        //}

        //    }
        //    if (Type == AspectEnums.EmployeeValidationType.LastAttemptDuration)
        //    {
        //        DateTime Now = DateTime.Now;
        //        //UserMaster user1 = HealthIQHIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
        //        //// Check Last Attempt
        //        //if (user1 != null)
        //        //{
        //        string LastAttemptDuration = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.LastAttemptDuration);
        //        string[] TimeArr = LastAttemptDuration.Split(':');

        //        DateTime LastAttemptStart = Now.Subtract(new TimeSpan(Int32.Parse(TimeArr[0]), Int32.Parse(TimeArr[1]), Int32.Parse(TimeArr[2])));

        //        IsValid = HealthIQHIQAdminContext.OTPMasters.Where(k => k.UserID == userID && k.CreatedDate >= LastAttemptStart && k.CreatedDate < Now).Count() <= 0;


        //        //}

        //    }

        //    if (user != null)
        //        IsValid = true;

        //    return IsValid;
        //}

        /// <summary>
        /// Get Email Template based on ID
        /// </summary>
        /// <param name="TemplateTypeID">Template ID</param>
        /// <returns>Obejct of EmailTemplate</returns>
        public EmailTemplate GetEmailTemplate(AspectEnums.EmailTemplateType TemplateTypeID)
        {
            return HIQAdminContext.EmailTemplates.FirstOrDefault(k => k.TemplateID == (int)TemplateTypeID && k.IsActive);
        }

        /// <summary>
        /// save OTP (One Time Password) to database
        /// </summary>
        /// <param name="otp"> Object of OTP</param>
        /// <returns>returns true when data is saved</returns>
        public bool SaveOTP(OTPMaster otp)
        {
            bool IsSuccess = false;
            // In case from Generating OTP from Automatic redirect to Change Password because of not complex password multiple OTPs can be generated
            // Use this validation to restrict user to generate multiple OTPs
            //if (ValidateEmployee(otp.UserID, AspectEnums.EmployeeValidationType.LastAttemptDuration))
            //{
            HIQAdminContext.OTPMasters.Add(otp);
            IsSuccess = HIQAdminContext.SaveChanges() > 0;
            //}
            return IsSuccess;

        }


        /// <summary>
        /// Authenticate OTP (One Time Password) entered by user
        /// </summary>
        /// <param name="userid">Userid</param>
        /// <param name="otp">One Time Password</param>
        /// <returns>reurns true if user have enterered latest OTP</returns>
        public bool AuthenticateOTP(long userid, string otp, out string GuidString, out int MaxAttempts)
        {
            OTPMaster ObjOTP = HIQAdminContext.OTPMasters.OrderByDescending(k => k.CreatedDate).FirstOrDefault(k => k.UserID == userid);

            GuidString = "";
            MaxAttempts = 0;
            if (ObjOTP != null)
            {
                MaxAttempts = ObjOTP.Attempts.Value;
                if (ObjOTP.OTP == otp)
                {
                    GuidString = ObjOTP.GUID;
                    return true;
                }
                else
                {
                    ObjOTP.Attempts = ++MaxAttempts;
                    HIQAdminContext.Entry<OTPMaster>(ObjOTP).State = System.Data.Entity.EntityState.Modified;
                    HIQAdminContext.SaveChanges(); // TBD
                }
            }

            //}

            return false;
        }
        /// <summary>
        /// Get UserID By Employee Code given in parameter
        /// </summary>
        /// <param name="EmplCode"></param>
        /// <returns></returns>
        //public long? GetUserIDByEmployeeCode(string EmplCode)
        //{
        //    UserMaster user = null;
        //    user = HealthIQHIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
        //    if (user != null)
        //        return user.UserID;
        //    else
        //        return null;
        //}

        /// <summary>
        /// Validate GUID in the link of forget password email
        /// </summary>
        /// <param name="GUID"> uniqe string </param>
        /// <returns>true if GUID in the URL is correct</returns>
        public bool ValidateGUID(string GUID)
        {
            int OTPExirationHrs = Convert.ToInt32(AppUtil.GetAppSettings(AspectEnums.ConfigKeys.OTPExirationHrs));

            DateTime StartTime = DateTime.Now.Subtract(new TimeSpan(OTPExirationHrs, 0, 0));
            DateTime EndTime = DateTime.Now.AddMinutes(1);
            OTPMaster objOTP = HIQAdminContext.OTPMasters.FirstOrDefault(k => k.CreatedDate >= StartTime && k.CreatedDate <= EndTime && k.GUID == GUID);
            if (objOTP != null)
                return true;
            else
                return false;
        }

        /// <summary>
        /// Change password of User
        /// </summary>
        /// <param name="GUID"> uniqe string </param>
        /// <param name="Password">password entered by user</param>
        /// <returns></returns>
        //public bool ChangePassword(string GUID, string Password)
        //{
        //    int OTPExirationHrs = Convert.ToInt32(AppUtil.GetAppSettings(AspectEnums.ConfigKeys.OTPExirationHrs));
        //    DateTime StartTime = DateTime.Now.Subtract(new TimeSpan(OTPExirationHrs, 0, 0));
        //    DateTime EndTime = DateTime.Now;
        //    OTPMaster objOTP = HealthIQHIQAdminContext.OTPMasters.FirstOrDefault(k => k.CreatedDate >= StartTime && k.CreatedDate <= EndTime && k.GUID == GUID);
        //    if (objOTP != null)
        //    {
        //        UserMaster user = HealthIQHIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == objOTP.UserID && !k.IsDeleted);
        //        user.Password = EncryptionEngine.EncryptString(Password);
        //        HealthIQHIQAdminContext.Entry<UserMaster>(user).State = System.Data.EntityState.Modified;
        //        //Delete all previous OTPs
        //        foreach (var o in HealthIQHIQAdminContext.OTPMasters.Where(k => k.UserID == user.UserID))
        //            HealthIQHIQAdminContext.OTPMasters.Remove(o);

        //        return HealthIQHIQAdminContext.SaveChanges() > 0;
        //    }
        //    else
        //        return false;
        //}

        #endregion
    }
}
