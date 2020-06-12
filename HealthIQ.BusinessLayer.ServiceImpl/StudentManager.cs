using AutoMapper;
using HealthIQ.BusinessLayer.Base;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using System;
using System.Collections.Generic;

namespace LaymanWoods.BusinessLayer.ServiceImpl
{
    public class StudentManager : ServiceBase, IStudentService
    {
        [Unity.Dependency(ContainerDataLayerInstanceNames.STUDENT_REPOSITORY)]
        public IStudentRepository UserRepository { get; set; }
        private readonly IMapper mapper;
        public StudentManager(IMapper mapper)
        {
            this.mapper = mapper;
        }

        public bool DeleteStudentInfo(int Id)
        {
            return UserRepository.DeleteStudentInfo(Id);
        }

        public List<UserMasterDTO> GetAllStudents()
        {
            var result = UserRepository.GetAllStudents();
            return mapper.Map<List<UserMasterDTO>>(result);
        }

        public int SubmitNewStudent(UserMasterDTO student)
        {
            UserMaster U = mapper.Map<UserMaster>(student);
            return UserRepository.SubmitNewStudent(U);
        }

        public bool UpdateStudentInfo(UserMasterDTO student)
        {
            throw new NotImplementedException();
        }
    }
}
