
using HealthIQ.PersistenceLayer.Data.AdminEntity;

namespace HealthIQ.PersistenceLayer.Data.Impl
{
    public abstract class BaseDataImpl
    {
        private HIQAdminEntities hIQAdminContext;

        #region Constructors

        /// <summary>
        /// Constructor to intialize database instance for EF
        /// </summary>
        public BaseDataImpl()
        {
            hIQAdminContext = new HIQAdminEntities();
        }

        #endregion

        /// <summary>
        /// Property to get db context instance of Entity Framework Database
        /// </summary>
        public HIQAdminEntities HIQAdminContext
        {
            get
            {
                return hIQAdminContext;
            }
        }
    }
}
