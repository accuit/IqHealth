﻿using IqHealth.Data.Persistence;
using IqHealth.Data.Persistence.DTO;
using IqHealth.Data.Persistence.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using System.Web.Http.Results;

namespace IqHealth.WebApi.Controllers
{
    [RoutePrefix("api/services")]
    public class ServicesController : ApiController
    {
        private readonly IqHealthDBContext _context;
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public ServicesController()
        {
            _context = new IqHealthDBContext();
        }

        [HttpGet]
        [Route("data/{id}")]
        public JsonResponse<List<HealthServiceMaster>> GetServices(int id)
        {
            JsonResponse<List<HealthServiceMaster>> response = new JsonResponse<List<HealthServiceMaster>>();
            List<HealthServiceMaster> services = new List<HealthServiceMaster>();
            try
            {

                services = _context.HealthServiceMasters.Where(x => x.IsDeleted == 0 && x.CompanyID == id).ToList();
                if (services != null)
                {
                    foreach (var item in services)
                    {
                        item.ServicesInclList = new List<string>();
                        if (!string.IsNullOrEmpty(item.ServicesIncluded))
                            foreach (var i in item.ServicesIncluded.Split(','))
                                item.ServicesInclList.Add(i.Trim(' '));
                    }
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Sertvices successfully fetched.";
                }
                else
                {
                    response.StatusCode = "500";
                    response.IsSuccess = true;
                    response.Message = "No services found. Please try again.";
                }

            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            response.SingleResult = services;
            return response;
        }

        [HttpGet]
        [Route("service-details/{id}")]
        public JsonResponse<HealthServiceMaster> GetServiceByID(int id)
        {
            JsonResponse<HealthServiceMaster> response = new JsonResponse<HealthServiceMaster>();
            HealthServiceMaster service = new HealthServiceMaster();
            try
            {
                service = _context.HealthServiceMasters.Where(x => x.IsDeleted == 0 && x.ID == id).First();
                if (service != null)
                {
                    service.ServicesInclList = new List<string>();
                    if (!string.IsNullOrEmpty(service.ServicesIncluded))
                    {
                        foreach (var i in service.ServicesIncluded.Split(','))
                            service.ServicesInclList.Add(i.Trim(' '));
                    }

                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Service successfully fetched.";
                }
                else
                {
                    response.StatusCode = "500";
                    response.IsSuccess = true;
                    response.Message = "No services found. Please try again.";
                }

            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            response.SingleResult = service;
            return response;
        }

        [HttpGet()]
        [Route("all-tests", Name = "GetAllTests")]
        public JsonResponse<List<TestMaster>> GetAllTests()
        {
            JsonResponse<List<TestMaster>> response = new JsonResponse<List<TestMaster>>();

            List<TestMaster> tests = new List<TestMaster>();
            try
            {
                tests = _context.TestMasters.Where(x => x.IsDeleted == 0).ToList();
                if (tests != null)
                {
                    response.StatusCode = "200";
                    response.IsSuccess = true;
                    response.Message = "Data collected.";
                }
                else
                {
                    response.StatusCode = "500";
                    response.IsSuccess = true;
                    response.Message = "No data found.";
                }
            }
            catch (Exception ex)
            {
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }

            response.SingleResult = tests;
            return response;

        }

        [HttpGet]
        [Route("all-package-categories")]
        public JsonResponse<List<PackageCategory>> GetAllPackageCategories()
        {

            JsonResponse<List<PackageCategory>> response = new JsonResponse<List<PackageCategory>>();
            List<PackageCategory> categories = _context.PackageCategories.ToList();

            response.SingleResult = categories;
            response.StatusCode = "200";
            response.Message = "Data collected.";
            response.IsSuccess = true;

            return response;
        }

        [HttpGet]
        [Route("packages-by-category/{id}")]
        public JsonResponse<List<PackageMaster>> GetPackagesByCategory(int id)
        {

            JsonResponse<List<PackageMaster>> response = new JsonResponse<List<PackageMaster>>();
            List<PackageMaster> allPackages = _context.PackageMasters.Where(x => x.IsDeleted == 0 && x.CatgID == id).ToList(); // Only reequest will be sent to fetch the data.

            foreach (var test in allPackages)
                test.TestMasters = _context.TestMasters.Where(x => x.PackageID == test.ID).ToList();


            response.SingleResult = allPackages;
            response.StatusCode = "200";
            response.Message = "Data collected.";
            response.IsSuccess = true;

            return response;
        }

        [HttpGet]
        [Route("all-packages", Name = "GetAllPackages")]
        public JsonResponse<List<PackageCategory>> GetAllPackages()
        {

            JsonResponse<List<PackageCategory>> response = new JsonResponse<List<PackageCategory>>();
            List<PackageCategory> categories = _context.PackageCategories.ToList();

            List<PackageMaster> allPackages = _context.PackageMasters.Where(x => x.IsDeleted == 0).ToList(); // Only reequest will be sent to fetch the data.


            foreach (var catg in categories)
            {
                catg.PackageMasters = allPackages.Where(x => x.CatgID == catg.ID && x.IsDeleted == 0).ToList();
                foreach (var test in catg.PackageMasters)
                {
                    test.TestMasters = _context.TestMasters.Where(x => x.PackageID == test.ID).ToList();
                }
            }

            response.SingleResult = categories;
            response.StatusCode = "200";
            response.Message = "Data collected.";
            response.IsSuccess = true;

            return response;
        }

        [HttpGet]
        [Route("packages", Name = "GetPackages")]
        public JsonResponse<List<PackageMaster>> GetPackages()
        {

            JsonResponse<List<PackageMaster>> response = new JsonResponse<List<PackageMaster>>();

            response.SingleResult = _context.PackageMasters.Where(x => x.IsDeleted == 0).ToList();
            response.StatusCode = "200";
            response.Message = "Data collected.";
            response.IsSuccess = true;

            return response;
        }


        [HttpPost]
        [ResponseType(typeof(HealthServiceMaster))]
        [Route("submit", Name = "SubmitService")]
        public IHttpActionResult SubmitService(HealthServiceMaster service)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            var serv = _context.HealthServiceMasters.Where(x => x.ID == service.ID).FirstOrDefault();
            if (serv == null)
            {
                if (!isDuplicateName(service.Name))
                {
                    _context.HealthServiceMasters.Add(service);
                    return Ok("Service with this Name already exists. Try different name.");
                }
            }
            else
            {
                serv.Name = service.Name;
                serv.Description = service.Description;
                serv.ImageUrl = service.ImageUrl;
                serv.PageUrl = service.PageUrl;
                serv.Type = service.Type;
                serv.ServicesIncluded = service.ServicesIncluded;
                serv.Type = service.Type;
                serv.UpdatedDate = DateTime.Now;
                _context.Entry(serv).State = EntityState.Modified;
            }

            _context.SaveChanges();
            return Ok(service);
        }

        private bool isDuplicateName(string name)
        {
            int count = _context.HealthServiceMasters.Where(x => x.Name == name).ToList().Count();
            if (count > 1)
                return true;
            else
                return false;

        }

        [HttpGet]
        [Route("delete/{id}")]
        public IHttpActionResult DeleteService(int Id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var service = _context.HealthServiceMasters.Where(x => x.ID == Id).FirstOrDefault();
            if (service != null)
            {
                service.IsDeleted = 1;
                _context.Entry(service).State = EntityState.Modified;
                _context.SaveChanges();
                return Ok(true);
            }

            return Content(HttpStatusCode.NoContent, "No service found.");
        }

        [HttpGet]
        [Route("tests")]
        public IHttpActionResult GetAppointments()
        {
            var appointments = new List<TestMaster>();
            appointments = _context.TestMasters.ToList();
            if (appointments != null)
                return Ok(appointments);

            else
                return NotFound();
        }

    }
}
