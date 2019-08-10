using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence
{
    public static class AspectEnums
    {
        public enum EmailStatus
        {
            None = 0,
            Pending = 1,
            Failed = 2,
            Sent = 3
        }

    }
}
