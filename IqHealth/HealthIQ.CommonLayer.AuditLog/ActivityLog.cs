﻿using log4net;

namespace HealthIQ.CommonLayer.AuditLog
{
    public class ActivityLog
    {
        private static readonly ILog logger = log4net.LogManager.GetLogger("HealthIQ");
        public static void SetLog(string message, LogLoc location)
        {

            switch (location)
            {
                case LogLoc.ERROR:
                    logger.Error(message);
                    break;
                case LogLoc.DEBUG:
                    logger.Debug(message);
                    break;
                case LogLoc.INFO:
                    logger.Info(message);
                    break;
                default:
                    logger.Debug(message);
                    break;
            }
        }


    }
}
