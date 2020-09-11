using System.Data.Entity;

namespace HealthIQ.PersistenceLayer.Data.AdminEntity
{
    public class HIQAdminEntities : DbContext
    {
        public HIQAdminEntities()
            : base("name=HIQAdminEntities")
        {
            //this.Configuration.LazyLoadingEnabled = false;
        }

        public virtual DbSet<AddressMaster> AddressMasters { get; set; }
        public virtual DbSet<BlogCategoryMapping> BlogCategoryMappings { get; set; }
        public virtual DbSet<BlogCategoryMaster> BlogCategoryMasters { get; set; }
        public virtual DbSet<BlogMaster> BlogMasters { get; set; }
        public virtual DbSet<BookingMaster> BookingMasters { get; set; }
        public virtual DbSet<CommonSetup> CommonSetups { get; set; }
        public virtual DbSet<CompanyMaster> CompanyMasters { get; set; }
        public virtual DbSet<ContactUsEnquiry> ContactUsEnquiries { get; set; }
        public virtual DbSet<CorporateTieUpEnquiry> CorporateTieUpEnquiries { get; set; }
        public virtual DbSet<CourseCurriculum> CourseCurriculums { get; set; }
        public virtual DbSet<CourseEligibility> CourseEligibilities { get; set; }
        public virtual DbSet<CourseMaster> CourseMasters { get; set; }
        public virtual DbSet<CustomerMaster> CustomerMasters { get; set; }
        public virtual DbSet<DailyLoginHistory> DailyLoginHistories { get; set; }
        public virtual DbSet<DoctorAppointment> DoctorAppointments { get; set; }
        public virtual DbSet<DoctorMaster> DoctorMasters { get; set; }
        public virtual DbSet<DoctorSpeciality> DoctorSpecialities { get; set; }
        public virtual DbSet<EmailService> EmailServices { get; set; }
        public virtual DbSet<EmailTemplate> EmailTemplates { get; set; }
        public virtual DbSet<HealthServiceMaster> HealthServiceMasters { get; set; }
        public virtual DbSet<HospitalMaster> HospitalMasters { get; set; }
        public virtual DbSet<InvoiceItem> InvoiceItems { get; set; }
        public virtual DbSet<JobApplication> JobApplications { get; set; }
        public virtual DbSet<LoginAttemptHistory> LoginAttemptHistories { get; set; }
        public virtual DbSet<ModuleMaster> ModuleMasters { get; set; }
        public virtual DbSet<OnlineEnquiry> OnlineEnquiries { get; set; }
        public virtual DbSet<OrganizeCampEnquiry> OrganizeCampEnquiries { get; set; }
        public virtual DbSet<OTPMaster> OTPMasters { get; set; }
        public virtual DbSet<PackageCategory> PackageCategories { get; set; }
        public virtual DbSet<PackageMaster> PackageMasters { get; set; }
        public virtual DbSet<PartnerEnquiry> PartnerEnquiries { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<RoleMaster> RoleMasters { get; set; }
        public virtual DbSet<RoleModule> RoleModules { get; set; }
        public virtual DbSet<SpecialityMaster> SpecialityMasters { get; set; }
        public virtual DbSet<StudentInvoice> StudentInvoices { get; set; }
        public virtual DbSet<StudentMaster> StudentMasters { get; set; }
        public virtual DbSet<SubCourse> SubCourses { get; set; }
        public virtual DbSet<SystemSetting> SystemSettings { get; set; }
        public virtual DbSet<TestMaster> TestMasters { get; set; }
        public virtual DbSet<UserDevice> UserDevices { get; set; }
        public virtual DbSet<UserMaster> UserMasters { get; set; }
        public virtual DbSet<UserReport> UserReports { get; set; }
        public virtual DbSet<UserRoleModulePermission> UserRoleModulePermissions { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }
        public virtual DbSet<UserServiceAccess> UserServiceAccesses { get; set; }
        public virtual DbSet<UserSystemSetting> UserSystemSettings { get; set; }
        public virtual DbSet<vwGetUserRoleModule> vwGetUserRoleModules { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AddressMaster>()
                .Property(e => e.Address1)
                .IsUnicode(false);

            modelBuilder.Entity<AddressMaster>()
                .Property(e => e.Address2)
                .IsUnicode(false);

            modelBuilder.Entity<AddressMaster>()
                .Property(e => e.Lattitude)
                .IsUnicode(false);

            modelBuilder.Entity<AddressMaster>()
                .Property(e => e.Longitude)
                .IsUnicode(false);

            modelBuilder.Entity<BlogCategoryMaster>()
                .HasMany(e => e.BlogCategoryMappings)
                .WithRequired(e => e.BlogCategoryMaster)
                .HasForeignKey(e => e.CategoryID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BlogMaster>()
                .HasMany(e => e.BlogCategoryMappings)
                .WithRequired(e => e.BlogMaster)
                .HasForeignKey(e => e.BlogID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CourseMaster>()
                .HasMany(e => e.StudentInvoices)
                .WithOptional(e => e.CourseMaster)
                .HasForeignKey(e => e.CourseID);

            modelBuilder.Entity<CustomerMaster>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<CustomerMaster>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<CustomerMaster>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<CustomerMaster>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<CustomerMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<CustomerMaster>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<CustomerMaster>()
                .Property(e => e.ImagePath)
                .IsUnicode(false);

            modelBuilder.Entity<DailyLoginHistory>()
                .Property(e => e.SessionID)
                .IsUnicode(false);

            modelBuilder.Entity<DailyLoginHistory>()
                .Property(e => e.IpAddress)
                .IsUnicode(false);

            modelBuilder.Entity<DailyLoginHistory>()
                .Property(e => e.BrowserName)
                .IsUnicode(false);

            modelBuilder.Entity<DailyLoginHistory>()
                .Property(e => e.ApkDeviceName)
                .IsUnicode(false);

            modelBuilder.Entity<DailyLoginHistory>()
                .Property(e => e.APKVersion)
                .IsUnicode(false);

            modelBuilder.Entity<DailyLoginHistory>()
                .Property(e => e.Lattitude)
                .IsUnicode(false);

            modelBuilder.Entity<DailyLoginHistory>()
                .Property(e => e.Longitude)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.FromEmail)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.ToName)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.ToEmail)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.CcEmail)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.BccEmail)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.Subject)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.Body)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.AttachmentFileName)
                .IsUnicode(false);

            modelBuilder.Entity<EmailService>()
                .Property(e => e.Remarks)
                .IsUnicode(false);

            modelBuilder.Entity<EmailTemplate>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<EmailTemplate>()
                .Property(e => e.Body)
                .IsUnicode(false);

            modelBuilder.Entity<EmailTemplate>()
                .Property(e => e.Subject)
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceItem>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceItem>()
                .Property(e => e.Cost)
                .HasPrecision(9, 2);

            modelBuilder.Entity<InvoiceItem>()
                .Property(e => e.Tax)
                .HasPrecision(9, 2);

            modelBuilder.Entity<InvoiceItem>()
                .Property(e => e.TypeText)
                .IsUnicode(false);

            modelBuilder.Entity<InvoiceItem>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<LoginAttemptHistory>()
                .Property(e => e.Lattitude)
                .IsUnicode(false);

            modelBuilder.Entity<LoginAttemptHistory>()
                .Property(e => e.Longitude)
                .IsUnicode(false);

            modelBuilder.Entity<LoginAttemptHistory>()
                .Property(e => e.IpAddress)
                .IsUnicode(false);

            modelBuilder.Entity<LoginAttemptHistory>()
                .Property(e => e.Browser)
                .IsUnicode(false);

            modelBuilder.Entity<ModuleMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<ModuleMaster>()
                .Property(e => e.Icon)
                .IsUnicode(false);

            modelBuilder.Entity<ModuleMaster>()
                .Property(e => e.ModuleDescription)
                .IsUnicode(false);

            modelBuilder.Entity<ModuleMaster>()
                .Property(e => e.PageURL)
                .IsUnicode(false);

            modelBuilder.Entity<ModuleMaster>()
                .HasMany(e => e.RoleModules)
                .WithRequired(e => e.ModuleMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<OTPMaster>()
                .Property(e => e.OTP)
                .IsUnicode(false);

            modelBuilder.Entity<OTPMaster>()
                .Property(e => e.GUID)
                .IsUnicode(false);

            modelBuilder.Entity<PackageMaster>()
                .Property(e => e.Cost)
                .HasPrecision(9, 2);

            modelBuilder.Entity<Permission>()
                .Property(e => e.PermissionValue)
                .IsUnicode(false);

            modelBuilder.Entity<RoleMaster>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<RoleMaster>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<RoleMaster>()
                .Property(e => e.RoleDescription)
                .IsUnicode(false);

            modelBuilder.Entity<RoleMaster>()
                .HasMany(e => e.RoleModules)
                .WithRequired(e => e.RoleMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<RoleMaster>()
                .HasMany(e => e.UserRoles)
                .WithRequired(e => e.RoleMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<RoleModule>()
                .HasMany(e => e.UserRoleModulePermissions)
                .WithOptional(e => e.RoleModule)
                .WillCascadeOnDelete();

            modelBuilder.Entity<StudentInvoice>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<StudentInvoice>()
                .Property(e => e.SubTotal)
                .HasPrecision(9, 2);

            modelBuilder.Entity<StudentInvoice>()
                .Property(e => e.Tax)
                .HasPrecision(9, 2);

            modelBuilder.Entity<StudentInvoice>()
                .Property(e => e.CopyEmail)
                .IsUnicode(false);

            modelBuilder.Entity<StudentInvoice>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<StudentInvoice>()
                .Property(e => e.Pin)
                .IsUnicode(false);

            modelBuilder.Entity<StudentInvoice>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<StudentInvoice>()
                .HasMany(e => e.InvoiceItems)
                .WithOptional(e => e.StudentInvoice)
                .HasForeignKey(e => e.InvoiceID);

            modelBuilder.Entity<StudentMaster>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<StudentMaster>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<StudentMaster>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<StudentMaster>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<StudentMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<StudentMaster>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<StudentMaster>()
                .Property(e => e.ImagePath)
                .IsUnicode(false);

            modelBuilder.Entity<SubCourse>()
                .Property(e => e.IndianAdmissionFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCourse>()
                .Property(e => e.ForeignAdmissionFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCourse>()
                .Property(e => e.IndianOtherFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SubCourse>()
                .Property(e => e.ForeignOtherFee)
                .HasPrecision(9, 2);

            modelBuilder.Entity<SystemSetting>()
                .Property(e => e.WeeklyOffDays)
                .IsUnicode(false);

            modelBuilder.Entity<TestMaster>()
                .Property(e => e.Cost)
                .HasPrecision(9, 2);

            modelBuilder.Entity<UserDevice>()
                .Property(e => e.IMEINumber)
                .IsUnicode(false);

            modelBuilder.Entity<UserDevice>()
                .Property(e => e.LoginName)
                .IsUnicode(false);

            modelBuilder.Entity<UserDevice>()
                .Property(e => e.SenderKey)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.LoginName)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.ImagePath)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.UserCode)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Mobile)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .Property(e => e.Pin)
                .IsUnicode(false);

            modelBuilder.Entity<UserMaster>()
                .HasMany(e => e.LoginAttemptHistories)
                .WithRequired(e => e.UserMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UserMaster>()
                .HasMany(e => e.StudentInvoices)
                .WithRequired(e => e.UserMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UserMaster>()
                .HasMany(e => e.UserServiceAccesses)
                .WithRequired(e => e.UserMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UserMaster>()
                .HasMany(e => e.UserSystemSettings)
                .WithRequired(e => e.UserMaster)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UserRoleModulePermission>()
                .Property(e => e.PermissionValue)
                .IsUnicode(false);

            modelBuilder.Entity<UserServiceAccess>()
                .Property(e => e.APIKey)
                .IsUnicode(false);

            modelBuilder.Entity<UserServiceAccess>()
                .Property(e => e.APIToken)
                .IsUnicode(false);

            modelBuilder.Entity<vwGetUserRoleModule>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<vwGetUserRoleModule>()
                .Property(e => e.Icon)
                .IsUnicode(false);

            modelBuilder.Entity<vwGetUserRoleModule>()
                .Property(e => e.PageURL)
                .IsUnicode(false);
        }
    }
}
