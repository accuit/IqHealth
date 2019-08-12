using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace IqHealth.WebApi.Helpers
{
    public class EmailHelper
    {
        public static readonly string EMAIL_SENDER = "xyz.abc@outlook.com"; // change it to actual sender email id or get it from UI input  
        public static readonly string EMAIL_CREDENTIALS = "*******"; // Provide credentials   
        public static readonly string SMTP_CLIENT = "smtp-mail.outlook.com"; // as we are using outlook so we have provided smtp-mail.outlook.com   
        public static readonly string EMAIL_BODY = "Reset your Password <a href='http://{0}.safetychain.com/api/Account/forgotPassword?{1}'>Here.</a>";


        public int SendEmail(EmailNotification emailmodel)
        {
            string fromPass, fromAddress, fromName = "";

            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "Y" ? true : false;
            message.Subject = ConfigurationManager.AppSettings["Subject"].ToString();
            try
            {
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["CCAddress"]))
                {
                    emailmodel.CcEmail = ConfigurationManager.AppSettings["CCAddress"];
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
                    
                    smtpClient.EnableSsl = ConfigurationManager.AppSettings["IsSSL"].ToString() == "Y" ? true : false;
                    fromName = ConfigurationManager.AppSettings["FromName"].ToString();
                    fromAddress = ConfigurationManager.AppSettings["FromEmail"].ToString();
                    fromPass = ConfigurationManager.AppSettings["Password"];
                    smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPPort"]);
                    smtpClient.Host = ConfigurationManager.AppSettings["SMTPHost"];
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

    }
}