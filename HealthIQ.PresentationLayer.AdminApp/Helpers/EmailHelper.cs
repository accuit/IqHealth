using AutoMapper;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.Utilities;
using System;
using System.Linq;

namespace HealthIQ.PresentationLayer.AdminApp.Helpers
{
    public class EmailHelper
    {
        private static string getConfigValue(int companyID, AspectEnums.ConfigKeys key)
        {
            string config = AppUtil.GetAppSettings(key);
            if (config.Contains(','))
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