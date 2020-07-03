using HealthIQ.CommonLayer.Aspects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.BusinessLayer.Base
{

    public abstract class ServiceBase : MarshalByRefObject
    {
        /// <summary>
        /// Property to get set object mapping instance
        /// </summary>
        [Unity.Dependency]
        public Mapper ObjectMapper
        {
            get;
            set;
        }

        /// <summary>
        /// Struct to get the container instance names for Data/Persistence layer registrations
        /// </summary>
        public struct ContainerDataLayerInstanceNames
        {
            public const string USER_REPOSITORY = "HealthIQ_UserDataImpl";
            public const string SECURITY_REPOSITORY = "HealthIQ_SecurityDataImpl";
            public const string PRODUCT_REPOSITORY = "HealthIQ_ProductDataImpl";
            public const string NOTIFICATION_REPOSITORY = "HealthIQ_NotificationDataImpl";
            public const string STUDENT_REPOSITORY = "HealthIQ_StudentDataImpl";
            public const string ADMIN_REPOSITORY = "HealthIQ_AdminDataImpl";
        }

        /// <summary>
        /// Struct to get the container instance names for Business layer registrations
        /// </summary>
        public struct ContainerBusinessLayerInstanceNames
        {
            public const string USER_MANAGER = "HealthIQ_UserManager";
            public const string SECURITY_MANAGER = "HealthIQ_SecurityManager";
            public const string PRODUCT_MANAGER = "HealthIQ_ProductManager";
            public const string NOTIFICATION_MANAGER = "HealthIQ_NotificationManager";
            public const string STUDENT_MANAGER = "HealthIQ_StudentManager";
            public const string ADMIN_MANAGER = "HealthIQ_AdminManager";
        }

    }
}
