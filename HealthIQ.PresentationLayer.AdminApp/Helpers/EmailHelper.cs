using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects.Utilities;
using HealthIQ.CommonLayer.Log;
using HealthIQ.PersistenceLayer.Data.AdminEntity;

namespace HealthIQ.PresentationLayer.AdminApp.Helpers
{
    public static class EmailHelper
    {
        public static int ForgetPasswordEmail(string email, string name, string key)
        {
            string resetUrl = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.ForgotPasswordURL);
            string PasswordResetURL = resetUrl + key;

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/ResetPassword.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{{EMAIL}}", email);
            body = body.Replace("{{NAME}}", name);
            body = body.Replace("{{PASSWORDRESETURL}}", PasswordResetURL);

            EmailServiceDTO emailService = new EmailServiceDTO();
            emailService.ToEmail = email;
            emailService.Status = (int)AspectEnums.EmailStatus.Pending;
            emailService.Body = body;
            emailService.Subject = "Reset your account password.";
            emailService.Priority = 2;
            emailService.IsAttachment = false;
            return SendEmail(emailService);
        }

        public static int PrepareAndSendBookingEmail(BookingMaster model)
        {

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/UserBookingConfirmation.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", model.FirstName + " " + model.LastName);
            body = body.Replace("{Age}", model.Age.ToString());
            body = body.Replace("{Sex}", model.Sex == 1 ? "Male" : "Female");
            body = body.Replace("{CollectionType}", model.CollectionType == 1 ? "Collection Centre" : "Home");
            body = body.Replace("{BookingDate}", model.BookingDate.ToString());
            body = body.Replace("{Email}", model.Email);
            body = body.Replace("{Mobile}", model.Mobile);
            body = body.Replace("{Address}", model.Address);
            body = body.Replace("{Landmark}", model.Landmark);
            body = body.Replace("{PinCode}", model.PinCode);

            var C = GetCompanyDetails(1);
            body = body.Replace("{Company}", C.Name);
            body = body.Replace("{Logo}", C.LogoUrl);


            EmailServiceDTO email = new EmailServiceDTO();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email);
        }

        public static int PrepareAndSendAppointmentEmail(DoctorAppointment model)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/DoctorAppointmentConfirmation.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", model.Name);
            body = body.Replace("{Age}", model.Age.ToString());
            body = body.Replace("{Sex}", model.Sex == 1 ? "Male" : "Female");
            body = body.Replace("{BookingDate}", model.BookingDate.ToString());
            body = body.Replace("{Email}", model.Email);
            body = body.Replace("{Mobile}", model.Mobile);

            var C = GetCompanyDetails(Convert.ToInt32(model.CompanyID));
            body = body.Replace("{Company}", C.Name);
            body = body.Replace("{Logo}", C.LogoUrl);

            EmailServiceDTO email = new EmailServiceDTO();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email);
        }

        public static int PrepareAndSendEmail<T>(T model, string otherDetails = "") where T : EmailModel
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/OnlineEnquiry.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", model.Name = string.IsNullOrEmpty(model.Name) ? (model.FirstName + " " + model.LastName) : model.Name);

            if (model.Age > 0)
                body = body.Replace("{Age}", model.Age.ToString());
            if (model.Sex > 0)
                body = body.Replace("{Sex}", model.Sex == 1 ? "Male" : "Female");
            if (model.BookingDate != null)
                body = body.Replace("{BookingDate}", model.BookingDate.ToString());

            body = body.Replace("{Email}", model.Email);
            body = body.Replace("{Mobile}", model.Mobile ?? model.Phone);
            body = body.Replace("{Message}", model.Message);
            body = body.Replace("{Subject}", model.Subject);
            body = body.Replace("{Other}", otherDetails);
            var C = GetCompanyDetails(1);
            body = body.Replace("{Company}", C.Name);
            body = body.Replace("{Logo}", C.LogoUrl);

            EmailServiceDTO email = new EmailServiceDTO();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            email.Subject = model.Subject;
            return SendEmail(email);
        }

        public static int PrepareAndSendEnquiryEmail(OnlineEnquiry model)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/OnlineEnquiryResponse.html")))
            {
                body = reader.ReadToEnd();
            }

            var C = GetCompanyDetails(model.CompanyID);

            body = body.Replace("{Name}", model.Name);

            body = body.Replace("{Company}", C.Name);
            body = body.Replace("{Logo}", C.LogoUrl);

            EmailServiceDTO email = new EmailServiceDTO();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email);
        }

        public static int PrepareAndSendStudentEnquiryEmail(OnlineEnquiry model)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/Student_Enquiry.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{Name}", model.Name);
            body = body.Replace("{Email}", model.Email);
            body = body.Replace("{Mobile}", model.Phone);

            EmailServiceDTO email = new EmailServiceDTO();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Body = body;
            email.Subject = "Student enquiry received.";
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email);
        }



        public static int SendEmail(EmailServiceDTO email)
        {
            string fromPass;
            ActivityLog.SetLog("[STARTED] SendEmail", LogLoc.INFO);
            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "Y";
            message.Subject = string.IsNullOrEmpty(email.Subject) ? ConfigurationManager.AppSettings["Subject"] : email.Subject;
            email.BccEmail = ConfigurationManager.AppSettings["BCCAddress"];
            email.CcEmail = ConfigurationManager.AppSettings["CCAddress"];

            try
            {
                if (isDebugMode)
                {
                    message.To.Add(ConfigurationManager.AppSettings["DbugToEmail"]);
                    email.FromEmail = ConfigurationManager.AppSettings["DbugFromEmail"];
                    smtpClient.EnableSsl = ConfigurationManager.AppSettings["DbugIsSSL"] == "Y" ? true : false;
                    fromPass = ConfigurationManager.AppSettings["DbugFromPass"];
                    smtpClient.Host = ConfigurationManager.AppSettings["DbugSMTPHost"]; //"relay-hosting.secureserver.net";   //-- Donot change.
                    smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["DbugSMTPPort"]); // 587; //--- Donot change    
                    message.Subject = "[Debug Mode ON] - " + message.Subject;
                }
                else
                {
                    smtpClient.EnableSsl = ConfigurationManager.AppSettings["IsSSL"] == "Y" ? true : false;
                    email.FromName = ConfigurationManager.AppSettings["FromName"];
                    email.FromEmail = ConfigurationManager.AppSettings["FromEmail"];
                    fromPass = ConfigurationManager.AppSettings["Password"];
                    smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPPort"]);
                    smtpClient.Host = ConfigurationManager.AppSettings["SMTPHost"];
                    message.To.Add(email.ToEmail);
                }

                ActivityLog.SetLog("Sending Email to : " + message.To + " from account " + email.FromEmail + " having host and port: " + smtpClient.Host + " & " + smtpClient.Port, LogLoc.DEBUG); smtpClient.Credentials = new NetworkCredential(email.FromEmail, fromPass);
                message.BodyEncoding = Encoding.UTF8;
                message.From = new MailAddress(email.FromEmail, email.FromName);
                message.IsBodyHtml = true;
                message.Body = email.Body;
                message.Bcc.Add(email.BccEmail);
                if (email.CcEmail != string.Empty)
                    message.CC.Add(email.CcEmail);
                smtpClient.Send(message);
                message.Dispose();
                ActivityLog.SetLog("[SUCCESS] SendEmail", LogLoc.INFO);
                return (int)AspectEnums.EmailStatus.Sent;
            }
            catch (Exception ex)
            {

                ActivityLog.SetLog("[FAILURE] Sending Email " + ex.Message + ex.InnerException, LogLoc.ERROR);
                return (int)AspectEnums.EmailStatus.Failed;
            }
            finally
            {
                message.Dispose();
                smtpClient.Dispose();
                ActivityLog.SetLog("[FINISHED] SendEmail", LogLoc.INFO);
            }
        }

        public static CompanyMaster GetCompanyDetails(int id)
        {
            CompanyMaster c = new CompanyMaster();
            c.ID = id;
            c.Name = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.FromName);
            c.PrimaryEmail = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.FromEmail);
            c.LogoUrl = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.LogoUrl);
            return c;
        }
    }
}