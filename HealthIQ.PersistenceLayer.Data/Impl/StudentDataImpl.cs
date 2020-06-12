using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthIQ.PersistenceLayer.Data.Impl
{
    public class StudentDataImpl : BaseDataImpl, IStudentRepository
    {
        public bool DeleteStudentInfo(int Id)
        {
            throw new NotImplementedException();
        }

        public List<UserMaster> GetAllStudents()
        {
            return HIQAdminContext.UserMasters.Where(x => x.IsStudent && x.IsActive && !x.IsDeleted).ToList();
        }

        public int SubmitNewStudent(UserMaster student)
        {
            student.IsStudent = true;
            HIQAdminContext.UserMasters.Add(student);
            return HIQAdminContext.SaveChanges() > 0 ? student.UserID : 0;
        }

        public bool UpdateStudentInfo(UserMaster student)
        {
            throw new NotImplementedException();
        }
    }
}
