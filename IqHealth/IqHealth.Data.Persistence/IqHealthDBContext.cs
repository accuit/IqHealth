﻿using IqHealth.Data.Persistence.Model;
using MySql.Data.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IqHealth.Data.Persistence
{
    [DbConfigurationType(typeof(MySqlEFConfiguration))]
    public class IqHealthDBContext : DbContext
    {

        public IqHealthDBContext()
            : base("IqHealthConnection")
        {
            this.Configuration.LazyLoadingEnabled = false;
            this.Configuration.ProxyCreationEnabled = false;
        }

        public virtual DbSet<BookingMaster> BookingMasters { get; set; }
        public virtual DbSet<CommonSetup> CommonSetups { get; set; }
        public virtual DbSet<CompanyMaster> CompanyMasters { get; set; }
        public virtual DbSet<CourseCurriculum> CourseCurriculums { get; set; }
        public virtual DbSet<CourseMaster> CourseMasters { get; set; }
        public virtual DbSet<DoctorAppointment> DoctorAppointments { get; set; }
        public virtual DbSet<DoctorMaster> DoctorMasters { get; set; }
        public virtual DbSet<DoctorSpeciality> DoctorSpecialities { get; set; }
        public virtual DbSet<HospitalMaster> HospitalMasters { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<OnlineEnquiry> OnlineEnquiries { get; set; }
        public virtual DbSet<JobApplication> JobApplications { get; set; }
        public virtual DbSet<PackageCategory> PackageCategories { get; set; }
        public virtual DbSet<PackageMaster> PackageMasters { get; set; }
        public virtual DbSet<SpecialityMaster> SpecialityMasters { get; set; }
        public virtual DbSet<SubCourses> SubCourses { get; set; }
        public virtual DbSet<TestMaster> TestMasters { get; set; }
        public virtual DbSet<UserMaster> UserMasters { get; set; }
        public virtual DbSet<HealthServiceMaster> HealthServiceMasters { get; set; }
        public virtual DbSet<UploadedReports> UploadedReports { get; set; }
        public virtual DbSet<PartnerEnquiry> PartnerEnquiries { get; set; }
        public virtual DbSet<CorporateTieUpEnquiry> CorporateTieUpEnquiries { get; set; }
        public virtual DbSet<OrganizeCampEnquiry> OrganizeCampEnquiry { get; set; }
        public virtual DbSet<ContactUsEnquiry> ContactUsEnquiry { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.BookingDate)
                .HasPrecision(0);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.Landmark)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.PinCode)
                .IsUnicode(false);

            modelBuilder.Entity<BookingMaster>()
                .Property(e => e.CreatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<CommonSetup>()
                .Property(e => e.MainType)
                .IsUnicode(false);

            modelBuilder.Entity<CommonSetup>()
                .Property(e => e.SubType)
                .IsUnicode(false);

            modelBuilder.Entity<CommonSetup>()
                .Property(e => e.DisplayText)
                .IsUnicode(false);

            modelBuilder.Entity<CompanyMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<CompanyMaster>()
                .Property(e => e.LogoUrl)
                .IsUnicode(false);

            modelBuilder.Entity<CompanyMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<CompanyMaster>()
                .Property(e => e.BannerUrl)
                .IsUnicode(false);

            modelBuilder.Entity<CompanyMaster>()
                .Property(e => e.About)
                .IsUnicode(false);

            modelBuilder.Entity<CompanyMaster>()
                .Property(e => e.MapUrl)
                .IsUnicode(false);

            modelBuilder.Entity<CompanyMaster>()
                .HasMany(e => e.DoctorMasters)
                .WithOptional(e => e.CompanyMaster)
                .HasForeignKey(e => e.CompanyID);

            modelBuilder.Entity<CompanyMaster>()
                .HasMany(e => e.CourseMasters)
                .WithRequired(e => e.CompanyMaster)
                .HasForeignKey(e => e.CompanyID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CompanyMaster>()
                .HasMany(e => e.PackageMasters)
                .WithOptional(e => e.CompanyMaster)
                .HasForeignKey(e => e.CompanyID);

            modelBuilder.Entity<CompanyMaster>()
                .HasMany(e => e.PackageCategories)
                .WithOptional(e => e.CompanyMaster)
                .HasForeignKey(e => e.CompanyID);

            modelBuilder.Entity<CompanyMaster>()
                .HasMany(e => e.SpecialityMasters)
                .WithRequired(e => e.CompanyMaster)
                .HasForeignKey(e => e.CompanyID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CompanyMaster>()
                .HasMany(e => e.SubCourses)
                .WithRequired(e => e.CompanyMaster)
                .HasForeignKey(e => e.CompanyID)
                .WillCascadeOnDelete(false);

            //modelBuilder.Entity<CompanyMaster>()
            //    .HasMany(e => e.TestMasters)
            //    .WithOptional(e => e.CompanyMaster)
            //    .HasForeignKey(e => e.CompanyID);

            modelBuilder.Entity<CompanyMaster>()
                .HasMany(e => e.UserMasters)
                .WithRequired(e => e.CompanyMaster)
                .HasForeignKey(e => e.CompanyID);

            modelBuilder.Entity<CourseCurriculum>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<CourseMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<CourseMaster>()
                .Property(e => e.About)
                .IsUnicode(false);

            modelBuilder.Entity<CourseMaster>()
                .Property(e => e.Qualification)
                .IsUnicode(false);

            modelBuilder.Entity<CourseMaster>()
                .Property(e => e.Certification)
                .IsUnicode(false);

            modelBuilder.Entity<CourseMaster>()
                .HasMany(e => e.CourseCurriculums)
                .WithRequired(e => e.CourseMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CourseMaster>()
                .HasMany(e => e.SubCourses)
                .WithRequired(e => e.CourseMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DoctorAppointment>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorAppointment>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorAppointment>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorAppointment>()
                .Property(e => e.BookingDate)
                .HasPrecision(0);

            modelBuilder.Entity<DoctorAppointment>()
                .Property(e => e.CreatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.DateOfBirth)
                .HasPrecision(0);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.Specialist)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.Hospital)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.Designation)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.About)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.LogoUrl)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.CreatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.UpdatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .Property(e => e.RegistrationNo)
                .IsUnicode(false);

            modelBuilder.Entity<DoctorMaster>()
                .HasMany(e => e.DoctorAppointments)
                .WithOptional(e => e.DoctorMaster)
                .HasForeignKey(e => e.DoctorID);

            modelBuilder.Entity<DoctorMaster>()
                .HasMany(e => e.DoctorSpecialities)
                .WithRequired(e => e.DoctorMaster)
                .HasForeignKey(e => e.DoctorID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HospitalMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<HospitalMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<HospitalMaster>()
                .Property(e => e.PinCode)
                .IsUnicode(false);

            modelBuilder.Entity<HospitalMaster>()
                .HasMany(e => e.DoctorMasters)
                .WithOptional(e => e.HospitalMaster)
                .HasForeignKey(e => e.HospitalID);

            modelBuilder.Entity<Login>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Login>()
                .Property(e => e.LastLoginDate)
                .HasPrecision(0);

            modelBuilder.Entity<Login>()
                .Property(e => e.LoginDate)
                .HasPrecision(0);

            modelBuilder.Entity<PackageCategory>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<PackageCategory>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<PackageCategory>()
                .Property(e => e.SubTitle)
                .IsUnicode(false);

            modelBuilder.Entity<PackageCategory>()
                .HasMany(e => e.PackageMasters)
                .WithRequired(e => e.PackageCategory)
                .HasForeignKey(e => e.CatgID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.SubTitle)
                .IsUnicode(false);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.About)
                .IsUnicode(false);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.Cost)
                .HasPrecision(9, 2);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.CreatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.UpdatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<PackageMaster>()
                .HasMany(e => e.BookingMasters)
                .WithOptional(e => e.PackageMaster)
                .HasForeignKey(e => e.PackageID);

            modelBuilder.Entity<PackageMaster>()
                .HasMany(e => e.TestMasters)
                .WithOptional(e => e.PackageMaster)
                .HasForeignKey(e => e.PackageID);

            modelBuilder.Entity<SpecialityMaster>()
                .Property(e => e.Speciality)
                .IsUnicode(false);

            modelBuilder.Entity<SpecialityMaster>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<SpecialityMaster>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<SpecialityMaster>()
                .Property(e => e.LogoUrl)
                .IsUnicode(false);

            modelBuilder.Entity<SpecialityMaster>()
                .HasMany(e => e.DoctorMasters)
                .WithOptional(e => e.SpecialityMaster)
                .HasForeignKey(e => e.SpecialityID);

            modelBuilder.Entity<SpecialityMaster>()
                .HasMany(e => e.DoctorSpecialities)
                .WithRequired(e => e.SpecialityMaster)
                .HasForeignKey(e => e.SpecialityID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SubCourses>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<SubCourses>()
                .Property(e => e.MinQualification)
                .IsUnicode(false);

            modelBuilder.Entity<SubCourses>()
                .Property(e => e.IndianAdmissionFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCourses>()
                .Property(e => e.ForeignAdmissionFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCourses>()
                .Property(e => e.IndianOtherFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCourses>()
                .Property(e => e.ForeignOtherFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.PreTestInfo)
                .IsUnicode(false);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.Components)
                .IsUnicode(false);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.Cost)
                .HasPrecision(9, 2);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.CreatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.UpdatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<TestMaster>()
                .HasMany(e => e.BookingMasters)
                .WithOptional(e => e.TestMaster)
                .HasForeignKey(e => e.TestID);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.City)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.CreatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.UpdatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.ImageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.PageUrl)
                .IsUnicode(false);

            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.CreatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.UpdatedDate)
                .HasPrecision(0);

            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.ServicesIncluded)
                .IsUnicode(false);
        }
    }
}
