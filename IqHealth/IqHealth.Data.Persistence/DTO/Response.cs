using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.DTO
{
    [DataContract(Name = "{0}Response")]
    public class JsonResponse<T>
    {
        #region [Private Member]

        private bool isSuccess;
        private string message;
        private List<T> result;
        private T singleResult;
        private string statusCode;

        #endregion

        #region Properties

        /// <summary>
        /// Response result
        /// </summary>
        [DataMember]
        public List<T> Result
        {
            get { return result; }
            set { result = value; }
        }

        [DataMember]
        public T SingleResult
        {
            get { return singleResult; }
            set { singleResult = value; }
        }

        /// <summary>
        /// True, If bussiness logic return successful response
        /// </summary>
        [DataMember]
        public bool IsSuccess
        {
            get { return isSuccess; }
            set { isSuccess = value; }
        }

        /// <summary>
        /// Response message will be either for success or unsuccess
        /// </summary>
        [DataMember]
        public string Message
        {
            get { return message; }
            set { message = value; }
        }

        /// <summary>
        /// Response Status Code
        /// </summary>
        [DataMember]
        public string StatusCode
        {
            get { return statusCode; }
            set { statusCode = value; }
        }

        /// <summary>
        /// Property to get set validation messages
        /// </summary>
        [DataMember]
        public string[] FailedValidations
        {
            get;
            set;
        }

        #endregion
    }
}
