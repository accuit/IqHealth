using HealthIQ.BusinessLayer.Services;
using HealthIQ.CommonLayer.AopContainer;
using HealthIQ.CommonLayer.AOPRegistrations;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.Utilities;
using HealthIQ.PresentationLayer.AdminApp.App_Start;
using HealthIQ.PresentationLayer.AdminApp.Core;
using log4net.Config;
using Newtonsoft.Json;
using System;
using System.Configuration;
using System.Web.Configuration;
using System.Web.Http;
using System.Web.Mvc;

namespace HealthIQ.PresentationLayer.AdminApp
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        private IUserService userBusinessInstance;
        public IUserService UserBusinessInstance
        {
            get
            {
                if (userBusinessInstance == null)
                {
                    userBusinessInstance = AopEngine.Resolve<IUserService>(AspectEnums.AspectInstanceNames.UserManager, AspectEnums.ApplicationName.HealthIQ);
                }
                return userBusinessInstance;
            }
        }
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
            XmlConfigurator.Configure();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            UnityRegistration.InitializeAopContainer();
            string configFile = AppUtil.GetAppSettings(AspectEnums.ConfigKeys.SchedulerConfigFile);
            _ = log4net.Config.XmlConfigurator.Configure();
            GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
        }

        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("Server");
            Response.Headers.Set("Server", "HealthIQ");
            Response.Headers.Remove("X-AspNet-Version"); //alternative to above solution
            Response.Headers.Remove("X-AspNetMvc-Version"); //alternative to above solution
            Response.Headers.Remove("X-Powered-By"); //alternative to above solution
        }

        protected void Session_Start(Object sender, EventArgs e)
        {
            Request.Cookies.Clear();
            SessionStateSection sessionState =
     (SessionStateSection)ConfigurationManager.GetSection("system.web/sessionState");
            string sidCookieName = sessionState.CookieName;

            if (Request.Cookies[sidCookieName] != null)
            {
                System.Web.HttpCookie sidCookie = Response.Cookies[sidCookieName];
                sidCookie.Value = Session.SessionID;
                sidCookie.HttpOnly = true;
                sidCookie.Secure = true;
                sidCookie.Path = "/";
            }
        }

        protected void Session_End(Object sender, EventArgs e)
        {

            int loggenInUserID = Session[PageConstants.SESSION_USER_ID] != null ? Convert.ToInt32(Session[PageConstants.SESSION_USER_ID]) : 0;

            if (loggenInUserID > 0)
            {
                bool status = UserBusinessInstance.LogoutWebUser(loggenInUserID, Session.SessionID);
                Session.Abandon();
                // string loginURL = string.Format("~/Account/Login?ReturnUrl={0}", HttpUtility.UrlEncode(requestContext.Request.RawUrl));
            }
        }
    }
}
