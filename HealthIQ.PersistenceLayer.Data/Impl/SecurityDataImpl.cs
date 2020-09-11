using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.Security;
using HealthIQ.CommonLayer.Aspects.Utilities;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;

namespace HealthIQ.PersistenceLayer.Data.Impl
{
    /// <summary>
    /// Implementation class for system/user authorization and security in application
    /// </summary>
    public class SecurityDataImpl : BaseDataImpl, ISecurityRepository
    {
        public List<RoleMaster> GetRoles()
        {
            return HIQAdminContext.RoleMasters.Where(x => !x.IsDeleted).ToList();
        }
        public List<UserRole> GetUserRoles(int userId)
        {
            var ur = HIQAdminContext.UserRoles.Where(x => x.UserID == userId).ToList();
            return ur;
        }
        //public bool ValidateEmployee(long userID, AspectEnums.EmployeeValidationType Type)
        //{
        //    bool IsValid = false;
        //    UserMaster user = null;
        //    //if (Type == AspectEnums.EmployeeValidationType.EmplCode)
        //    //{
        //    //    user = HIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
        //    //}
        //    if (Type == AspectEnums.EmployeeValidationType.EmplCode_Email)
        //    {
        //        user = HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == userID && !k.IsDeleted && !string.IsNullOrEmpty(k.EmailID));
        //    }
        //    if (Type == AspectEnums.EmployeeValidationType.FotgotPasswordAttempts)
        //    {

        //        DateTime Today = DateTime.Today;
        //        DateTime Tomorrow = DateTime.Today.AddDays(1);
        //        //UserMaster user1 = HIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
        //        //// Check Max Attempts
        //        //if (user1 != null)
        //        //{
        //        int TodaysAttempts = HIQAdminContext.OTPMasters.Where(k => k.UserID == userID && k.CreatedDate >= Today && k.CreatedDate < Tomorrow).Count();
        //        int PasswordAttempts = Convert.ToInt32(AppUtil.GetAppSettings(AspectEnums.ConfigKeys.FotgotPasswordAttempts));
        //        IsValid = TodaysAttempts < PasswordAttempts;
        //        //}

        //    }
        //    if (Type == AspectEnums.EmployeeValidationType.LastAttemptDuration)
        //    {
        //        DateTime Now = DateTime.Now;
        //        //UserMaster user1 = HIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
        //        //// Check Last Attempt
        //        //if (user1 != null)
        //        //{
        //        string LastAttemptDuration = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.LastAttemptDuration);
        //        string[] TimeArr = LastAttemptDuration.Split(':');

        //        DateTime LastAttemptStart = Now.Subtract(new TimeSpan(Int32.Parse(TimeArr[0]), Int32.Parse(TimeArr[1]), Int32.Parse(TimeArr[2])));

        //        IsValid = HIQAdminContext.OTPMasters.Where(k => k.UserID == userID && k.CreatedDate >= LastAttemptStart && k.CreatedDate < Now).Count() <= 0;


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
            if (ValidateUser(otp.UserID, AspectEnums.UserValidationType.LastAttemptDuration))
            {
                HIQAdminContext.Entry(otp).State = EntityState.Added;
                IsSuccess = HIQAdminContext.SaveChanges() > 0;
            }
            return IsSuccess;

        }

        public bool ValidateUser(int UserID, AspectEnums.UserValidationType Type)
        {
            bool IsValid = false;
            UserMaster User = null;

            if (Type == AspectEnums.UserValidationType.EmplEmail)
            {
                User = HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == UserID && !k.IsDeleted && !string.IsNullOrEmpty(k.Email));
            }
            if (Type == AspectEnums.UserValidationType.ForgotPasswordAttempts)
            {

                DateTime Today = DateTime.Today;
                DateTime Tomorrow = DateTime.Today.AddDays(1);
                UserMaster User1 = HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == UserID && !k.IsDeleted);
                //// Check Max AttUserts
                if (User1 != null)
                {
                    int TodaysAttUserts = HIQAdminContext.OTPMasters.Count(k => k.UserID == UserID && k.CreatedDate >= Today && k.CreatedDate < Tomorrow);
                    int PasswordAttUserts = Convert.ToInt32(AppUtil.GetAppSettings(AspectEnums.ConfigKeys.FotgotPasswordAttempts));
                    IsValid = TodaysAttUserts < PasswordAttUserts;
                }

            }
            if (Type == AspectEnums.UserValidationType.LastAttemptDuration)
            {
                DateTime Now = DateTime.Now;
                UserMaster user1 = HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == UserID && !k.IsDeleted);
                //// Check Last AttUsert
                if (user1 != null)
                {
                    string LastAttUsertDuration = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.LastAttemptDuration);
                    string[] TimeArr = LastAttUsertDuration.Split(':');

                    DateTime LastAttUsertStart = Now.Subtract(new TimeSpan(Int32.Parse(TimeArr[0]), Int32.Parse(TimeArr[1]), Int32.Parse(TimeArr[2])));

                    IsValid = !HIQAdminContext.OTPMasters.Where(k => k.UserID == UserID && k.CreatedDate >= LastAttUsertStart && k.CreatedDate < Now).Any();

                }

            }

            if (User != null)
                IsValid = true;

            return IsValid;
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

                ObjOTP.Attempts = ++MaxAttempts;
                HIQAdminContext.Entry(ObjOTP).State = EntityState.Modified;
                HIQAdminContext.SaveChanges(); // TBD
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
        //    user = HIQAdminContext.UserMasters.FirstOrDefault(k => k.EmplCode == EmplCode && !k.IsDeleted);
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
            return false;
        }

        /// <summary>
        /// Change password of User
        /// </summary>
        /// <param name="GUID"> uniqe string </param>
        /// <param name="Password">password entered by user</param>
        /// <returns></returns>
        public bool ChangePassword(string GUID, string Password)
        {
            int OTPExirationHrs = Convert.ToInt32(AppUtil.GetAppSettings(AspectEnums.ConfigKeys.OTPExirationHrs));
            DateTime StartTime = DateTime.Now.Subtract(new TimeSpan(OTPExirationHrs, 0, 0));
            DateTime EndTime = DateTime.Now;
            OTPMaster objOTP = HIQAdminContext.OTPMasters.FirstOrDefault(k => k.CreatedDate >= StartTime && k.CreatedDate <= EndTime && k.GUID == GUID);
            if (objOTP != null)
            {
                UserMaster user = HIQAdminContext.UserMasters.FirstOrDefault(k => k.UserID == objOTP.UserID && !k.IsDeleted);
                user.Password = EncryptionEngine.EncryptString(Password);
                HIQAdminContext.Entry(user).State = EntityState.Modified;
                //Delete all previous OTPs
                foreach (var o in HIQAdminContext.OTPMasters.Where(k => k.UserID == user.UserID))
                    HIQAdminContext.OTPMasters.Remove(o);

                return HIQAdminContext.SaveChanges() > 0;
            }

            return false;
        }
    }
}
