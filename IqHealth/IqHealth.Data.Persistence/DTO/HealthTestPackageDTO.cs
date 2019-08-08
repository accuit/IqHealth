using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence.DTO
{
    public class HealthTestPackageDTO
    {
        public PackageCategory PackageCategory { get; set; }
        public List<PackageMaster> PackageMasters { get; set; }
        public List<TestMaster> TestMasters { get; set; }
    }
}
