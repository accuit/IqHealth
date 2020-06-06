using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.CommonLayer.Aspects.DTO
{
    public class EmailTemplateDTO
    {
        public int TemplateID { get; set; }
        public string Name { get; set; }
        public string Body { get; set; }
        public string Subject { get; set; }
        public bool IsActive { get; set; }
        public Nullable<byte> TemplateType { get; set; }
    }
}
