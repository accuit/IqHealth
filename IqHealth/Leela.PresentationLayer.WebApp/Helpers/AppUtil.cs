using System;
using System.ComponentModel;
using System.Configuration;
using System.Globalization;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace Leela.PresentationLayer.WebApp.Helpers
{
    public static class AppUtil
    {
        #region Static Methods

        /// <summary>
        /// Method to get the Application Configuration Settings value using key name of settings
        /// </summary>
        /// <param name="key">config key name enum</param>
        /// <returns>returns application settings value</returns>
        public static string GetAppSettings(AspectEnums.ConfigKeys key)
        {
            string value = string.Empty;
            try
            {
                value = ConfigurationManager.AppSettings[key.ToString()];
            }
            catch (Exception ex)
            {
                value = string.Empty;
                //LogTraceEngine.WriteLog(ex.Message);

            }
            return value;
        }


        /// <summary>
        /// Method to get the Application Configuration Settings value using key name of settings
        /// </summary>
        /// <param name="key">string Key</param>
        /// <returns>returns application settings value</returns>
        public static string GetAppSettings(string key)
        {
            string value = string.Empty;
            try
            {
                value = ConfigurationManager.AppSettings[key];
            }
            catch (Exception ex)
            {
                value = string.Empty;
                //LogTraceEngine.WriteLog(ex.Message);

            }
            return value;
        }

        /// <summary>
        /// Method to get default value of an instance
        /// </summary>
        /// <typeparam name="T">Generic type</typeparam>
        /// <returns>returns default value</returns>
        public static T GetDefault<T>()
        {
            return default(T);
        }

        /// <summary>
        /// Method to parse string value into Enumtype
        /// </summary>
        /// <typeparam name="T">Generic type</typeparam>
        /// <param name="value">string input value</param>
        /// <returns>returns enum</returns>
        public static T ParseEnum<T>(string value)
        {
            return (T)Enum.Parse(typeof(T), value);
        }

        /// <summary>
        /// Method to get enum from number value
        /// </summary>
        /// <typeparam name="T">Generic Enum type</typeparam>
        /// <param name="number">number</param>
        /// <returns>returns Enum</returns>
        public static T NumToEnum<T>(int number)
        {
            return (T)Enum.ToObject(typeof(T), number);
        }

        /// <summary>
        /// Method to get time stamp value
        /// </summary>
        /// <returns>returns time stamp value</returns>
        public static string GetTimestamp()
        {
            string formatValue = "yyyyMMddHHmmssffff";
            return DateTime.Now.ToString(formatValue);
        }

        /// <summary>
        /// Method to get integer value from object value
        /// Note:- Do not use it for Enum 
        /// </summary>
        /// <param name="valueToConvert">Value to converted into int.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param>
        /// <returns>returns integer value</returns>
        public static int ConvertToInt(object valueToConvert, int defaultValue)
        {
            if (valueToConvert == null)
                return defaultValue;

            int.TryParse(valueToConvert.ToString(), out defaultValue);
            return defaultValue;
        }

        /// <summary>
        /// Method to get long value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to converted into long.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param>
        /// <returns>returns long value</returns>
        public static long ConvertToLong(object valueToConvert, long defaultValue)
        {
            if (valueToConvert == null)
                return defaultValue;

            long.TryParse(valueToConvert.ToString(), out defaultValue);
            return defaultValue;
        }

        /// <summary>
        /// Method to get decimal value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to converted into decimal.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param>
        /// <returns>returns Decimal value</returns>
        public static decimal ConvertToDecimal(object valueToConvert, decimal defaultValue)
        {
            if (valueToConvert == null)
                return defaultValue;

            decimal.TryParse(valueToConvert.ToString(), out defaultValue);
            return defaultValue;
        }

        /// <summary>
        /// Method to get string value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to converted into string.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param>
        /// <returns>returns string value</returns>
        public static string ConvertToString(object valueToConvert, string defaultValue)
        {
            if (valueToConvert == null)
                return defaultValue;

            return valueToConvert.ToString();
        }

        /// <summary>
        /// Method to get Boolean value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to converted into Boolean.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param>
        /// <returns>returns Boolean value</returns>
        public static bool ConvertToBoolean(object valueToConvert, bool defaultValue)
        {
            if (valueToConvert == null)
                return defaultValue;

            bool.TryParse(valueToConvert.ToString(), out defaultValue);
            return defaultValue;
        }

        /// <summary>
        ///  Method to get sort direction value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to converted into SortDirection.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param>
        /// <returns>returns sort direction value</returns>
        public static SortDirection ConvertToSortDirection(object valueToConvert, SortDirection defaultValue)
        {
            if (valueToConvert == null)
                return defaultValue;

            return (SortDirection)valueToConvert;
        }

        /// <summary>
        ///  Method to get datetime value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to converted into DateTime.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param>
        /// <returns>returns DateTime value</returns>
        public static DateTime ConvertToDateTime(object valueToConvert, DateTime defaultValue)
        {
            if (valueToConvert == null)
                return defaultValue;

            DateTime.TryParse(valueToConvert.ToString(), out defaultValue);
            return defaultValue;
        }

        /// <summary>
        /// Method to convert enum values integer.
        /// </summary>
        /// <param name="valueToConvert"> VAlue to converted into integer</param>
        /// <returns>returns Integer value.</returns>
        public static int ConvertEnumToInt(Enum valueToConvert)
        {
            return Convert.ToInt32(valueToConvert);
        }

        /// <summary>
        /// Method to parse enum status string 
        /// </summary>
        /// <param name="value">enum value</param>
        /// <returns>returns enum string</returns>
        public static string GetEnumStatusString(Enum value)
        {
            return Convert.ToString(ConvertEnumToInt(value)).PadLeft(3, '0');
        }

        /// <summary>
        /// Method to convert enum values String.
        /// </summary>
        /// <param name="valueToConvert"> Value to converted into integer</param>
        /// <returns>returns Integer value.</returns>
        public static string ConvertEnumToString(Enum valueToConvert)
        {
            return Convert.ToString(Convert.ToInt32(valueToConvert));
        }

        /// <summary>
        /// Method to convert enum to string value
        /// </summary>
        /// <param name="valueToConvert">Enum to converted into string</param>
        /// <returns>returns enum string value</returns>
        public static string ConvertEnumToStringValue(Enum valueToConvert)
        {
            return Convert.ToString(valueToConvert);
        }

        /// <summary>
        /// Convert int to null value or actual value
        /// </summary>
        /// <param name="valuToConvert">Value to converted into integer</param>
        /// <returns>returns Integer value</returns>
        public static Nullable<int> ConvertToInt(object valueToConvert)
        {
            if (valueToConvert == null)
                return null;

            int defaultValue = 0;
            int.TryParse(valueToConvert.ToString(), out defaultValue);

            return defaultValue;
        }

        /// <summary>
        /// Convert long to null value or actual value
        /// </summary>
        /// <param name="valuToConvert">Value to converted into long</param>
        /// <returns>returns Long value</returns>
        public static Nullable<long> ConvertToLong(object valueToConvert)
        {
            if (valueToConvert == null)
                return null;

            long defaultValue = 0;
            long.TryParse(valueToConvert.ToString(), out defaultValue);

            return defaultValue;
        }

        /// <summary>
        /// Method to get guid value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to be converted into guid.</param>
        /// <param name="defaultValue">Default value if conversion fail.</param> 
        /// <returns>returns guid value</returns>
        public static Guid ConvertToGuid(object valueToConvert, Guid defaultValue)
        {
            if (valueToConvert != null && Guid.TryParse(valueToConvert.ToString(), out defaultValue))
            {
                return defaultValue;
            }

            return defaultValue;
        }

        /// <summary>
        /// Method to get guid value from object value
        /// </summary>
        /// <param name="valueToConvert">Value to be converted into guid.</param>
        /// <returns>returns guid value or null</returns>
        public static Guid? ConvertToGuid(object valueToConvert)
        {
            Guid defaultValue = Guid.Empty;
            if (valueToConvert != null && Guid.TryParse(valueToConvert.ToString(), out defaultValue))
            {
                if (defaultValue != Guid.Empty)
                {
                    return defaultValue;
                }
            }
            return null;
        }

        /// <summary>
        /// Method to compare two strings 
        /// </summary>
        /// <param name="input1">First String</param>
        /// <param name="input2">Second String</param>
        /// <param name="ignoreCase">Ignore Case</param>
        /// <returns>returns comparison status, true if equals otherwise false</returns>
        public static bool CompareString(string input1, string input2, bool ignoreCase)
        {
            return (string.Compare(input1, input2, ignoreCase, CultureInfo.CurrentCulture) == 0);
        }

        /// <summary>
        /// Replaced special character
        /// </summary>
        /// <param name="specialCharacterString">special character string</param>
        /// <returns>replaced string</returns>
        public static string ReplaceSpecialCharacter(string specialCharacterString)
        {
            string replacedString1 = specialCharacterString.Replace("<", "&lt");
            string replacedString2 = replacedString1.Replace(">", "&gt");
            return replacedString2;
        }

        /// <summary>
        /// Replaced special character 
        /// </summary>
        /// <param name="specialCharacterString">special character string for display special character</param>
        /// <returns>replaced string</returns>
        public static string ReplaceSpecialCharacterViceVersa(string specialCharacterString)
        {
            string replacedString1 = specialCharacterString.Replace("&lt", "<");
            string replacedString2 = replacedString1.Replace("&gt", ">");
            return replacedString2;
        }

        public static string GetUploadDirectory(AspectEnums.FileType fileType)
        {
            string fileDirectory = HttpContext.Current.Server.MapPath("~/Content");
            switch (fileType)
            {
                case AspectEnums.FileType.DiagnosticReport:
                    fileDirectory = fileDirectory + @"\DiagnosticReports";
                    break;
                case AspectEnums.FileType.Resume:
                    fileDirectory = fileDirectory + @"\Resumes\";
                    break;
            }
            return fileDirectory;
        }

        /// <summary>
        /// Method to generate unique keys
        /// </summary>
        /// <returns>returns unique key</returns>
        //public static string GetUniqueKey()
        //{
        //    int maxSize = 10;
        //    char[] chars = new char[62];
        //    string a;
        //    a = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        //    chars = a.ToCharArray();
        //    int size = maxSize;
        //    byte[] data = new byte[1];
        //    RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
        //    crypto.GetNonZeroBytes(data);
        //    size = maxSize;
        //    data = new byte[size];
        //    crypto.GetNonZeroBytes(data);
        //    StringBuilder result = new StringBuilder(size);
        //    foreach (byte b in data)
        //    { result.Append(chars[b % (chars.Length - 1)]); }
        //    return result.ToString();
        //}

        /// <summary>
        /// Method to delete the files
        /// </summary>
        /// <param name="fileName">complete qualified file name</param>
        /// <returns>returns boolean response</returns>
        public static bool DeleteFile(string fileName)
        {
            bool isDeleted = false;
            if (System.IO.File.Exists(fileName))
            {
                System.IO.File.Delete(fileName);
                isDeleted = true;
            }
            return isDeleted;
        }


        #region Vinay Kanojia

        public static string GetEnumDescription(Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());

            DescriptionAttribute[] attributes =
                (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

            if (attributes != null && attributes.Length > 0)
                return attributes[0].Description;
            else
                return value.ToString();
        }

        #endregion

        /// <summary>
        /// Get Unique GUID string
        /// </summary>
        /// <returns></returns>
        public static string GetUniqueGuidString()
        {
            return Guid.NewGuid().ToString();
        }
        /// <summary>
        /// Get Unique Random Number in given Range
        /// </summary>
        /// <param name="MinRange">Minimum Range</param>
        /// <param name="MaxRange">Maximum Range</param>
        /// <returns></returns>
        public static string GetUniqueRandomNumber(int MinRange, int MaxRange)
        {
            Random rnd = new Random();
            return (rnd.Next(MinRange, MaxRange)).ToString();
        }

        #endregion
    }
}