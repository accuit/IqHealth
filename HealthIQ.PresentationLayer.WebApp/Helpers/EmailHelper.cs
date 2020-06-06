using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Log;
using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace HealthIQ.PresentationLayer.WebApp.Helpers
{
    public class EmailHelper
    {
        public int PrepareAndSendContactEmail(ContactEnquiryDTO model)
        {
            ActivityLog.SetLog("[START][PrepareAndSendContactEmail]", LogLoc.INFO);
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/ContactEnquiry.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", model.Name);
            body = body.Replace("{Date}", DateTime.Now.ToShortDateString());
            body = body.Replace("{Email}", model.Email);
            body = body.Replace("{Mobile}", model.Mobile);
            body = body.Replace("{Message}", model.Message);
            body = body.Replace("{PinCode}", model.Pincode);

            EmailServiceDTO email = new EmailServiceDTO();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Body = body;
            email.ToName = model.Name;
            email.Priority = 2;
            email.IsAttachment = false;
            ActivityLog.SetLog("[FINISH][PrepareAndSendContactEmail]", LogLoc.INFO);
            return SendEmail(email);
        }

        public int PrepareAndSendEntrepreneurEmail(EntrepreneurEnquiryDTO model)
        {
            ActivityLog.SetLog("[START][PrepareAndSendEntrepreneurEmail]", LogLoc.INFO);
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/Helpers/EmailTemplates/BusinessEnquiry.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", model.Name);
            body = body.Replace("{Date}", DateTime.Now.ToShortDateString());
            body = body.Replace("{Email}", model.Email);
            body = body.Replace("{Mobile}", model.Mobile);
            body = body.Replace("{Address}", model.Address);
            body = body.Replace("{PinCode}", model.Pincode);
            body = body.Replace("{Location}", model.Location);
            body = body.Replace("{Profession}", model.Profession);
            body = body.Replace("{Investment}", model.Investment.ToString());

            EmailServiceDTO email = new EmailServiceDTO();
            email.ToEmail = model.Email;
            email.Status = (int)AspectEnums.EmailStatus.Pending;
            email.Body = body;
            email.ToName = model.Name;
            email.Priority = 2;
            email.IsAttachment = false;
            ActivityLog.SetLog("[END][PrepareAndSendEntrepreneurEmail]", LogLoc.INFO);
            return SendEmail(email);
        }


        public int SendEmail(EmailServiceDTO email)
        {
            string fromPass = string.Empty;
            ActivityLog.SetLog("[STARTED] SendEmail", LogLoc.INFO);
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
                ActivityLog.SetLog("Sending Email to : " + message.To + " from account " + email.FromEmail + " having host and port: " + smtpClient.Host + " & " + smtpClient.Port, LogLoc.INFO);
                smtpClient.Credentials = new NetworkCredential(email.FromEmail, fromPass);
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
                ActivityLog.SetLog("[FAILURE] Sending Email " + ex.Message.ToString() + ex.InnerException.ToString(), LogLoc.ERROR);
                return (int)AspectEnums.EmailStatus.Failed;
            }
            finally
            {
                message.Dispose();
                smtpClient.Dispose();
                ActivityLog.SetLog("[FINISHED] SendEmail", LogLoc.INFO);
            }
        }

    }


}