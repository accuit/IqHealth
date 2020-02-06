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

        public int PrepareAndSendEnquiryEmail(OnlineEnquiry model)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/OnlineEnquiryResponse.html")))
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


        public int SendEmail(EmailNotification emailmodel, int companyId)
        {
            string fromPass, fromAddress, fromName = "";

            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "Y" ? true : false;
            message.Subject = getConfigValue(companyId, AspectEnums.ConfigKeys.Subject);
            try
            {

                if (!string.IsNullOrEmpty(getConfigValue(companyId, AspectEnums.ConfigKeys.CCAddress)))
                {
                    emailmodel.CcEmail = getConfigValue(companyId, AspectEnums.ConfigKeys.CCAddress);
                    message.CC.Add(emailmodel.CcEmail);
                }

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

                smtpClient.Credentials = new NetworkCredential(fromAddress, fromPass);
                message.BodyEncoding = Encoding.UTF8;
                message.From = new System.Net.Mail.MailAddress(fromAddress, fromName);
                message.IsBodyHtml = true;
                message.Body = emailmodel.Body;
                smtpClient.Send(message);
                message.Dispose();
                return (int)AspectEnums.EmailStatus.Sent;

            }
            catch (Exception ex)
            {

                return (int)AspectEnums.EmailStatus.Failed;
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