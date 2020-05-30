namespace Leela.PresentationLayer.WebApp.Helpers
{
    public static class AspectEnums
    {

        public enum ConfigKeys
        {
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
            Phone
        }

        public enum CompanyInfo
        {
            Name,
            Email,
            Logo,
            CustomerCareNo
        }

        public enum EmailStatus
        {
            None = 0,
            Pending = 1,
            Failed = 2,
            Sent = 3
        }

        public enum AccountStatus
        {
            Pending = 0,
            Active = 1,
            InActive = 2
        }

        public enum EnquiryStatus
        {
            Received = 0,
            Hold = 1,
            InProcess = 2,
            Completed = 3
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

        public enum FileType
        {
            DiagnosticReport = 1,
            ExamReport = 2,
            CourseDocument = 3,
            Invoice = 4,
            Resume = 5
        }

        public enum Sex
        {
            Male = 1,
            Female = 2,
            Private = 3
        }

        public enum CollectionType
        {
            Centre = 1,
            Home = 2,
            Other = 3
        }

        public enum City
        {
            Asansol = 1,
            Durgapur = 2,
            Howrah = 3,
            Darjeeling = 4,
            Haldia = 5,
            Kalimpong = 6,
            Kolkata = 7
        }

    }
}
