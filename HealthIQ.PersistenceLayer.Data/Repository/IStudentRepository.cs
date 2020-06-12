using HealthIQ.PersistenceLayer.Data.AdminEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.PersistenceLayer.Data.Repository
{
    public interface IStudentRepository
    {
        List<UserMaster> GetAllStudents();
        int SubmitNewStudent(UserMaster student);
        bool UpdateStudentInfo(UserMaster student);
        bool DeleteStudentInfo(int Id);
    }
}
