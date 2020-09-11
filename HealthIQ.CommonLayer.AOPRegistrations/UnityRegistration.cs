using System;
using AutoMapper;
using HealthIQ.BusinessLayer.Base;
using HealthIQ.BusinessLayer.Base.Manager;
using HealthIQ.BusinessLayer.ServiceImpl;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.AopContainer;
using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects.Security;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.PersistenceLayer.Data.Impl;
using HealthIQ.PersistenceLayer.Data.LocalEntity;
using HealthIQ.PersistenceLayer.Data.Repository;
using Unity;
using IMapper = AutoMapper.IMapper;

namespace HealthIQ.CommonLayer.AOPRegistrations
{
    public class UnityRegistration
    {
        public static void InitializeAopContainer()
        {
            AopEngine.Initialize();
            InitializeLibrary();
            MapEntities();
        }

        private static void InitializeLibrary()
        {
            InitializeLibraryPersistenceLayer();
            InitializeLibraryBusinessLayer();
        }

        private static void InitializeLibraryPersistenceLayer()
        {
            AopEngine.Container.RegisterType<IUserRepository, UserDataImpl>(GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames.UserDataImpl, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<ISecurityRepository, SecurityDataImpl>(GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames.SecurityDataImpl, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<IStudentRepository, StudentDataImpl>(GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames.StudentDataImpl, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<INotificationRepository, NotificationDataImpl>(GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames.NotificationDataImpl, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<IAdminRepository, AdminDataImpl>(GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames.AdminDataImpl, AspectEnums.ApplicationName.HealthIQ));
        }

        private static string GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames aspectName, AspectEnums.ApplicationName application)
        {
            return String.Format("{0}_{1}", application.ToString(), aspectName.ToString());
        }

        private static string GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames aspectName, AspectEnums.ApplicationName application)
        {
            return String.Format("{0}_{1}", application.ToString(), aspectName.ToString());
        }

        private static void InitializeLibraryBusinessLayer()
        {
            AopEngine.Container.RegisterType<IUserService, UserManager>(GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames.UserManager, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<ISecurityService, SecurityManager>(GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames.SecurityManager, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<IStudentService, StudentManager>(GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames.StudentManager, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<INotificationService, NotificationManager>(GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames.NotificationManager, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<IAdminService, AdminManager>(GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames.AdminManager, AspectEnums.ApplicationName.HealthIQ));
        }

        private static void MapEntities()
        {
            var config = MapBOEntities();
            IMapper mapper = config.CreateMapper();
            AopEngine.Container.RegisterInstance(mapper);
        }

        private static MapperConfiguration MapBOEntities()
        {

            var config = new MapperConfiguration(map =>
            {
                //Create all maps here
                map.CreateMap<CommonSetup, CommonSetupDTO>();
                map.CreateMap<CommonSetupDTO, CommonSetup>();

                map.CreateMap<EmailTemplate, EmailTemplateDTO>();
                map.CreateMap<EmailTemplateDTO, EmailTemplate>();

                map.CreateMap<OTPMaster, OTPDTO>();
                map.CreateMap<OTPDTO, OTPMaster>();

                map.CreateMap<UserMasterDTO, UserMaster>()
                .ForMember(d => d.Email, opt => opt.MapFrom(s => EncryptionEngine.EncryptString(s.Email)))
                .ForMember(d => d.LoginName, opt => opt.MapFrom(s => EncryptionEngine.EncryptString(s.LoginName)))
                .ForMember(d => d.Password, opt => opt.MapFrom(s => EncryptionEngine.EncryptString(s.Password)));
                map.CreateMap<UserMaster, UserMasterDTO>()
                 .ForMember(d => d.Email, opt => opt.MapFrom(s => EncryptionEngine.DecryptString(s.Email)))
                .ForMember(d => d.LoginName, opt => opt.MapFrom(s => EncryptionEngine.DecryptString(s.LoginName)))
                .ForMember(d => d.Password, opt => opt.MapFrom(s => EncryptionEngine.DecryptString(s.Password)));

                map.CreateMap<RoleMaster, RoleMasterDTO>();
                map.CreateMap<RoleMasterDTO, RoleMaster>();
                map.CreateMap<UserRole, UserRoleDTO>();
                map.CreateMap<UserRoleDTO, UserRole>();
                map.CreateMap<RoleModule, RoleModuleDTO>();
                map.CreateMap<RoleModuleDTO, RoleModule>();
                map.CreateMap<ModuleMaster, ModuleMasterDTO>();
                map.CreateMap<ModuleMasterDTO, ModuleMaster>();

                map.CreateMap<PermissionsDTO, Permission>();
                map.CreateMap<Permission, PermissionsDTO>();
                map.CreateMap<UserRoleModulePermission, UserRoleModulePermissionDTO>();
                map.CreateMap<UserRoleModulePermission, UserRoleModulePermissionDTO>();

                map.CreateMap<StudentInvoice, StudentInvoiceDTO>();
                map.CreateMap<StudentInvoiceDTO, StudentInvoice>();
                map.CreateMap<InvoiceItem, InvoiceItemsDTO>();
                map.CreateMap<InvoiceItemsDTO, InvoiceItem>();

                map.CreateMap<Blog, BlogMasterDTO>();
                map.CreateMap<BlogMasterDTO, Blog>();
                map.CreateMap<Blog, BlogCategoryMasterDTO>();
                map.CreateMap<BlogCategoryMasterDTO, BlogMasterDTO>();
                map.CreateMap<BlogMaster, BlogMasterDTO>();
                map.CreateMap<BlogMasterDTO, BlogMaster>();
                map.CreateMap<BlogCategoryMaster, BlogCategoryMasterDTO>();
                map.CreateMap<BlogCategoryMasterDTO, BlogCategoryMaster>();
                map.CreateMap<BlogCategoryMappingDTO, BlogCategoryMapping>();
                map.CreateMap<BlogCategoryMapping, BlogCategoryMappingDTO>();

                map.CreateMap<CourseMaster, CourseMasterDTO>();
                map.CreateMap<CourseMasterDTO, CourseMaster>();
                map.CreateMap<SubCourse, SubCourseDTO>();
                map.CreateMap<SubCourseDTO, SubCourse>();
                map.CreateMap<CourseCurriculum, CourseMasterDTO>();
                map.CreateMap<CourseMasterDTO, CourseCurriculum>();

            });

            return config;
        }
    }
}
