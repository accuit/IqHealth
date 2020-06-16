using HealthIQ.BusinessLayer.Services;
using HealthIQ.CommonLayer.AopContainer;
using HealthIQ.CommonLayer.AOPRegistrations;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.Utilities;
using HealthIQ.PresentationLayer.AdminApp.App_Start;
using HealthIQ.PresentationLayer.AdminApp.Core;
using log4net.Config;
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
            _ = log4net.Config.XmlConfigurator.Configure();
        }

        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("Server");
            Response.Headers.Set("Server", "HealthIQ");
            Response.Headers.Remove("X-AspNet-Version"); //alternative to above solution
            Response.Headers.Remove("X-AspNetMvc-Version"); //alternative to above solution
            Response.Headers.Remove("X-Powered-By"); //alternative to above solution
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
