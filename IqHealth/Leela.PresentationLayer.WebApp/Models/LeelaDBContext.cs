namespace Leela.PresentationLayer.WebApp.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class LeelaDBContext : DbContext
    {
        public LeelaDBContext()
            : base("name=LeelaDBContext")
        {
        }

        public virtual DbSet<BookingMaster> BookingMasters { get; set; }
        public virtual DbSet<ContactUsEnquiry> ContactUsEnquiries { get; set; }
        public virtual DbSet<CorporateTieUpEnquiry> CorporateTieUpEnquiries { get; set; }
        public virtual DbSet<CourseCurriculum> CourseCurriculums { get; set; }
        public virtual DbSet<CourseEligibility> CourseEligibilities { get; set; }
        public virtual DbSet<CourseMaster> CourseMasters { get; set; }
        public virtual DbSet<DoctorAppointment> DoctorAppointments { get; set; }
        public virtual DbSet<DoctorMaster> DoctorMasters { get; set; }
        public virtual DbSet<DoctorSpeciality> DoctorSpecialities { get; set; }
        public virtual DbSet<HealthServiceMaster> HealthServiceMasters { get; set; }
        public virtual DbSet<HospitalMaster> HospitalMasters { get; set; }
        public virtual DbSet<JobApplication> JobApplications { get; set; }
        public virtual DbSet<OnlineEnquiry> OnlineEnquiries { get; set; }
        public virtual DbSet<OrganizeCampEnquiry> OrganizeCampEnquiries { get; set; }
        public virtual DbSet<PackageCategory> PackageCategories { get; set; }
        public virtual DbSet<PackageMaster> PackageMasters { get; set; }
        public virtual DbSet<PartnerEnquiry> PartnerEnquiries { get; set; }
        public virtual DbSet<ServiceQuestion> ServiceQuestions { get; set; }
        public virtual DbSet<SpecialityMaster> SpecialityMasters { get; set; }
        public virtual DbSet<TestMaster> TestMasters { get; set; }
        public virtual DbSet<UploadedReport> UploadedReports { get; set; }
        public virtual DbSet<UserMaster> UserMasters { get; set; }
        public virtual DbSet<CommonSetup> CommonSetups { get; set; }
        public virtual DbSet<CompanyMaster> CompanyMasters { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<SubCours> SubCourses { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<HealthServiceMaster>()
                .Property(e => e.ServiceCode)
                .IsUnicode(false);

            //modelBuilder.Entity<HealthServiceMaster>()
            //    .Property(e => e.Title)
            //    .IsUnicode(false);

            modelBuilder.Entity<HealthServiceMaster>()
                .HasMany(e => e.ServiceQuestions)
                .WithOptional(e => e.HealthServiceMaster)
                .HasForeignKey(e => e.ServiceID);

            modelBuilder.Entity<PackageCategory>()
                .HasMany(e => e.PackageMasters)
                .WithRequired(e => e.PackageCategory)
                .HasForeignKey(e => e.CatgID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.Cost)
                .HasPrecision(9, 2);

            modelBuilder.Entity<PackageMaster>()
                .HasMany(e => e.TestMasters)
                .WithOptional(e => e.PackageMaster)
                .HasForeignKey(e => e.PackageID);

            modelBuilder.Entity<ServiceQuestion>()
                .Property(e => e.Title)
                .IsUnicode(false);

            modelBuilder.Entity<ServiceQuestion>()
                .Property(e => e.ServiceCode)
                .IsUnicode(false);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.Cost)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCours>()
                .Property(e => e.IndianAdmissionFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCours>()
                .Property(e => e.ForeignAdmissionFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCours>()
                .Property(e => e.IndianOtherFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCours>()
                .Property(e => e.ForeignOtherFee)
                .HasPrecision(9, 2);
        }
    }
}
