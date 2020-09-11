using System;
using System.Collections.Generic;
using AutoMapper;
using HealthIQ.BusinessLayer.Base;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using Unity;

namespace HealthIQ.BusinessLayer.ServiceImpl
{
    public class StudentManager : ServiceBase, IStudentService
    {
        [Dependency(ContainerDataLayerInstanceNames.STUDENT_REPOSITORY)]
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

        public UserMasterDTO GetStudentProfile(int id)
        {
            var result = StudentRepository.GetStudentProfile(id);
            return mapper.Map<UserMasterDTO>(result);
        }

        public int SubmitNewStudent(UserMasterDTO student)
        {
            UserMaster U = mapper.Map<UserMaster>(student);
            return StudentRepository.SubmitNewStudent(U);
        }


        public IList<StudentInvoiceDTO> GetStudentInvoices(int userId)
        {
            var result = StudentRepository.GetStudentInvoices(userId);
            return mapper.Map<List<StudentInvoiceDTO>>(result);
        }

        public IList<StudentInvoiceDTO> GetAllInvoices()
        {
            var result = StudentRepository.GetAllInvoices();
            return mapper.Map<List<StudentInvoiceDTO>>(result);
        }

        public bool UpdateStudentInfo(UserMasterDTO student)
        {
            throw new NotImplementedException();
        }

        public StudentInvoiceDTO GetInvoiceDetails(int id)
        {
            var result = StudentRepository.GetInvoiceDetails(id);
            return mapper.Map<StudentInvoiceDTO>(result);
        }

        public int AddUpdateStudentInvoice(StudentInvoiceDTO student)
        {
            StudentInvoice S = mapper.Map<StudentInvoice>(student);
            return StudentRepository.AddUpdateStudentInvoice(S);
        }

    }
}
