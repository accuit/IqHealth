using HealthIQ.CommonLayer.Aspects;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using System;
using System.Collections.Generic;
using System.Linq;

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
                    invoice.PaymentMode = student.PaymentMode;
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

        public IList<StudentInvoice> GetAllInvoices()
        {
            return HIQAdminContext.StudentInvoices.Where(x => !x.IsDeleted).ToList();
        }
        public IList<StudentInvoice> GetStudentInvoices(int userId)
        {
            return HIQAdminContext.StudentInvoices.Where(x => x.UserID == userId).ToList();
        }

        public UserMaster GetStudentProfile(int id)
        {
            return HIQAdminContext.UserMasters.FirstOrDefault(x => x.UserID == id && x.IsActive && !x.IsDeleted);
        }

        public int SubmitNewStudent(UserMaster student)
        {
            student.IsActive = true;
            student.AccountStatus = 1;
            student.Password = "123456";
            student.CreatedDate = DateTime.Now;
            HIQAdminContext.UserMasters.Add(student);
            var result = HIQAdminContext.SaveChanges() > 0 ? student.UserID : 0;

            if (result > 0 && student.IsEmployee == true)
            {
                HIQAdminContext.UserRoles.Add(new UserRole { UserID = student.UserID, RoleID = (int)AspectEnums.RoleType.Admin, CreatedBy = student.CreatedBy, CreatedDate = DateTime.Now, IsActive = true });
                HIQAdminContext.SaveChanges();
            }
            return result;
        }

        public bool UpdateStudentInfo(UserMaster student)
        {
            throw new NotImplementedException();
        }
    }
}
