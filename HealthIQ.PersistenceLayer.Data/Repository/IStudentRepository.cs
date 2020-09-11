using System.Collections.Generic;
using HealthIQ.PersistenceLayer.Data.AdminEntity;

namespace HealthIQ.PersistenceLayer.Data.Repository
{
    public interface IStudentRepository
    {
        List<UserMaster> GetAllStudents();
        UserMaster GetStudentProfile(int id);
        int SubmitNewStudent(UserMaster student);
        bool UpdateStudentInfo(UserMaster student);
        bool DeleteStudentInfo(int Id);
        StudentInvoice GetInvoiceDetails(int ID);
        int AddUpdateStudentInvoice(StudentInvoice student);
        IList<StudentInvoice> GetStudentInvoices(int userId);
        IList<StudentInvoice> GetAllInvoices();
    }
}
