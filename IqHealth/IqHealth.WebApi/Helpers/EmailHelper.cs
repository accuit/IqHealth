﻿using IqHealth.Data.Persistence;
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
        public static readonly string EMAIL_SENDER = "xyz.abc@outlook.com"; // change it to actual sender email id or get it from UI input  
        public static readonly string EMAIL_CREDENTIALS = "*******"; // Provide credentials   
        public static readonly string SMTP_CLIENT = "smtp-mail.outlook.com"; // as we are using outlook so we have provided smtp-mail.outlook.com   
        public static readonly string EMAIL_BODY = "Reset your Password <a href='http://{0}.safetychain.com/api/Account/forgotPassword?{1}'>Here.</a>";


        public int PrepareAndSendEmail(BookingMaster model)
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
            bool isDebugMode = ConfigurationManager.AppSettings["IsDebugMode"] == "N" ? true : false;
            message.Subject = getConfigValue(companyId, AspectEnums.ConfigKeys.Subject);
            try
            {

                //if (!string.IsNullOrEmpty(getConfigValue(companyId, "CCAddress")))
                //{
                //    emailmodel.CcEmail = getConfigValue(companyId, "CCAddress");
                //    message.CC.Add(emailmodel.CcEmail);
                //}

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
            catch
            {
                return (int)AspectEnums.EmailStatus.Failed;
            }
        }

        private string getConfigValue(int companyID, AspectEnums.ConfigKeys key)
        {
            string config = AppUtil.GetAppSettings(key);
            if(config.Contains(','))
            {
                return config.Split(',').ToArray()[(companyID - 1)];
            }
            else
            {
                return config;
            }

            
        }

    }
}