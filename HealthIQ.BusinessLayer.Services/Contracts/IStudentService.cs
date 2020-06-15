using HealthIQ.CommonLayer.Aspects.DTO;
using System.Collections.Generic;

namespace HealthIQ.BusinessLayer.Services.Contracts
{
    public interface IStudentService
    {
        List<UserMasterDTO> GetAllStudents();
        int SubmitNewStudent(UserMasterDTO student);
        bool UpdateStudentInfo(UserMasterDTO student);
        bool DeleteStudentInfo(int Id);

        StudentInvoiceDTO GetInvoiceDetails(int ID);
        int AddUpdateStudentInvoice(StudentInvoiceDTO student);
    }
}
