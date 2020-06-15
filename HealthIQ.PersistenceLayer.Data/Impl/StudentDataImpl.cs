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
        public int AddUpdateStudentInvoice(StudentInvoice student)
        {
            if (student.ID == 0)
            {
                student.CreatedDate = DateTime.Now;
                HIQAdminContext.StudentInvoices.Add(student);
            }
            else
            {
                var invoice = HIQAdminContext.StudentInvoices.FirstOrDefault(x => x.ID == student.ID);
                if (invoice != null)
                {
                    invoice.Name = student.Name;
                    invoice.Paymentmode = student.Paymentmode;
                    invoice.PaymentStatus = student.PaymentStatus;
                    invoice.Mobile = student.Mobile;
                    invoice.Status = student.Status;
                    invoice.SubTotal = student.SubTotal;
                    invoice.ModifiedDate = DateTime.Now;
                    HIQAdminContext.Entry<StudentInvoice>(invoice).State = System.Data.Entity.EntityState.Modified;
                }

            }

            return HIQAdminContext.SaveChanges() > 0 ? student.UserID : 0;
        }

        public bool DeleteStudentInfo(int Id)
        {
            throw new NotImplementedException();
        }

        public List<UserMaster> GetAllStudents()
        {
            return HIQAdminContext.UserMasters.Where(x => x.IsStudent && x.IsActive && !x.IsDeleted).ToList();
        }

        public StudentInvoice GetInvoiceDetails(int ID)
        {
            return HIQAdminContext.StudentInvoices.First(x => x.ID == ID);
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
