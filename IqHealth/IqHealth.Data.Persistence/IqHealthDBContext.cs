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
            : base("LeelaDBConnection")
        {
            this.Configuration.LazyLoadingEnabled = false;
            this.Configuration.ProxyCreationEnabled = false;
        }

        public virtual DbSet<BookingMaster> BookingMasters { get; set; }
        public virtual DbSet<DoctorAppointment> DoctorAppointments { get; set; }
        public virtual DbSet<DoctorMaster> DoctorMasters { get; set; }
        public virtual DbSet<DoctorSpeciality> DoctorSpecialities { get; set; }
        public virtual DbSet<HospitalMaster> HospitalMasters { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<PackageCategory> PackageCategories { get; set; }
        public virtual DbSet<PackageMaster> PackageMasters { get; set; }
        public virtual DbSet<SpecialityMaster> SpecialityMasters { get; set; }
        public virtual DbSet<TestMaster> TestMasters { get; set; }
        public virtual DbSet<UserMaster> UserMasters { get; set; }
        public virtual DbSet<HealthServiceMaster> HealthServiceMasters { get; set; }


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
                .HasMany(e => e.DoctorMasters)
                .WithOptional(e => e.SpecialityMaster)
                .HasForeignKey(e => e.SpecialityID);

            modelBuilder.Entity<SpecialityMaster>()
                .HasMany(e => e.DoctorSpecialities)
                .WithRequired(e => e.SpecialityMaster)
                .HasForeignKey(e => e.SpecialityID)
                .WillCascadeOnDelete(false);

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
