﻿using AutoMapper;
using HealthIQ.BusinessLayer.Base;
using HealthIQ.BusinessLayer.Services;
using HealthIQ.BusinessLayer.Services.BO;
using HealthIQ.CommonLayer.Aspects;
using System;
using Unity;
using HealthIQ.PersistenceLayer.Data.Repository;
using HealthIQ.PersistenceLayer.Data.Impl;
using HealthIQ.PersistenceLayer.Data.AdminEntity;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.BusinessLayer.ServiceImpl;
using HealthIQ.BusinessLayer.Base.Manager;
using HealthIQ.BusinessLayer.Services.Contracts;
using HealthIQ.CommonLayer.AopContainer;

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
            //AopEngine.Container.RegisterType<IProductRepository, ProductDataImpl>(GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames.ProductDataImpl, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<INotificationRepository, NotificationDataImpl>(GetPersistenceRegisterInstanceName(AspectEnums.PeristenceInstanceNames.NotificationDataImpl, AspectEnums.ApplicationName.HealthIQ));
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
            //AopEngine.Container.RegisterType<IProductService, ProductManager>(GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames.ProductManager, AspectEnums.ApplicationName.HealthIQ));
            AopEngine.Container.RegisterType<INotificationService, NotificationManager>(GetBusinessRegisterInstanceName(AspectEnums.AspectInstanceNames.NotificationManager, AspectEnums.ApplicationName.HealthIQ));
        }

        private static void MapEntities()
        {
            var config = MapBOEntities();
            AutoMapper.IMapper mapper = config.CreateMapper();
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
                
                map.CreateMap<UserMasterDTO, UserMaster>();
                map.CreateMap<UserMaster, UserMasterDTO>();

            });

            return config;


        }
    }
}
