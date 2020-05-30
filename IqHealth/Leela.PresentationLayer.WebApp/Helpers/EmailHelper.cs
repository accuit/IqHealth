
using Leela.PresentationLayer.WebApp.Models;
using Leela.PresentationLayer.WebApp.ViewModels;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace Leela.PresentationLayer.WebApp.Helpers
{
    public static class EmailHelper
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public static int PrepareAndSendBookingEmail(BookingMaster model)
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


            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            return SendEmail(email);
        }

        public static int PrepareAndSendAppointmentEmail(DoctorAppointment model)
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

            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
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
            body = body.Replace("{Mobile}", model.Mobile == null ? model.Phone : model.Mobile);
            body = body.Replace("{Message}", model.Message);
            body = body.Replace("{Subject}", model.Subject);
            body = body.Replace("{Other}", otherDetails);

            EmailNotification email = new EmailNotification();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Message = body;
            email.Body = body;
            email.Priority = 2;
            email.IsAttachment = false;
            email.Subject = model.Subject;
            return SendEmail(email);
        }

        public static int SendEmail(EmailNotification email)
        {
            string fromPass = string.Empty;
            log.Info("[STARTED] SendEmail");
            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "Y" ? true : false;
            message.Subject = string.IsNullOrEmpty(email.Subject) ? ConfigurationManager.AppSettings["Subject"].ToString() : email.Subject;
            email.BccEmail = ConfigurationManager.AppSettings["BCCAddress"].ToString();
            email.CcEmail = ConfigurationManager.AppSettings["CCAddress"].ToString();

            try
            {
                if (isDebugMode)
                {
                    message.To.Add(ConfigurationManager.AppSettings["DbugToEmail"].ToString());
                    email.FromEmail = ConfigurationManager.AppSettings["DbugFromEmail"].ToString();
                    smtpClient.EnableSsl = ConfigurationManager.AppSettings["DbugIsSSL"].ToString() == "Y" ? true : false;
                    fromPass = ConfigurationManager.AppSettings["DbugFromPass"];
                    smtpClient.Host = ConfigurationManager.AppSettings["DbugSMTPHost"]; //"relay-hosting.secureserver.net";   //-- Donot change.
                    smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["DbugSMTPPort"]); // 587; //--- Donot change    
                    message.Subject = "[Debug Mode ON] - " + message.Subject;
                }
                else
                {
                    smtpClient.EnableSsl = ConfigurationManager.AppSettings["IsSSL"].ToString() == "Y" ? true : false;
                    email.FromName = ConfigurationManager.AppSettings["FromName"].ToString();
                    email.FromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();
                    fromPass = ConfigurationManager.AppSettings["Password"].ToString();
                    smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPPort"]);
                    smtpClient.Host = ConfigurationManager.AppSettings["SMTPHost"].ToString();
                    message.To.Add(email.ToEmail);
                }

                log.Info("Sending Email to : " + message.To + " from account " + email.FromEmail + " having host and port: " + smtpClient.Host + " & " + smtpClient.Port); smtpClient.Credentials = new NetworkCredential(email.FromEmail, fromPass);
                message.BodyEncoding = Encoding.UTF8;
                message.From = new MailAddress(email.FromEmail, email.FromName);
                message.IsBodyHtml = true;
                message.Body = email.Body;
                message.Bcc.Add(email.BccEmail);
                if (email.CcEmail != string.Empty)
                    message.CC.Add(email.CcEmail);
                smtpClient.Send(message);
                message.Dispose();
                log.Info("[SUCCESS] SendEmail");
                return (int)AspectEnums.EmailStatus.Sent;
            }
            catch (Exception ex)
            {

                log.Error("[FAILURE] Sending Email " + ex.Message.ToString() + ex.InnerException.ToString());
                return (int)AspectEnums.EmailStatus.Failed;
            }
            finally
            {
                message.Dispose();
                smtpClient.Dispose();
                log.Info("[FINISHED] SendEmail");
            }
        }
    }


}