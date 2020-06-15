using AutoMapper;
using HealthIQ.BusinessLayer.Base;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using System;
using System.Collections.Generic;

namespace HealthIQ.BusinessLayer.ServiceImpl
{
    public class StudentManager : ServiceBase, IStudentService
    {
        [Unity.Dependency(ContainerDataLayerInstanceNames.STUDENT_REPOSITORY)]
        public IStudentRepository StudentRepository { get; set; }
        private readonly IMapper mapper;
        public StudentManager(IMapper mapper)
        {
            this.mapper = mapper;
        }

        public bool DeleteStudentInfo(int Id)
        {
            return StudentRepository.DeleteStudentInfo(Id);
        }

        public List<UserMasterDTO> GetAllStudents()
        {
            var result = StudentRepository.GetAllStudents();
            return mapper.Map<List<UserMasterDTO>>(result);
        }

        public int SubmitNewStudent(UserMasterDTO student)
        {
            UserMaster U = mapper.Map<UserMaster>(student);
            return StudentRepository.SubmitNewStudent(U);
        }

        public bool UpdateStudentInfo(UserMasterDTO student)
        {
            throw new NotImplementedException();
        }

        public StudentInvoiceDTO GetInvoiceDetails(int ID)
        {
            throw new NotImplementedException();
        }

        public int AddUpdateStudentInvoice(StudentInvoiceDTO student)
        {
            StudentInvoice S = mapper.Map<StudentInvoice>(student);
            return StudentRepository.AddUpdateStudentInvoice(S);
        }
    }
}
