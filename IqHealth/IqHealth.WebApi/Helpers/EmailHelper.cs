using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
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
        public static readonly string EMAIL_SUBJECT = "Your booking is successful.";
        private string senderAddress;
        private string clientAddress;
        private string netPassword;

        public EmailHelper ()
        {

        }

        public EmailHelper(string sender, string Password, string client)
        {
            senderAddress = sender;
            netPassword = Password;
            clientAddress = client;
        }
        public bool SendEMail(string recipient, string subject, string message)
        {
            string fromPass, fromAddress, fromName = "";
            bool isMessageSent = false;
            //Intialise Parameters  
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            client.Port = 587;
            client.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(senderAddress, netPassword);
            client.EnableSsl = true;
            client.Credentials = credentials;
            fromName = ConfigurationManager.AppSettings["FromName"].ToString();
            fromAddress = ConfigurationManager.AppSettings["FromEmail"].ToString();
            client.Host = ConfigurationManager.AppSettings["SMTPHost"];
            try
            {
                var mail = new System.Net.Mail.MailMessage(senderAddress.Trim(), recipient.Trim());
                mail.Subject = subject;
                mail.Body = message;
                mail.IsBodyHtml = true;
                //System.Net.Mail.Attachment attachment;  
                //attachment = new Attachment(@"C:\Users\XXX\XXX\XXX.jpg");  
                //mail.Attachments.Add(attachment);  
                client.Send(mail);
                isMessageSent = true;
            }
            catch (Exception ex)
            {
                isMessageSent = false;
            }
            return isMessageSent;
        }

        public int SendEmail(EmailNotification emailmodel)
        {
            string fromPass, fromAddress, fromName = "";

            MailMessage message = new MailMessage();
            SmtpClient smtpClient = new SmtpClient();
            bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "Y" ? true : false;
            try
            {
                if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["CCAddress"]))
                    emailmodel.CcEmail = ConfigurationManager.AppSettings["CCAddress"];

                if (isDebugMode)
                {

                    message.To.Add(ConfigurationManager.AppSettings["DbugToEmail"].ToString());
                    fromAddress = ConfigurationManager.AppSettings["DbugFromEmail"].ToString();
                    fromPass = ConfigurationManager.AppSettings["DbugFromPass"];
                    smtpClient.Host = ConfigurationManager.AppSettings["DbugSMTPHost"]; //"relay-hosting.secureserver.net";   //-- Donot change.
                    smtpClient.Port = Convert.ToInt32(ConfigurationManager.AppSettings["DbugSMTPPort"]); // 587; //--- Donot change    
                    smtpClient.EnableSsl = true;
                    smtpClient.Credentials = new System.Net.NetworkCredential(fromAddress, fromPass);
                    message.Subject = "[Debug Mode ON] - " + emailmodel.Subject;

                }
                else
                {
                    fromName = ConfigurationManager.AppSettings["FromName"].ToString();
                    fromAddress = ConfigurationManager.AppSettings["FromEmail"].ToString();
                    smtpClient.Host = ConfigurationManager.AppSettings["SMTPHost"];
                    message.To.Add(emailmodel.ToEmail);
                    message.Subject = emailmodel.Subject;
                }

                message.BodyEncoding = Encoding.UTF8;
                message.From = new System.Net.Mail.MailAddress(fromAddress, emailmodel.FromName);
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