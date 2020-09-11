using System.Collections.Generic;
using HealthIQ.CommonLayer.Aspects.DTO;

namespace HealthIQ.BusinessLayer.Services.Contracts
{
    public interface IStudentService
    {
        List<UserMasterDTO> GetAllStudents();
        UserMasterDTO GetStudentProfile(int id);
        int SubmitNewStudent(UserMasterDTO student);
        bool UpdateStudentInfo(UserMasterDTO student);
        bool DeleteStudentInfo(int Id);

        StudentInvoiceDTO GetInvoiceDetails(int ID);
        int AddUpdateStudentInvoice(StudentInvoiceDTO student);
        IList<StudentInvoiceDTO> GetStudentInvoices(int userId);
        IList<StudentInvoiceDTO> GetAllInvoices();
    }
}
