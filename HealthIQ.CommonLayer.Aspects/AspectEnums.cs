
using System.ComponentModel;

namespace HealthIQ.CommonLayer.Aspects
{
    public static class AspectEnums
    {
        public enum ApplicationName
        {
            HealthIQ
        }

        public enum AspectInstanceNames
        {
            UserManager,
            SecurityManager,
            StudentManager,
            NotificationManager,
            AdminManager
        }

        public enum EnquiryType
        {
            ContactUs = 1,
            Student = 2,
            CustomerReport = 2,
            PartnerWithUs = 3,
            DoctorAppointment = 4,
            BookAtest = 5
        }

        public enum AccountStatus
        {
            Pending = 1,
            Active = 2,
            Blocked = 3
        }

        public enum PeristenceInstanceNames
        {
            UserDataImpl,
            SecurityDataImpl,
            StudentDataImpl,
            NotificationDataImpl,
            CustomerDataImpl,
            AdminDataImpl
        }

        public enum FileType
        {
            DiagnosticReport = 1,
            ExamReport = 2,
            CourseDocument = 3,
            Invoice = 4,
            Resume = 5
        }
        public enum RoleType
        {
            Admin = 1,
            Employee = 2,
            Customer = 3,
            Student = 4,
            Default = 99
        }

        public enum ImageFileTypes
        {
            Survey,
            User,
            General,
            Product,
            Store,
            Expense,
            DealerCreation,
            Resume
        }

        public enum UserValidationType
        {
            [Description("Validate only Employee Code")]
            EmplCode = 1,
            [Description("Validate Employee  Email ID")]
            EmplEmail = 2,
            ForgotPasswordAttempts = 3,
            LastAttemptDuration = 4
        }

        public enum ConfigKeys
        {
            APKDownloadURL,
            HostName,
            FileProcessorURL,
            ImagesPath,
            ForgotPasswordURL,
            OTPExirationHrs,
            LastAttemptDuration,
            Company,
            SMTPHost,
            FromName,
            FromEmail,
            Password,
            SMTPPort,
            IsSSL,
            Subject,
            CCAddress,
            LogoUrl,
            Phone,
            SchedulerConfigFile,
            FotgotPasswordAttempts,
            EncryptionInitVector,
            EncryptionSaltKey,
            EncryptionDictionary
        }

        public enum EnquiryStatus
        {
            None = 0,
            Received = 1,
            InProcess = 2,
            Delivered = 3,
            Failed = 4,
        }

        public enum EmailStatus
        {
            None = 0,
            Pending = 1,
            Sent = 2,
            Delivered = 3,
            Failed = 4,
        }

        public enum EmailTemplateType
        {
            ResetPassword = 1,
            ContactUs = 2,
            Welcom = 3
        }

        /// <summary>
        /// This enum is used to define user login status in UserMaster
        /// </summary>
        public enum UserLoginStatus
        {
            None = 0,
            Active = 1,
            InActive = 2,
            Locked = 3,
            DaysExpire = 4,
            WrongPassword = 5,
            WrongIMEI = 6,
            MultipleIMEI = 7,
            WrongUserName = 8,
        }

        /// <summary>
        /// Main user Account Status
        /// </summary>
        public enum UserAccountStatus
        {
            Pending = 0,
            Active = 1,
            InActive = 2
        }

    }
}
