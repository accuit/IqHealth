using System;
using System.Linq;
using HealthIQ.CommonLayer.Aspects;
using Unity;
using Unity.Lifetime;

namespace HealthIQ.CommonLayer.AopContainer
{
    public static class AopEngine
    {
        #region Private Data Mebers & Variables

        private static IUnityContainer _container;

        #endregion

        #region Public Properties


        /// <summary>
        /// Property for Ioc Container -- Read Only
        /// </summary>
        public static IUnityContainer Container
        {
            get
            {
                if (_container == null)
                {
                    Initialize();
                }
                return _container;
            }
        }


        #endregion

        #region Private Static Methods
        /// <summary>
        /// Method to initialize Unity Ioc Container
        /// </summary>
        public static void Initialize()
        {
            //create an instance for Unity Container for Dependency Injection
            _container = new UnityContainer();
        }

        #endregion

        /// <summary>
        /// Definition for the Unity Resolve Property.
        /// </summary>
        /// <typeparam name="T">Object</typeparam>
        /// <returns>Object</returns>
        public static T Resolve<T>()
        {
            if (_container.IsRegistered(typeof(T)))
            {
                return _container.Resolve<T>();
            }

            return default;
        }
        /// <summary>
        /// Definition for the Unity Resolve Property with name property.
        /// </summary>
        /// <typeparam name="T">Object</typeparam>
        /// <param name="name">string specifies the name</param>
        /// <returns>Object</returns>
        public static T Resolve<T>(string name)
        {
            if (_container.IsRegistered(typeof(T), name))
            {
                return _container.Resolve<T>(name);
            }

            return default;
        }

        /// <summary>
        /// Definition for the Unity Resolve Property with name property.
        /// </summary>
        /// <typeparam name="T">Generic object type</typeparam>
        /// <param name="instanceName">instance enum name</param>
        /// <param name="application">application name</param>
        /// <returns>returns instance</returns>
        public static T Resolve<T>(AspectEnums.AspectInstanceNames instanceName, AspectEnums.ApplicationName application)
        {
            string name = instanceName.ToString();
            name = String.Format("{0}_{1}", application.ToString(), instanceName.ToString());
            if (_container.IsRegistered(typeof(T), name))
            {
                return _container.Resolve<T>(name);
            }

            return default;
        }

        /// <summary>
        /// Definition for the Unity Resolve Property with name property.
        /// </summary>
        /// <typeparam name="T">Generic object type</typeparam>
        /// <param name="instanceName">instance enum name</param>
        /// <param name="application">application name</param>
        /// <returns>returns instance</returns>
        public static T Resolve<T>(AspectEnums.PeristenceInstanceNames instanceName, AspectEnums.ApplicationName application)
        {
            string name = instanceName.ToString();
            name = String.Format("{0}_{1}", application.ToString(), instanceName.ToString());
            if (_container.IsRegistered(typeof(T), name))
            {
                return _container.Resolve<T>(name);
            }

            return default;
        }

        /// <summary>
        /// Definition for the Unity Register.
        /// </summary>
        /// <param name="from">Type</param>
        /// <param name="to">Type</param>
        public static void Register(Type from, Type to)
        {
            if (_container.Registrations.Any(c => c.MappedToType == to && c.RegisteredType == from) == false)
            {
                _container.RegisterType(from, to, new ContainerControlledLifetimeManager());
            }
        }

        /// <summary>
        /// Method to register objects with specified property injection using Unity Ioc Container
        /// </summary>
        /// <param name="from">object map from</param>
        /// <param name="to">object map to</param>
        /// <param name="propertyName">property name to inject</param>
        public static void Register(Type from, Type to, string propertyName)
        {
            if (_container.Registrations.Any(c => c.MappedToType == to && c.RegisteredType == from) == false)
            {
                _container.RegisterType(from, to, new ContainerControlledLifetimeManager());
            }
        }
        /// <summary>
        /// This generic method has been used to register the objects
        /// </summary>
        /// <typeparam name="T">object map from</typeparam>
        /// <typeparam name="K">object map to</typeparam>
        public static void Register<T, K>()
        {
            _container.RegisterType(typeof(T), typeof(K));
        }
        /// <summary>
        /// Method to register objects with specified instance name using Unity Ioc Container
        /// </summary>
        /// <typeparam name="T">Generic Type object map from</typeparam>
        /// <typeparam name="K">Generic Type object map to</typeparam>
        /// <param name="instanceName">instance name</param>
        public static void Register<T, K>(string instanceName)
        {
            _container.RegisterType(typeof(T), typeof(K), instanceName, new ContainerControlledLifetimeManager());
        }

        /// <summary>
        /// Method to register objects with specified property injection using Unity Ioc Container
        /// </summary>
        /// <typeparam name="T">Generic object to map</typeparam>
        /// <param name="instanceName">instance name</param>
        public static void Register<T>(string instanceName)
        {
            _container.RegisterType(typeof(T), instanceName, new ContainerControlledLifetimeManager());
        }

        /// <summary>
        /// To register the instance.
        /// </summary>
        /// <typeparam name="T">Object</typeparam>
        /// <param name="name">string specifies the name</param>
        /// <param name="instanceNameToRegister">Object</param>
        public static void RegisterInstance<T>(string name, T instanceNameToRegister)
        {
            _container.RegisterInstance(name, instanceNameToRegister);
        }

    }
}
