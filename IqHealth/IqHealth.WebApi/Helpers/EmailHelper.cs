using AutoMapper;
using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace IqHealth.WebApi.Helpers
{
    public class EmailHelper
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public int PrepareAndSendBookingEmail(BookingMaster model)
        {

            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/UserBookingConfirmation.html")))
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

            var C = GetCompanyDetails(Convert.ToInt32(model.CompanyID));
            body = body.Replace("{Company}", C.Name);
            body = body.Replace("{ContactNo}", C.PhoneNumber);
            body = body.Replace("{Logo}", C.LogoUrl);


            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email, Convert.ToInt32(model.CompanyID));
        }

        public int PrepareAndSendAppointmentEmail(DoctorAppointment model)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/DoctorAppointmentConfirmation.html")))
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
            body = body.Replace("{ContactNo}", C.PhoneNumber);
            body = body.Replace("{Logo}", C.LogoUrl);

            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email, Convert.ToInt32(model.CompanyID));
        }

        public int PrepareAndSendEmail<T>(T model, string otherDetails = "") where T : EmailModel
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
            body = body.Replace("{Mobile}", model.Mobile == null ? model.Phone : model.Mobile);
            body = body.Replace("{Message}", model.Message);
            body = body.Replace("{Subject}", model.Subject);
            body = body.Replace("{Other}", otherDetails);

            var C = GetCompanyDetails(Convert.ToInt16(model.CompanyID));
            body = body.Replace("{Company}", C.Name);
            body = body.Replace("{ContactNo}", C.PhoneNumber);
            body = body.Replace("{Logo}", C.LogoUrl);

            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            email.Subject = model.Subject;
            return SendEmail(email, Convert.ToInt32(model.CompanyID));
        }

        public int PrepareAndSendEnquiryEmail(OnlineEnquiry model)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/OnlineEnquiryResponse.html")))
            {
                body = reader.ReadToEnd();
            }

            var C = GetCompanyDetails(model.CompanyID);

            body = body.Replace("{Name}", model.Name);

            body = body.Replace("{Company}", C.Name);
            body = body.Replace("{ContactNo}", C.PhoneNumber);
            body = body.Replace("{Logo}", C.LogoUrl);


            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email, Convert.ToInt32(model.CompanyID));
        }

        public int PrepareAndSendStudentEnquiryEmail(OnlineEnquiry model)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/Student_Enquiry.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{Name}", model.Name);
            body = body.Replace("{Email}", model.Email);
            body = body.Replace("{Mobile}", model.Phone);

            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
            email.Body = body;
            email.Subject = "Student enquiry received.";
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email, Convert.ToInt32(model.CompanyID));
        }



        public int SendEmail(EmailNotification emailmodel, int companyId)
        {
            string fromPass, fromAddress, fromName = "";

            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "Y" ? true : false;
            message.Subject = string.IsNullOrEmpty(emailmodel.Subject) ?  getConfigValue(companyId, AspectEnums.ConfigKeys.Subject): emailmodel.Subject;
            try
            {

                if (!string.IsNullOrEmpty(getConfigValue(companyId, AspectEnums.ConfigKeys.CCAddress)))
                {
                    emailmodel.CcEmail = getConfigValue(companyId, AspectEnums.ConfigKeys.CCAddress);
                    message.Bcc.Add(emailmodel.CcEmail);
                }
                log.Debug("isDebugMode " + isDebugMode);
                if (isDebugMode)
                {
                    message.To.Add(ConfigurationManager.AppSettings["DbugToEmail"].ToString());
                    fromAddress = ConfigurationManager.AppSettings["DbugFromEmail"].ToString();
                    smtpClient.EnableSsl = ConfigurationManager.AppSettings["DbugIsSSL"].ToString() == "Y" ? true : false;
                    fromPass = ConfigurationManager.AppSettings["DbugFromPass"];
                    smtpClient.Host = ConfigurationManager.AppSettings["DbugSMTPHost"]; //"relay-hosting.secureserver.net";   //-- Donot change.
                    smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["DbugSMTPPort"]); // 587; //--- Donot change    
                    message.Subject = "[Debug Mode ON] - " + message.Subject;
                }
                else
                {
                    smtpClient.EnableSsl = getConfigValue(companyId, AspectEnums.ConfigKeys.IsSSL) == "Y" ? true : false;
                    fromName = getConfigValue(companyId, AspectEnums.ConfigKeys.FromName);
                    fromAddress = getConfigValue(companyId, AspectEnums.ConfigKeys.FromEmail);
                    fromPass = getConfigValue(companyId, AspectEnums.ConfigKeys.Password);
                    smtpClient.Port = Convert.ToInt32(getConfigValue(companyId, AspectEnums.ConfigKeys.SMTPPort));
                    smtpClient.Host = getConfigValue(companyId, AspectEnums.ConfigKeys.SMTPHost);
                    message.To.Add(emailmodel.ToEmail);
                }
                log.Info("Sending Email to : " + message.To + " from account " + fromAddress + " having host and port: " + smtpClient.Host + " & " + smtpClient.Port );
                smtpClient.Credentials = new NetworkCredential(fromAddress, fromPass);
                message.BodyEncoding = Encoding.UTF8;
                message.From = new MailAddress(fromAddress, fromName);
                message.IsBodyHtml = true;
                message.Body = emailmodel.Body;
                smtpClient.Send(message);
                message.Dispose();
                return (int)AspectEnums.EmailStatus.Sent;

            }
            catch (Exception ex)
            {
                log.Error("Error Sending Email " + ex.InnerException);
                return (int)AspectEnums.EmailStatus.Failed;
            }
            finally
            {
                message.Dispose();
                smtpClient.Dispose();
            }
        }

        private static string getConfigValue(int companyID, AspectEnums.ConfigKeys key)
        {
            string config = AppUtil.GetAppSettings(key);
            if (config.Contains(','))
            {
                return config.Split(',').ToArray()[(companyID - 1)];
            }
            else
            {
                return config;
            }


        }

        public static CompanyMaster GetCompanyDetails(int id)
        {
            CompanyMaster c = new CompanyMaster();
            c.ID = id;
            c.Name = getConfigValue(id, AspectEnums.ConfigKeys.FromName);
            c.PrimaryEmail = getConfigValue(id, AspectEnums.ConfigKeys.FromEmail);
            c.LogoUrl = getConfigValue(id, AspectEnums.ConfigKeys.LogoUrl);
            c.PhoneNumber = getConfigValue(id, AspectEnums.ConfigKeys.Phone);

            return c;
        }

    }


}