using HealthIQ.BusinessLayer.Services;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.AopContainer;
using HealthIQ.CommonLayer.Aspects;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    public class BaseAPIController : ApiController
    {
        private IUserService userBusinessInstance;
        private ISecurityService securityBusinessInstance;
        private IStudentService studentBusinessInstance;
        private INotificationService notificationBusinessInstance;
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

        public ISecurityService SecurityBusinessInstance
        {
            get
            {
                if (securityBusinessInstance == null)
                {
                    securityBusinessInstance = AopEngine.Resolve<ISecurityService>(AspectEnums.AspectInstanceNames.SecurityManager, AspectEnums.ApplicationName.HealthIQ);
                }
                return securityBusinessInstance;
            }
        }

        public IStudentService StudentBusinessInstance
        {
            get
            {
                if (studentBusinessInstance == null)
                {
                    studentBusinessInstance = AopEngine.Resolve<IStudentService>(AspectEnums.AspectInstanceNames.StudentManager, AspectEnums.ApplicationName.HealthIQ);
                }
                return studentBusinessInstance;
            }
        }

        public INotificationService NotificationBusinessInstance
        {
            get
            {
                if (notificationBusinessInstance == null)
                {
                    notificationBusinessInstance = AopEngine.Resolve<INotificationService>(AspectEnums.AspectInstanceNames.NotificationManager, AspectEnums.ApplicationName.HealthIQ);
                }
                return notificationBusinessInstance;
            }
        }

    }
}
