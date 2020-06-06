
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
            ProductManager,
            NotificationManager
        }

        public enum PeristenceInstanceNames
        {
            UserDataImpl,
            SecurityDataImpl,
            ProductDataImpl,
            NotificationDataImpl
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
            DealerCreation
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
            SchedulerConfigFile
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
            ForgotPassword = 1
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
