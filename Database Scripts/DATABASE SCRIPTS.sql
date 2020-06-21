USE [master]
GO
/****** Object:  Database [HealthIQ]    Script Date: 21-Jun-20 2:31:00 PM ******/
CREATE DATABASE [HealthIQ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HealthIQ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.NEERINSTANCE\MSSQL\DATA\HealthIQ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HealthIQ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.NEERINSTANCE\MSSQL\DATA\HealthIQ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HealthIQ] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HealthIQ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HealthIQ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HealthIQ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HealthIQ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HealthIQ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HealthIQ] SET ARITHABORT OFF 
GO
ALTER DATABASE [HealthIQ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HealthIQ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HealthIQ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HealthIQ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HealthIQ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HealthIQ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HealthIQ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HealthIQ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HealthIQ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HealthIQ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HealthIQ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HealthIQ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HealthIQ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HealthIQ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HealthIQ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HealthIQ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HealthIQ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HealthIQ] SET RECOVERY FULL 
GO
ALTER DATABASE [HealthIQ] SET  MULTI_USER 
GO
ALTER DATABASE [HealthIQ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HealthIQ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HealthIQ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HealthIQ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HealthIQ] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HealthIQ', N'ON'
GO
ALTER DATABASE [HealthIQ] SET QUERY_STORE = OFF
GO
USE [HealthIQ]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [HealthIQ]
GO
/****** Object:  UserDefinedFunction [dbo].[DecryptStr]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[DecryptStr](@EncyptedString VARCHAR(400))
Returns VARCHAR(200)
AS
BEGIN
/*Declare Initial Variable(s) and table(s)*/
DECLARE @DecyptedString VARCHAR(200)
DECLARE @EncDecTbl TABLE
(
   ID INT IDENTITY,
   CharacterValue VARCHAR(5),
   EncryptedValue VARCHAR(5)
)
IF(@EncyptedString IS NOT NULL AND @EncyptedString<>'')
BEGIN

   DECLARE @Counter INT
   DECLARE @Characterlength INT

   --:: Set length for character set as per dictionary
   SET @Characterlength=2 
   
   --:: reverse string
   SET @EncyptedString=REVERSE(@EncyptedString)
   SET @Counter=1

   --:: Insert set of characters list into table variable after spliting the string
   WHILE(@Counter<=LEN(@EncyptedString))
   BEGIN
      INSERT INTO @EncDecTbl (EncryptedValue) 
      VALUES (SUBSTRING(@EncyptedString,@Counter,@Characterlength))   
      SET @Counter=@Counter+@Characterlength   
   end

   --:: Update plain character with respect to encrypted set of characters in table variable
   UPDATE A 
     SET A.CharacterValue=B.CharacterValue
     FROM @EncDecTbl A
     Inner Join dbo.DictionaryEncryptDecrypt B with (nolock)
     ON A.EncryptedValue COLLATE Latin1_General_CS_AS =B.EncryptedValue COLLATE Latin1_General_CS_AS
    
    --:: Merge rows into a string
    SELECT @DecyptedString=
        (
         SELECT CharacterValue
          FROM @EncDecTbl
           FOR XML PATH(''),type
       )
       .value('.','VARCHAR(200)') 
END
  Return @DecyptedString
End
GO
/****** Object:  Table [dbo].[RoleModule]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleModule](
	[RoleModuleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[IsMandatory] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMaster](
	[ModuleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[ParentModuleID] [int] NULL,
	[ModuleCode] [int] NULL,
	[IsMobile] [bit] NOT NULL,
	[Sequence] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsSystemModule] [bit] NOT NULL,
	[Icon] [varchar](200) NULL,
	[IsStoreWise] [bit] NULL,
	[ModuleType] [int] NOT NULL,
	[ModuleDescription] [varchar](250) NOT NULL,
	[PageURL] [varchar](350) NOT NULL,
	[IsMandatory] [bit] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwGetUserRoleModule]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwGetUserRoleModule]
AS SELECT m.ModuleID, m.Name, m.ParentModuleID, er.UserID, Max(m.ModifiedDate) As MaxModifiedDate, m.IsMandatory, m.ModuleCode, m.Icon, m.IsStoreWise, m.Sequence, m.PageURL, m.ModuleType, m.IsMobile, rm.IsDeleted
FROM ModuleMaster m 
INNER JOIN RoleModule rm ON (m.ModuleID = rm.ModuleID)
INNER JOIN UserRoles (NOLOCK) er ON (er.RoleID = rm.RoleID)
GROUP BY m.ModuleID, m.Name, m.ParentModuleID, er.UserID, m.IsMandatory, m.ModuleCode, m.Icon, m.IsStoreWise, m.Sequence, m.PageURL, m.ModuleType, m.IsMobile, rm.IsDeleted
 

GO
/****** Object:  Table [dbo].[AddressMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressMaster](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [varchar](250) NULL,
	[Address2] [varchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [int] NOT NULL,
	[PinCode] [int] NOT NULL,
	[AddressType] [int] NULL,
	[AddressStatus] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserID] [int] NULL,
	[AddressOwnerType] [int] NULL,
	[AddressOwnerTypePKID] [int] NULL,
	[VenueID] [int] NULL,
	[Lattitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](45) NOT NULL,
	[LastName] [nvarchar](45) NOT NULL,
	[Age] [int] NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Sex] [int] NULL,
	[BookingDate] [datetime2](7) NULL,
	[CollectionType] [int] NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[Landmark] [nvarchar](250) NULL,
	[PinCode] [nvarchar](10) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[PackageID] [int] NULL,
	[TestID] [int] NULL,
	[CompanyID] [int] NOT NULL,
	[BookingTime] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommonSetup]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommonSetup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MainType] [nvarchar](50) NOT NULL,
	[SubType] [nvarchar](50) NULL,
	[DisplayText] [nvarchar](150) NULL,
	[DisplayValue] [int] NULL,
	[ParentID] [int] NULL,
	[isDeleted] [int] NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](145) NOT NULL,
	[LogoUrl] [nvarchar](1000) NULL,
	[SecondryEmail] [nvarchar](150) NOT NULL,
	[PrimaryEmail] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[BannerUrl] [nvarchar](1000) NULL,
	[About] [nvarchar](1000) NULL,
	[MapUrl] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUsEnquiry]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUsEnquiry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Message] [nvarchar](1000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorporateTieUpEnquiry]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorporateTieUpEnquiry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](45) NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Designation] [int] NULL,
	[Address] [nvarchar](500) NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCurriculum]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCurriculum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CourseMasterID] [int] NOT NULL,
	[SubCourcesID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEligibility]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEligibility](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Qualification] [nvarchar](500) NOT NULL,
	[MinAge] [int] NOT NULL,
	[MaxAge] [int] NOT NULL,
	[Duration] [int] NULL,
	[Certification] [nvarchar](500) NULL,
	[InternshipDuration] [int] NULL,
	[CourseMasterID] [int] NULL,
	[IsDeleted] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[About] [nvarchar](1500) NOT NULL,
	[IsDeleted] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Qualification] [nvarchar](500) NOT NULL,
	[MinAge] [int] NOT NULL,
	[MaxAge] [int] NOT NULL,
	[Duration] [int] NULL,
	[Certification] [nvarchar](500) NULL,
	[InternshipDuration] [int] NULL,
	[ImageUrl] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Email] [varchar](250) NULL,
	[isDeleted] [bit] NOT NULL,
	[Password] [varchar](30) NULL,
	[ImagePath] [varchar](1500) NULL,
	[AccountStatus] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyLoginHistory]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyLoginHistory](
	[DailyLoginID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CustomerID] [int] NULL,
	[SessionID] [varchar](200) NULL,
	[IpAddress] [varchar](50) NULL,
	[BrowserName] [varchar](30) NULL,
	[LoginType] [int] NULL,
	[LogOutTime] [datetime] NULL,
	[LoginTime] [datetime] NULL,
	[IsLogin] [bit] NOT NULL,
	[ApkDeviceName] [varchar](50) NULL,
	[APKVersion] [varchar](7) NULL,
	[Lattitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DailyLoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorAppointment]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorAppointment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](45) NOT NULL,
	[Age] [int] NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Sex] [int] NOT NULL,
	[BookingDate] [datetime2](7) NULL,
	[BookingTime] [nvarchar](50) NULL,
	[DoctorID] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[HospitalID] [int] NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[Experience] [int] NOT NULL,
	[Specialist] [nvarchar](250) NULL,
	[ImageUrl] [nvarchar](1000) NULL,
	[Hospital] [nvarchar](150) NULL,
	[Designation] [nvarchar](250) NULL,
	[Sequence] [int] NOT NULL,
	[About] [nvarchar](500) NULL,
	[LogoUrl] [nvarchar](1000) NULL,
	[IsDeleted] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[RegistrationNo] [nvarchar](45) NULL,
	[SpecialityID] [int] NOT NULL,
	[HospitalID] [int] NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorSpecialities]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorSpecialities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[SpecialityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailService]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailService](
	[EmailServiceID] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateID] [int] NOT NULL,
	[FromEmail] [varchar](150) NOT NULL,
	[ToName] [varchar](150) NOT NULL,
	[ToEmail] [varchar](250) NOT NULL,
	[CcEmail] [varchar](250) NULL,
	[BccEmail] [varchar](250) NULL,
	[Subject] [varchar](500) NOT NULL,
	[Body] [varchar](max) NOT NULL,
	[IsHtml] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[IsAttachment] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[AttachmentFileName] [varchar](50) NULL,
	[Remarks] [varchar](250) NULL,
	[TemplateCode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmailServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplate](
	[TemplateID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Body] [varchar](max) NULL,
	[Subject] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthServiceMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthServiceMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](1000) NULL,
	[PageUrl] [nvarchar](1000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[ServicesIncluded] [nvarchar](1000) NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](245) NOT NULL,
	[Type] [int] NOT NULL,
	[Address] [nvarchar](245) NULL,
	[City] [int] NOT NULL,
	[State] [int] NULL,
	[PinCode] [nvarchar](10) NULL,
	[IsDeleted] [int] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceItems]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Cost] [decimal](9, 2) NOT NULL,
	[Tax] [decimal](9, 2) NULL,
	[Type] [int] NULL,
	[TypeID] [int] NULL,
	[TypeText] [varchar](10) NULL,
	[Status] [int] NOT NULL,
	[InvoiceID] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Description] [varchar](250) NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobApplication]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobApplication](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[City] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[ResumeText] [nvarchar](max) NULL,
	[ResumePath] [nvarchar](1500) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginAttemptHistory]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginAttemptHistory](
	[LoginAttemptID] [bigint] IDENTITY(1,1) NOT NULL,
	[FailedAttempt] [int] NULL,
	[UserID] [int] NOT NULL,
	[LoginDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[Lattitude] [varchar](30) NULL,
	[Longitude] [varchar](30) NULL,
	[IpAddress] [varchar](30) NULL,
	[Browser] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginAttemptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineEnquiry]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineEnquiry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[TypeValue] [int] NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[AltPhone] [nvarchar](15) NULL,
	[Subject] [nvarchar](500) NULL,
	[Message] [nvarchar](1500) NULL,
	[Status] [int] NOT NULL,
	[Address] [nvarchar](250) NULL,
	[Place] [nvarchar](150) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](45) NULL,
	[Country] [int] NOT NULL,
	[CaptchaText] [nvarchar](10) NULL,
	[CaptchaVerified] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizeCampEnquiry]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizeCampEnquiry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](45) NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[ExpectedCount] [int] NOT NULL,
	[Address] [nvarchar](500) NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[Message] [nvarchar](1000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTPMaster](
	[OTPMasterID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OTP] [varchar](10) NOT NULL,
	[GUID] [varchar](150) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Attempts] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OTPMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageCategory]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[SubTitle] [nvarchar](500) NULL,
	[ImageUrl] [nvarchar](1005) NULL,
	[About] [nvarchar](1500) NULL,
	[IsDeleted] [int] NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[SubTitle] [nvarchar](500) NULL,
	[About] [nvarchar](1000) NULL,
	[Cost] [numeric](9, 2) NOT NULL,
	[Status] [int] NULL,
	[CatgID] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[ImageUrl] [nvarchar](1005) NULL,
	[CompanyID] [int] NOT NULL,
	[Sequence] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerEnquiry]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerEnquiry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](45) NOT NULL,
	[Mobile] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[Message] [nvarchar](1000) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionValue] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Type] [int] NULL,
	[Status] [int] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RoleDescription] [varchar](250) NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpecialityMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialityMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Speciality] [nvarchar](145) NOT NULL,
	[Title] [nvarchar](245) NULL,
	[IsDeleted] [int] NOT NULL,
	[ImageUrl] [nvarchar](1000) NOT NULL,
	[LogoUrl] [nvarchar](1000) NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentInvoice]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[SubTotal] [decimal](9, 2) NOT NULL,
	[Tax] [decimal](9, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[PaymentMode] [int] NOT NULL,
	[CopyEmail] [varchar](250) NULL,
	[Address] [varchar](500) NOT NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[Pin] [varchar](10) NULL,
	[Country] [int] NULL,
	[Mobile] [varchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Email] [varchar](250) NULL,
	[isDeleted] [bit] NOT NULL,
	[Password] [varchar](30) NULL,
	[ImagePath] [varchar](1500) NULL,
	[AccountStatus] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCourses]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCourses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Duration] [int] NOT NULL,
	[MinQualification] [nvarchar](250) NULL,
	[MinAge] [int] NOT NULL,
	[MaxAge] [int] NULL,
	[IndianAdmissionFee] [numeric](9, 2) NOT NULL,
	[ForeignAdmissionFee] [numeric](9, 2) NOT NULL,
	[IndianOtherFee] [numeric](9, 2) NULL,
	[ForeignOtherFee] [numeric](9, 2) NULL,
	[CourseMasterID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemSettings]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSettings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[LogoutTime] [int] NOT NULL,
	[LoginFailedAttempt] [int] NOT NULL,
	[MaxLeaveMarkDays] [int] NOT NULL,
	[WeeklyOffDays] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IdleSystemDay] [int] NOT NULL,
 CONSTRAINT [PK_SystemSettings] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Type] [int] NOT NULL,
	[PreTestInfo] [nvarchar](500) NULL,
	[ResultInHours] [int] NOT NULL,
	[Components] [nvarchar](150) NULL,
	[Cost] [numeric](9, 2) NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[PackageID] [int] NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDevices]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDevices](
	[UserDeviceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[IMEINumber] [varchar](50) NULL,
	[LoginName] [varchar](150) NULL,
	[SenderKey] [varchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserDevices] PRIMARY KEY CLUSTERED 
(
	[UserDeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[LoginName] [varchar](150) NULL,
	[Password] [varchar](30) NULL,
	[ImagePath] [varchar](1500) NULL,
	[UserCode] [varchar](20) NULL,
	[Email] [varchar](250) NULL,
	[AccountStatus] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[SeniorEmpID] [int] NULL,
	[IsEmployee] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[CompanyId] [int] NOT NULL,
	[IsCustomer] [bit] NOT NULL,
	[IsStudent] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserReports]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FilePath] [nvarchar](1000) NULL,
	[FileType] [int] NULL,
	[UploadedDate] [datetime2](7) NULL,
	[UploadedBy] [int] NOT NULL,
	[IsDeleted] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleModulePermission]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleModulePermission](
	[UserRolePermissionID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleModuleID] [int] NULL,
	[UserID] [int] NULL,
	[ModuleID] [int] NULL,
	[PermissionID] [int] NOT NULL,
	[PermissionValue] [varchar](150) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRolePermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserServiceAccess]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserServiceAccess](
	[ServiceAccessID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[APIKey] [varchar](50) NULL,
	[APIToken] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
 CONSTRAINT [PK_UserServiceAccess] PRIMARY KEY CLUSTERED 
(
	[ServiceAccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSystemSettings]    Script Date: 21-Jun-20 2:31:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSystemSettings](
	[UserSystemID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[IsAPKLoggingEnabled] [bit] NOT NULL,
	[IsCoverageException] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CoverageExceptionWindow] [date] NULL,
 CONSTRAINT [PK_UserSystemSettings] PRIMARY KEY CLUSTERED 
(
	[UserSystemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookingMaster] ON 

INSERT [dbo].[BookingMaster] ([ID], [FirstName], [LastName], [Age], [Mobile], [Email], [Sex], [BookingDate], [CollectionType], [Address], [City], [Landmark], [PinCode], [CreatedDate], [IsDeleted], [Status], [PackageID], [TestID], [CompanyID], [BookingTime]) VALUES (44, N'Neeraj', N'Ajjyu', 6, N'09599660409', N'neer.s@outlook.com', 2, CAST(N'2020-05-13T00:00:00.0000000' AS DateTime2), 1, N'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West', N'1', N'uigkjb jgkj', N'201301', CAST(N'2020-05-13T15:36:55.0000000' AS DateTime2), 0, 1, 1, NULL, 1, N'8')
INSERT [dbo].[BookingMaster] ([ID], [FirstName], [LastName], [Age], [Mobile], [Email], [Sex], [BookingDate], [CollectionType], [Address], [City], [Landmark], [PinCode], [CreatedDate], [IsDeleted], [Status], [PackageID], [TestID], [CompanyID], [BookingTime]) VALUES (45, N'Neeraj', N'Ajjyu', 3, N'08527818810', N'singh.neer@ymail.com', 0, CAST(N'2020-05-21T00:00:00.0000000' AS DateTime2), 1, N'K-93, 2nd Floor,', N'1', N'uigkjb jgkj', N'110059', CAST(N'2020-05-13T16:48:35.0000000' AS DateTime2), 0, 1, 2, NULL, 1, N'23')
INSERT [dbo].[BookingMaster] ([ID], [FirstName], [LastName], [Age], [Mobile], [Email], [Sex], [BookingDate], [CollectionType], [Address], [City], [Landmark], [PinCode], [CreatedDate], [IsDeleted], [Status], [PackageID], [TestID], [CompanyID], [BookingTime]) VALUES (46, N'Neeraj', N'Singh', 122, N'08527818810', N'singh.neer@ymail.com', 1, CAST(N'2020-05-15T00:00:00.0000000' AS DateTime2), 1, N'K-93, 2nd Floor,', N'1', N'uigkjb jgkj', N'110059', CAST(N'2020-05-13T18:33:21.0000000' AS DateTime2), 0, 1, 2, NULL, 1, N'12:12')
SET IDENTITY_INSERT [dbo].[BookingMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CommonSetup] ON 

INSERT [dbo].[CommonSetup] ([ID], [MainType], [SubType], [DisplayText], [DisplayValue], [ParentID], [isDeleted], [CompanyID]) VALUES (1, N'User', N'Type', N'Customer', 1, NULL, 0, 2)
INSERT [dbo].[CommonSetup] ([ID], [MainType], [SubType], [DisplayText], [DisplayValue], [ParentID], [isDeleted], [CompanyID]) VALUES (2, N'User', N'Type', N'Employee', 2, NULL, 0, 2)
INSERT [dbo].[CommonSetup] ([ID], [MainType], [SubType], [DisplayText], [DisplayValue], [ParentID], [isDeleted], [CompanyID]) VALUES (3, N'User', N'Type', N'Student', 3, NULL, 0, 2)
SET IDENTITY_INSERT [dbo].[CommonSetup] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseCurriculum] ON 

INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (1, N'Introduction to patient care, lab technology & equipment.', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (2, N'Role of Medical Lab Technician', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (3, N'Basic pathology & diagnostic techniques', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (4, N'Introduction to patient care, physiotherapy', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (5, N'Role of Physiotherapist', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (6, N'Basic anatomy & physiology', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (7, N'Understanding body mechanics', 4, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (8, N'Introduction to nutrition', 5, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (9, N'Basic & clinical biochemistry', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (10, N'Basic & systemic medical microbiology', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (11, N'Basic hematology, immunology, parasitology, histology, &', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (12, N'Blood banking, phlebotomy and handling special samples', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (13, N'Fine needle aspiration technique', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (14, N'Storage & transportation of samples', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (15, N'Lab information management system', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (16, N'Biomedical waste management', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (17, N'Infection control', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (18, N'Maintenance & cleaning of lab equipment', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (19, N'Personnel Hygiene and Safety & First Aid', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (20, N'Patient''s Rights & Responsibilities', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (21, N'Professional Behavior in Healthcare Setting', 1, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (22, N'Human Anatomy', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (23, N'Human Physiology', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (24, N'Pathology', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (25, N'Pharmacology', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (26, N'Psychology', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (27, N'Medical and Surgical Conditions', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (28, N'Biomechanics', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (29, N'Kineseology', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (30, N'Disability prevention', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (31, N'Rehabilitation', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (32, N'Personnel Hygiene and Safety & First Aid', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (33, N'Patient''s Rights & Responsibilities', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (34, N'Professional Behaviour in Healthcare Setting', 2, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (35, N'General health & hygiene', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (36, N'Understanding hospitals & the healthcare system', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (37, N'Special skin care for radiotherapy, pressure sores', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (38, N'Caring for the visually impaired', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (39, N'Role of a patient care assistant', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (40, N'Daily care for a patient', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (41, N'Administering drugs as per prescriptions', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (42, N'Basic nursing skills', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (43, N'Disposal of medical waste', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (44, N'Understanding body mechanics', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (45, N'Patient handling, lifting, and moving patients', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (46, N'Fall prevention care and restraints', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (47, N'Emergency first aid and CPR', 3, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (48, N'Macronutrients', 5, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (49, N'Micronutrients', 5, NULL)
INSERT [dbo].[CourseCurriculum] ([ID], [Name], [CourseMasterID], [SubCourcesID]) VALUES (50, N'Nutritional Assessment', 5, NULL)
SET IDENTITY_INSERT [dbo].[CourseCurriculum] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseMaster] ON 

INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (1, N'Medical Lab Technician', N'Medical Lab Technicians are important members of any clinical laboratory team. Medical Lab Technicians analyze fluid, tissues and blood samples to perform a variety of diagnoses. Additionally, students from this course are trained to clean and maintain lab equipment, manage biomedical waste and adhere to quality control standards as per the NABL regulations. They generally work under the supervision of a pathologist.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable', 17, 99, 2, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', 6, N'assets/images/academy/courses/1.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (2, N'Physiotherapy', N'Physiotherapists are trained professionals working in health care. They are trained to restore mobility, alleviate pain and suffering and work to prevent permanent disability in patients. The job of a physical therapist is preventive, restorative and rehabilitative.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable.', 17, 99, 2, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, N'assets/images/academy/courses/2.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (3, N'General Duty Assistant (Nursing)', N'This course trains students to work as nursing aides in hospitals and home care scenarios and they can also provide basic nursing care. They are taught to support nurses and also directly handle ill patients who are unable to look after themselves in both hospital and home care settings.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable.', 17, 30, 2, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', 6, N'assets/images/academy/courses/3.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (4, N'E.C.G. Technician', N'This course trains students in Emergency situation to detect whether the illness is due to Cardiac problem or else, Use of E.C.G. Machine of different makes & Models- Manual, Semi-Auto & Fully Auto, To carry out E.C.G. on pacemaker patient, Determination of heart beats, Axis, Cardiac Arrhythmias, Ventricular status, Interpretation of normal and abnormal E.C.G, Indication of E.C.G. recording, Requirement of Halter Study & Doppler study, TMT etc.', 0, 2, N'10th / Matric / Madhyamik passed', 18, 99, 1, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, N'assets/images/academy/courses/4.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (5, N'Diet & Nutrition', N'The focus of the programme is to enable you to make the best possible choice for meeting the nutritional needs of your family. The student will learn various concepts in nutrition, the role of nutrients such as carbohydrates, lipids, proteins, vitamins, and minerals, including their sources, requirements, functions, and roles in health. It also includes guidelines for nutrition, dietary reference intakes, dietary guidelines for Indians, and basics of nutritional assessment methods.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable.', 18, 99, 1, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, N'assets/images/academy/courses/5.jpg')
SET IDENTITY_INSERT [dbo].[CourseMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorMaster] ON 

INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (1, N'Trinath', N'Sarkar', CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 10, N'Cardiology', N'../../assets/img/Doctors images/Dr.Trinath Sarkar.jpg', N'Calcutta Medical College Paramount Nursing Home', N'M.B.B.S. (Cal), M.D. (Cal), CCEBDM (IDF) ', 999, N'Member: - European Society of Cardiology', N'lnr-heart-pulse', 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), CAST(N'2019-08-03T01:40:14.0000000' AS DateTime2), N'9051672875', N'trinath_sarkar2004@yahoo.co.in', NULL, 4, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (2, N'Jayanta', N'Raja', NULL, 0, N'Cardiology', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', N' BM Birla Heart Research Centre Hindustan Health Point', N'M.B.B.S, D.CARD (CAL), DC.CM.A.F.I.C.A (USA)', 999, N'', N'lnr-Users', 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, N'033-2475 5390', N' drjrajani@yahoo.co.in', NULL, 4, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (3, N'Amit', N'Gupta', NULL, 0, N'Diabetese and Endocrinology', N'../../assets/img/Doctors images/Dr.Amit.jpg', N'Fellow Observer Critical Care & Chest Medicine(Johns Hopkins Hospital(USA)', N' M.D.,MRCP, FCGP, DFM(UK)  Dip. Diabetology (Chennai)', 999, N'', N'lnr-rocket', 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, N'9830075316', N'', NULL, 8, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (4, N'Poulomi', N'Saha', NULL, 0, N'ENT Specialist', N'../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg', N'Faculty of WBMES', N'MBBS, MS', 4, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'8727072555', N'drpoulomisaha@gmail.com', NULL, 7, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (5, N'Ranajit', N'Bari', NULL, 0, N'Diabetes & Endocrinology Consultant', N'../../assets/img/Doctors images/DR.Ranajit Bari.jpg', N'Asst. Prof. R.G.Kar Medical College & Hospital', N'MBBS,MD,DM', 2, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9433360027', N'dr.ranajit@gmail.com', NULL, 8, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (6, N'Md Rahiul', N'Islam', NULL, 0, N'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist', N'../../assets/img/Doctors images/Dr.R Islam.jpg', N'                                                                                                  Chittaranjan Seva Sadan          ', N'MBBS,MD(CAL)', 1, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'7003258132', N'rahcnmc@gmail.com', NULL, 9, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (7, N'Tapas', N'Das', NULL, 0, N'Consultant Physiotherapist', N'../../assets/img/Doctors images/Dr.Tapas Das.jpg', N'Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)', N'Phd,M.Sc, Sports and Allied Science,', 6, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9831020106', N'tapasdas76@yahoo.co.in', NULL, 12, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (8, N'Soumyendra Nath', N'Mitra', NULL, 0, N'General Physician', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', N'Ex-Resident Surgeon Marwari Relief Society Hospital,Kolkata	                                Medical Superitendent Apollo Nursing Home,Kolkata', N'Bsc.(Hons.),M.B.B.S', 999, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9830243153', NULL, NULL, 1, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (9, N'Nilima', N'Tudu', NULL, 0, N'Gynaecologist', N'../../assets/img/Doctors images/Dr.Nilima Tudu.jpg', N'                                                                                                                 Belle Vue Clinic        ', N'MBBS(Cal), Dgo(Cal)', 999, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9883118528', N'nilima.tudu14@gmail.com', NULL, 11, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (10, N'Paushali', N'Sanyal', NULL, 0, N'Consultant Gynaecologist & Obstetrician', N'../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg', N' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ', N'MBBS,MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG(London), FMAS', 5, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9830279680', N'poushali.sanyal@yahoo.co.in', NULL, 11, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (12, N'Sajeev', N'Shekhar', NULL, 0, N'Consultant Orthopaedic Surgeon', N'../../assets/img/Doctors images/Sajeeve.jpg', N'IPGMER & SSKM Hospital', N'MBBS,MS', 3, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'8197420121', N'sajshekh@hotmail.com', NULL, 10, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (13, N'Robin', N'Kumar', NULL, 0, N'Consultant Chest Physician', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', N'MBBS,MRCHCH(I)', N'MBBS,MRCHCH(I)', 999, NULL, NULL, 0, CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (14, N'Pallabi', N'Chatterjee', NULL, 0, N'Nutrition Dietitian', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', NULL, N'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),', 999, NULL, NULL, 0, CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 13, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (15, N'OPD', N'', NULL, 0, N'OPD', NULL, N'OPD', NULL, 999, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (16, N'Sabyasachi', N'Sarkar', NULL, 0, N'Consultant Gynaecologist & Obstetrician', N'../../assets/img/Doctors images/Dr.R Islam.jpg', N'                                                                                                  Chittaranjan Seva Sadan          ', N'MBBS,MS(G &O)', 6, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'7003258132', N'rahcnmc@gmail.com', NULL, 9, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (17, N'Suvendu', N'Maji', NULL, 0, N'General Surgery & Oncology Consultant', N'../../assets/img/Doctors images/DR.Ranajit Bari.jpg', N'Asst. Prof. R.G.Kar Medical College & Hospital', N'MBBS,MS(GEN SURG),DNB(Onco)', 2, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9433360027', N'dr.ranajit@gmail.com', NULL, 8, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (18, N'Poulomi', N'Saha', NULL, 0, N'ENT Specialist', N'../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg', N'Faculty of WBMES', N'MBBS, MS', 4, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'8727072555', N'drpoulomisaha@gmail.com', NULL, 7, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (19, N'Ranajit ', N'Bari', NULL, 0, N'Diabetes & Endocrinology Consultant', N'../../assets/img/Doctors images/DR.Ranajit Bari.jpg', N'Asst. Prof. R.G.Kar Medical College & Hospital', N'MBBS,MD,DM', 2, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9433360027', N'dr.ranajit@gmail.com', NULL, 8, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (20, N'Md Rahiul ', N'Islam', NULL, 0, N'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist', N'../../assets/img/Doctors images/Dr.R Islam.jpg', N'                                                                                                  Chittaranjan Seva Sadan          ', N'MBBS,MD(CAL)', 1, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'7003258132', N'rahcnmc@gmail.com', NULL, 9, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (21, N'Tapas ', N'Das', NULL, 0, N'Consultant Physiotherapist', N'../../assets/img/Doctors images/Dr.Tapas Das.jpg', N'Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)', N'Phd, M.Sc, Sports and Allied Science,', 6, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9831020106', N'tapasdas76@yahoo.co.in', NULL, 12, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (22, N'Paushali ', N'Sanyal', NULL, 0, N'Consultant Gynaecologist & Obstetrician', N'../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg', N' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ', N'MBBS, MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG (London),  FMAS', 5, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9830279680', N'poushali.sanyal@yahoo.co.in', NULL, 11, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (23, N'Pallabi', N'Chatterjee', NULL, 0, N'Nutrition Dietitian', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', NULL, N'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),', 999, NULL, NULL, 1, CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 13, NULL, 1)
SET IDENTITY_INSERT [dbo].[DoctorMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorSpecialities] ON 

INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (1, 1, 1)
INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (2, 1, 4)
INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (3, 2, 1)
INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (4, 2, 4)
INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (5, 3, 6)
INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (6, 4, 7)
INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (7, 5, 8)
INSERT [dbo].[DoctorSpecialities] ([ID], [DoctorID], [SpecialityID]) VALUES (8, 6, 9)
SET IDENTITY_INSERT [dbo].[DoctorSpecialities] OFF
GO
SET IDENTITY_INSERT [dbo].[HealthServiceMaster] ON 

INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (1, N'Pathology', N'Health IQ basically aims at improving lifeâ€™s of others. In terms of pathology, it is a medical specialty that determines the cause and nature of diseases by examining and testing body tissues (from biopsies and pap smears, for example) and bodily fluids (from samples including blood and urine). The results from these pathology tests help Doctors diagnose and treat patients correctly. Basically, an integral part of clinical diagnosis', N'../../assets/img/services images/pathology .jpg', N'page3 url (if any)', CAST(N'2016-03-22T09:27:52.0000000' AS DateTime2), CAST(N'2019-08-03T12:17:18.0000000' AS DateTime2), 0, 0, N'Biochemistry,Clinical Pathology,Cytopathology,Haematology, Immunology, Molecular Biology, Molecular Genetics, Serology', 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (2, N'Cardiology', N'Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart. It deals with the diagnosis and treatment of such conditions as congenital heart defects, coronary artery disease, electrophysiology, heart failure and heart disease. Subspecialties of the cardiology field include cardiac electrophysiology, echocardiography, interventional cardiology and nuclear cardiology', N'../../assets/img/services images/cardiology.jpg', N'page3 url (if any)', CAST(N'2019-07-29T09:27:52.0000000' AS DateTime2), CAST(N'2019-08-03T12:16:24.0000000' AS DateTime2), 0, 0, N'ECG, Holter monitoring, BP monitoring', 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (3, N'Spirometry', N'Spirometry (spy-ROM-uh-tree) is a common office test used to assess how well your lungs work by measuring how much air you inhale, how much you exhale and how quickly you exhale.Spirometry is used to diagnose asthma, chronic obstructive pulmonary disease (COPD) and other conditions that affect breathing. Spirometry may also be used periodically to monitor your lung condition and check whether a treatment for a chronic lung condition is helping you breathe better.', N'../../assets/img/services images/spirometry.jpg', N'page3 url (if any)', CAST(N'2019-07-29T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (4, N'Neurology', N'Neurology is a branch of medicine dealing with disorders of the nervous system. Neurology deals with the diagnosis and treatment of all categories of conditions and disease involving the central and peripheral nervous systems, including their coverings, blood vessels, and all effector tissue, such as muscle.', N'../../assets/img/services images/Neurology.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'NCV Study,  EMG Study , EEG ,BLINK REFLEX    ,VEP Study ,BAER Study  ,SSEP Study  ', 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (5, N'Gynae Care', N'Gynaecare clinic offers a comprehensive range of treatments with complete scientific solutions for infertility and sexual disfunctions. Our dedicated team of doctors personally interact with the patients , answer their queries and decide on the treatment accordingly. We offer the best services in fertility and reproductive medicine. Some of the services offered at our clinic are:', N'../../assets/img/services images/gynae-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'Pre & post-natal check up,Laproscopic surgeries, Hysterectomy,Measures for Family Planning, Abnormal bleeding problems, Treatment for Hormonal Imbalance, Blood Tests, IVF or In Vitro Fertilization, Infertility work up, IUI or Intrauterine Insemination,
 Safe medical termination of pregnancy (abortion).
', 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (6, N'Child Care Clinic', N'Childcare clinic offers a comprehensive range of treatments with complete solutions for Child. Our experienced team of Paediatricians caters to the Medical Needs of Newborns, Toddlers, Teenagers and Adolescents., answer their queries and decide on the treatment accordingly. We offer the best services in Paedtrics. Some of the services offered at our clinic are', N'../../assets/img/services images/child-care-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'Neonatology
,Paedtric Intensivist', 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (7, N'Diabetes Care Clinic', N'Diabetes is a hassle-some disease. At Health IQ, we take the stress out of diabetes. We provide everything a diabetic might need, under one roof. Right from diagnosis to speaking to a dietician, educator, diabetologist. As a patient, you donâ€™t have to keep going from pillar to post. We help patients manage Type 1, 2, gestational or prediabetes. Our evaluations, physical exams and treatments are geared to detect and prevent complications brought on by the disease. Our medical team can help you create routines for nutrition and exercise to prevent diabetes if you are prediabetes. For some type 2 patients, we may be able to control diabetes without medication through weight loss, diet and exercise. Our goal is to provide the best possible solution for your particular diagnosis. There are many ways to treat diabetes. Our doctors gives you options and works with you to design a plan that fits your lifestyle so you can successfully live with diabetes. Along with diet, exercise, oral medications, insulin and non-insulin injections, we also have expertise in insulin pump and continuous glucose monitoring.', N'../../assets/img/services images/diabetes-.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (8, N'Endrocrinology', N'The department of endocrinology at  Health IQ offers the best treatment modalities available for endocrine disorders to provide accurate and comprehensive care for its patients suffering from various endocrine diseases.
', N'../../assets/img/services images/endrocrinology.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (9, N'Ortho Clinic', N'The department of orthopaedic at Health IQ offers the best treatment modalities available for ortho ailments to provide accurate and comprehensive care for its patients suffering from various ortho problems. In addition, efficient occupational therapists, physiotherapists and pain management experts work towards the quick rehabilitation of the patient leading to a better quality of life', N'../../assets/img/services images/ortho-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (10, N'Physiotherapy', N'Physiotherapy is a health science that aims in rehabilitation and enhance individuals with movement chaos by utilizing evidence-based, natural process like motivation, exercise, education, advocacy and adapted tools. Physiotherapists study subjects like neuroscience,physiology and anatomy for developing attitudes and skills that are very much required for health prevention, education, rehabilitation and treatment of the patients with disabilities and physical ailments.It is sad to say that there are still many educated people in India who think that physiotherapy is only related to a few exercises. Physiotherapy is a science in itself. One might be suffering from cardiopulmonary ,orthopaedic, paediatric, neurology, sports injury, congenital abnormality, to name a few, where physical management becomes as a essential part of the rehabilitation process and some times is the only process. 
<br> <br><p><strong> Why physiotherapy at Health IQ? </strong> <br> At Health IQ our clinic run by experienced team of doctors and paramedics.  We have all type modern Electrotherapy equipments,exercise Theraphy,Manual Theraphy,here patient can get Acupuncture Treatment facility also apart with these. We basically try to alleviate the pain through various modern techniques or tools that can be used by the experience team of doctors and paramedics.</p>', N'../../assets/img/services images/physiotherapy.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (11, N'Pain Clinic', N'We provide pain management services for diagnosis and treatment for painful conditions.We treat back pain, knee pain, headache, neck pain and cancer pain etc.... due to slipped disc, migraine, Cluster Headacheï»¿, trigeminal neuralgia, arthritis, spondylitis, cancer etc. We use most advanced interventional pain management methods...like radio-frequency ablation, spinal cord stimulation, Percutaneous Discectomy, vertebroplasty, Epidural steroid injections, Epiduroscopy, Ozone Necleolysis, Platelet Rich Plasma (PRP)ï»¿ Therapy etc.', N'../../assets/img/services images/pain-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'IFT,Laser Therapy,Tens,Acupuncture/Dry Needling,Electro acupuncture,Ultrasonic therapy,Diapulse /SWD,Electro stimulators,Neuromuscular stimulations,Electronic tractions,Manual Therapy/Manupulataion,Taping Techniques
 "', 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (12, N'Sports Medicine', N'Sports Medicine is an integral part of modern medicine. Sports Medicine practitioners deal with human fitness and conditioning related to performance, different types of injuries including sports injuries, rehabilitation, pain and weaknesses arising out of different kinds of injuries and diseases The GOAL of Sports Medicine is to prevent injuries, to improve bodily functions and movements and to treat pain in the shortest possible time and with minimum use of medicines. Sports Medicine Therapy requires specific infrastructure including modern Physiotherapy and modern gadgets and also a team of qualified and dedicated experts from different branches of sports sciences. ', N'../../assets/img/services images/Sports-Medicine.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (13, N'Nutrition / Dietician', N'Dietetics is about healthy eating practices which act as a preventive and curative means and pave the foundation for a healthier life. At  Health IQ, we regularly counsel our patients about a nutritious, balanced diet that consists of carbohydrates, fats, proteins, minerals, vitamins and electrolytes for their general well-being. Good nutrition is essential for normal organ development and function, normal reproduction, growth and maintenance of muscles and tissue, optimum activity and working efficiency, building resistance to infection and in repairing body damage or injury. The Nutrition and Dietetics team at Health IQ aims to improve the clinical, biochemical, cellular and psychological status of individuals experiencing complications or side effects of various treatments by providing adequate nutrition and related information.', N'../../assets/img/services images/nutrition-dietician.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (14, N'Pathology', N'Leela Healthcare basically aims at improving lifeâ€™s of others. In terms of pathology, it is a medical specialty that determines the cause and nature of diseases by examining and testing body tissues (from biopsies and pap smears, for example) and bodily fluids (from samples including blood and urine). The results from these pathology tests help Doctors diagnose and treat patients correctly. Basically, an integral part of clinical diagnosis', N'../../assets/img/services images/pathology .jpg', N'page3 url (if any)', CAST(N'2016-03-22T09:27:52.0000000' AS DateTime2), CAST(N'2019-08-03T12:17:18.0000000' AS DateTime2), 0, 0, N'Biochemistry,Clinical Pathology,Cytopathology,Haematology, Immunology, Molecular Biology, Molecular Genetics, Serology', 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (15, N'Cardiology', N'Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart. It deals with the diagnosis and treatment of such conditions as congenital heart defects, coronary artery disease, electrophysiology, heart failure and heart disease. Subspecialties of the cardiology field include cardiac electrophysiology, echocardiography, interventional cardiology and nuclear cardiology', N'../../assets/img/services images/cardiology.jpg', N'page3 url (if any)', CAST(N'2019-07-29T09:27:52.0000000' AS DateTime2), CAST(N'2019-08-03T12:16:24.0000000' AS DateTime2), 0, 0, N'ECG, Holter monitoring, BP monitoring', 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (16, N'Spirometry', N'Spirometry (spy-ROM-uh-tree) is a common office test used to assess how well your lungs work by measuring how much air you inhale, how much you exhale and how quickly you exhale.Spirometry is used to diagnose asthma, chronic obstructive pulmonary disease (COPD) and other conditions that affect breathing. Spirometry may also be used periodically to monitor your lung condition and check whether a treatment for a chronic lung condition is helping you breathe better.', N'../../assets/img/services images/spirometry.jpg', N'page3 url (if any)', CAST(N'2019-07-29T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (17, N'Neurology', N'Neurology is a branch of medicine dealing with disorders of the nervous system. Neurology deals with the diagnosis and treatment of all categories of conditions and disease involving the central and peripheral nervous systems, including their coverings, blood vessels, and all effector tissue, such as muscle.', N'../../assets/img/services images/Neurology.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'NCV Study,  EMG Study , EEG ,BLINK REFLEX    ,VEP Study ,BAER Study  ,SSEP Study  ', 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (18, N'Gynae Care', N'Gynaecare clinic offers a comprehensive range of treatments with complete scientific solutions for infertility and sexual disfunctions. Our dedicated team of doctors personally interact with the patients , answer their queries and decide on the treatment accordingly. We offer the best services in fertility and reproductive medicine. Some of the services offered at our clinic are:', N'../../assets/img/services images/gynae-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'Pre & post-natal check up,Laproscopic surgeries, Hysterectomy,Measures for Family Planning, Abnormal bleeding problems, Treatment for Hormonal Imbalance, Blood Tests, IVF or In Vitro Fertilization, Infertility work up, IUI or Intrauterine Insemination,
 Safe medical termination of pregnancy (abortion).
', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (19, N'Child Care Clinic', N'Childcare clinic offers a comprehensive range of treatments with complete solutions for Child. Our experienced team of Paediatricians caters to the Medical Needs of Newborns, Toddlers, Teenagers and Adolescents., answer their queries and decide on the treatment accordingly. We offer the best services in Paedtrics. Some of the services offered at our clinic are', N'../../assets/img/services images/child-care-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'Neonatology
,Paedtric Intensivist', 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (20, N'Diabetes Care Clinic', N'Diabetes is a hassle-some disease. At Leela Healthcare, we take the stress out of diabetes. We provide everything a diabetic might need, under one roof. Right from diagnosis to speaking to a dietician, educator, diabetologist. As a patient, you donâ€™t have to keep going from pillar to post. We help patients manage Type 1, 2, gestational or prediabetes. Our evaluations, physical exams and treatments are geared to detect and prevent complications brought on by the disease. Our medical team can help you create routines for nutrition and exercise to prevent diabetes if you are prediabetes. For some type 2 patients, we may be able to control diabetes without medication through weight loss, diet and exercise. Our goal is to provide the best possible solution for your particular diagnosis. There are many ways to treat diabetes. Our doctors gives you options and works with you to design a plan that fits your lifestyle so you can successfully live with diabetes. Along with diet, exercise, oral medications, insulin and non-insulin injections, we also have expertise in insulin pump and continuous glucose monitoring.', N'../../assets/img/services images/diabetes-.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (21, N'Endrocrinology', N'The department of endocrinology at  Leela Healthcare offers the best treatment modalities available for endocrine disorders to provide accurate and comprehensive care for its patients suffering from various endocrine diseases.
', N'../../assets/img/services images/endrocrinology.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (22, N'Ortho Clinic', N'The department of orthopaedic at Leela Healthcare offers the best treatment modalities available for ortho ailments to provide accurate and comprehensive care for its patients suffering from various ortho problems. In addition, efficient occupational therapists, physiotherapists and pain management experts work towards the quick rehabilitation of the patient leading to a better quality of life', N'../../assets/img/services images/ortho-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (23, N'Physiotherapy', N'Physiotherapy is a health science that aims in rehabilitation and enhance individuals with movement chaos by utilizing evidence-based, natural process like motivation, exercise, education, advocacy and adapted tools. Physiotherapists study subjects like neuroscience,physiology and anatomy for developing attitudes and skills that are very much required for health prevention, education, rehabilitation and treatment of the patients with disabilities and physical ailments.It is sad to say that there are still many educated people in India who think that physiotherapy is only related to a few exercises. Physiotherapy is a science in itself. One might be suffering from cardiopulmonary ,orthopaedic, paediatric, neurology, sports injury, congenital abnormality, to name a few, where physical management becomes as a essential part of the rehabilitation process and some times is the only process. Why physiotherapy at Leela HealthCare? At Leela HealthCare our clinic run by experienced team of doctors and paramedics.  We have all type modern Electrotherapy equipments,exercise Theraphy,Manual Theraphy,here patient can get Acupuncture Treatment facility also apart with these. We basically try to alleviate the pain through various modern techniques or tools that can be used by the experience team of doctors and paramedics.
 "', N'../../assets/img/services images/physiotherapy.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (24, N'Pain Clinic', N'We provide pain management services for diagnosis and treatment for painful conditions.We treat back pain, knee pain, headache, neck pain and cancer pain etc.... due to slipped disc, migraine, Cluster Headacheï»¿, trigeminal neuralgia, arthritis, spondylitis, cancer etc. We use most advanced interventional pain management methods...like radio-frequency ablation, spinal cord stimulation, Percutaneous Discectomy, vertebroplasty, Epidural steroid injections, Epiduroscopy, Ozone Necleolysis, Platelet Rich Plasma (PRP)ï»¿ Therapy etc.', N'../../assets/img/services images/pain-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'IFT,Laser Therapy,Tens,Acupuncture/Dry Needling,Electro acupuncture,Ultrasonic therapy,Diapulse /SWD,Electro stimulators,Neuromuscular stimulations,Electronic tractions,Manual Therapy/Manupulataion,Taping Techniques
 "', 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (25, N'Sports Medicine', N'Sports Medicine is an integral part of modern medicine. Sports Medicine practitioners deal with human fitness and conditioning related to performance, different types of injuries including sports injuries, rehabilitation, pain and weaknesses arising out of different kinds of injuries and diseases The GOAL of Sports Medicine is to prevent injuries, to improve bodily functions and movements and to treat pain in the shortest possible time and with minimum use of medicines. Sports Medicine Therapy requires specific infrastructure including modern Physiotherapy and modern gadgets and also a team of qualified and dedicated experts from different branches of sports sciences. ', N'../../assets/img/services images/Sports-Medicine.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 1)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID]) VALUES (26, N'Nutrition / Dietician', N'Dietetics is about healthy eating practices which act as a preventive and curative means and pave the foundation for a healthier life. At  Leela Healthcare, we regularly counsel our patients about a nutritious, balanced diet that consists of carbohydrates, fats, proteins, minerals, vitamins and electrolytes for their general well-being. Good nutrition is essential for normal organ development and function, normal reproduction, growth and maintenance of muscles and tissue, optimum activity and working efficiency, building resistance to infection and in repairing body damage or injury. The Nutrition and Dietetics team at Leela HealthCare aims to improve the clinical, biochemical, cellular and psychological status of individuals experiencing complications or side effects of various treatments by providing adequate nutrition and related information.', N'../../assets/img/services images/nutrition-dietician.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[HealthServiceMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[JobApplication] ON 

INSERT [dbo].[JobApplication] ([ID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [ZipCode], [ResumeText], [ResumePath], [CreatedDate], [CompanyID]) VALUES (16, N'Neeraj', N'Singh', N'neer.s@outlook.com', N'9599660409', NULL, N'Noida', NULL, NULL, N'C:\PROJECTS\IQHealth\IqHealth\IqHealth.WebApi\Content\Resumes\9599660409_neer.s@outlook.com.pdf', CAST(N'2020-04-22T00:13:32.0000000' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[JobApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[ModuleMaster] ON 

INSERT [dbo].[ModuleMaster] ([ModuleID], [Name], [ParentModuleID], [ModuleCode], [IsMobile], [Sequence], [Status], [IsSystemModule], [Icon], [IsStoreWise], [ModuleType], [ModuleDescription], [PageURL], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (1, N'Admin', NULL, 100, 1, 1, 1, 0, NULL, 0, 1, N'Admin Module', N'Admin/Index', 0, 0, 1, NULL, CAST(N'2017-10-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ModuleMaster] ([ModuleID], [Name], [ParentModuleID], [ModuleCode], [IsMobile], [Sequence], [Status], [IsSystemModule], [Icon], [IsStoreWise], [ModuleType], [ModuleDescription], [PageURL], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (2, N'Customer', NULL, 102, 1, 1, 1, 0, NULL, 0, 3, N'Customer Module Dashboard', N'Home/Index', 0, 0, 1, NULL, CAST(N'2017-10-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ModuleMaster] ([ModuleID], [Name], [ParentModuleID], [ModuleCode], [IsMobile], [Sequence], [Status], [IsSystemModule], [Icon], [IsStoreWise], [ModuleType], [ModuleDescription], [PageURL], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (3, N'Student', NULL, 103, 1, 2, 1, 0, NULL, 0, 3, N'Wedding', N'Home/Wedding', 0, 0, 1, NULL, CAST(N'2017-01-02T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ModuleMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[OnlineEnquiry] ON 

INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (42, 2, 1, N'Akash', N'akash.shil15@nshm.edu.in', N'7908181407', NULL, N'Enquiry For Courses.', N'I ', 0, N'', N'', N'', N'', 1, N'', 0, 2, CAST(N'2020-03-31T07:29:49.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (43, 2, 1, N'Akash', N'akashshil123@gmail.com', N'8083336401', NULL, N'Enquiry For Courses.', N'dmlt', 0, N'', N'k', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-05T06:51:59.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (54, 2, 3, N'Akash', N'akashshil.15@nshm.edu.in', N'7908181407', NULL, N'Enquiry For Courses.', N'sbahgsh', 0, N'', N'kOlatata', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-08T08:22:44.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (55, 2, 8, N'Biplab Roy', N'Biplab.arambagh@gmail.com', N'9609651043', NULL, N'Enquiry For Courses.', N'Course details', 0, N'', N'Kolkata', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-09T05:39:03.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (56, 2, 1, N'Imtiaz Ahmed ', N'Imtiazcool93@gmail.com', N'8585045459', NULL, N'Enquiry For Courses.', N'I want to know the course details,  fee structure and about placement', 0, N'', N'Kolkata', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-09T21:33:59.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (57, 2, 8, N'Jyotirmay Banerjee', N'dr.jyotirmay1987@gmail.com', N'9434387646', NULL, N'Enquiry For Courses.', N'Details of course 
Online possible?? ', 0, N'', N'Bardhaman ', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-10T05:52:49.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[OnlineEnquiry] OFF
GO
SET IDENTITY_INSERT [dbo].[OrganizeCampEnquiry] ON 

INSERT [dbo].[OrganizeCampEnquiry] ([ID], [Name], [Mobile], [Email], [ExpectedCount], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (70, N'Neeraj Singh', N'0852781881', N'singh.neer@ymail.com', 22, N'CAP Global', 2, 0, NULL, CAST(N'2020-05-03T20:59:51.0000000' AS DateTime2), 0, 0, 2)
SET IDENTITY_INSERT [dbo].[OrganizeCampEnquiry] OFF
GO
SET IDENTITY_INSERT [dbo].[OTPMaster] ON 

INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (1, 1, N'813239', N'6702206f-4c12-4192-94cc-4444023049cb', CAST(N'2020-06-07T04:28:26.147' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (2, 1, N'418547', N'2a9f11b3-f1f8-42be-926e-0e57d48a1bab', CAST(N'2020-06-07T04:35:53.103' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (3, 1, N'192110', N'f129f71f-ff7a-437a-a5d8-651075902dc2', CAST(N'2020-06-07T12:10:55.453' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (4, 1, N'637580', N'6808f26f-6751-4e82-bc6d-20113eddb5c2', CAST(N'2020-06-07T12:14:31.860' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (5, 1, N'204525', N'06e660fc-2c68-4349-946b-7ca9aa0adddf', CAST(N'2020-06-07T12:19:21.410' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (6, 1, N'135261', N'c40b85c0-005e-41d4-a304-df515e637d77', CAST(N'2020-06-07T12:24:57.883' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (7, 1, N'299214', N'46a6731b-550a-4be3-9ca5-191f900bf246', CAST(N'2020-06-07T12:27:35.420' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (8, 1, N'826477', N'279d0b3f-369d-4386-acb5-f9dbbd2a9f28', CAST(N'2020-06-07T17:13:22.540' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (9, 1, N'573031', N'7e1c97d7-2cd1-4280-aba2-1d9e1168d234', CAST(N'2020-06-10T20:34:27.800' AS DateTime), 0)
INSERT [dbo].[OTPMaster] ([OTPMasterID], [UserID], [OTP], [GUID], [CreatedDate], [Attempts]) VALUES (10, 1, N'495553', N'8f0a6662-cd82-4d7e-b65a-9507a879ddda', CAST(N'2020-06-10T20:34:32.287' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[OTPMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[PackageCategory] ON 

INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (1, N'Basic', N'Basic', NULL, N'../../assets/img/h-packages/basic.jpg', NULL, 0, NULL)
INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (2, N'Diabetes', N'Diabetes', NULL, N'../../assets/img/h-packages/diabetese.jpg', NULL, 0, NULL)
INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (3, N'Cardiac', N'Cardiac', NULL, N'../../assets/img/h-packages/cardiac.jpg', NULL, 0, NULL)
INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (4, N'Full Body', N'Full Body', NULL, N'../../assets/img/h-packages/full-body.jpg', NULL, 0, NULL)
INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (5, N'Wellness', N'Wellness', NULL, N'../../assets/img/h-packages/wellness.jpg', NULL, 0, NULL)
INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (6, N'Pre Marital check', N'Pre Marital check', NULL, N'../../assets/img/h-packages/pre-marital.jpg', NULL, 0, NULL)
INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (7, N'Senior Citizen', N'Senior Citizen', NULL, N'../../assets/img/h-packages/senior-citizen.jpg', NULL, 0, NULL)
INSERT [dbo].[PackageCategory] ([ID], [Name], [Title], [SubTitle], [ImageUrl], [About], [IsDeleted], [CompanyID]) VALUES (8, N'Executive Pack', N'Executive Pack', NULL, N'../../assets/img/h-packages/executive-pack.jpg', NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[PackageCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[PackageMaster] ON 

INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (1, N'MINI BODY CHECK MALE', N'MINI BODY CHECK MALE', NULL, N'COMPLETE BLOOD COUNT (CBC),
COMPLETE URINE, EXAMINATION,
CHOLESTEROL - SERUM,
GLUCOSE FASTING', CAST(600.00 AS Numeric(9, 2)), 1, 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (2, N'MINI BODY CHECK FEMALE', N'MINI BODY CHECK FEMALE', NULL, N'MINI BODY CHECK FEMALE', CAST(850.00 AS Numeric(9, 2)), 1, 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (3, N'DIABETIC CHECK', N'DIABETIC CHECK', NULL, N'DIABETIC CHECK', CAST(499.00 AS Numeric(9, 2)), 1, 2, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (4, N'DIABETIC PANEL', N'DIABETIC PANEL', NULL, N'DIABETIC PANEL', CAST(699.00 AS Numeric(9, 2)), 1, 2, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (5, N'DIABETES MONITORING PANEL', N'DIABETES MONITORING PANEL', NULL, N'DIABETES MONITORING PANEL', CAST(950.00 AS Numeric(9, 2)), 1, 2, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (6, N'Diabetes Check Gold', N'Diabetes Check Gold', NULL, NULL, CAST(1100.00 AS Numeric(9, 2)), 1, 2, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (7, N'MASTER CHECK DIABETES', N'MASTER CHECK DIABETES', NULL, NULL, CAST(1590.00 AS Numeric(9, 2)), 1, 2, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (8, N'EXECUTIVE PACK -II', NULL, N'DIABETIC CHECK UP', NULL, CAST(1700.00 AS Numeric(9, 2)), 1, 2, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (9, N'HEALTHY HEART', N'HEALTHY HEART', NULL, NULL, CAST(799.00 AS Numeric(9, 2)), 1, 3, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (10, N'HEALTHY HEART EXTENDED', N'HEALTHY HEART EXTENDED', NULL, NULL, CAST(1299.00 AS Numeric(9, 2)), 1, 3, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (11, N'BASIC CARDIAC CHECK UP', N'BASIC CARDIAC CHECK UP', NULL, NULL, CAST(1400.00 AS Numeric(9, 2)), 1, 3, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (12, N'EXECUTIVE PACK -III CARDIAC CHECK UP', N'EXECUTIVE PACK -III CARDIAC CHECK UP', NULL, NULL, CAST(3200.00 AS Numeric(9, 2)), 1, 3, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (13, N'MASTER CHECK BASIC', N'MASTER CHECK BASIC', NULL, NULL, CAST(1990.00 AS Numeric(9, 2)), 1, 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (14, N'AYUSH SMART 1  ', N'AYUSH SMART 1  ', NULL, NULL, CAST(899.00 AS Numeric(9, 2)), 1, 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (15, N'AYUSH SMART 2', N'AYUSH SMART 2', NULL, NULL, CAST(1199.00 AS Numeric(9, 2)), 1, 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (16, N'AYUSH SMART 3', N'AYUSH SMART 3', NULL, NULL, CAST(1899.00 AS Numeric(9, 2)), 1, 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (17, N'MASTER CHECK LITE', N'MASTER CHECK LITE', NULL, NULL, CAST(2490.00 AS Numeric(9, 2)), 1, 4, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (18, N'MASTER CHECK SILVER', N'MASTER CHECK SILVER', NULL, NULL, CAST(2890.00 AS Numeric(9, 2)), 1, 4, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (19, N'MASTER CHECK GOLD', N'MASTER CHECK GOLD', NULL, NULL, CAST(4150.00 AS Numeric(9, 2)), 1, 4, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (20, N'MASTER CHECK DIAMOND', N'MASTER CHECK DIAMOND', NULL, NULL, CAST(5490.00 AS Numeric(9, 2)), 1, 4, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (21, N'MASTER CHECK PLATINUM', N'MASTER CHECK PLATINUM', NULL, NULL, CAST(6990.00 AS Numeric(9, 2)), 1, 4, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (22, N'THYROID PANEL', N'THYROID PANEL', NULL, NULL, CAST(899.00 AS Numeric(9, 2)), 1, 5, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (23, N'VITAMIN CHECK', N'VITAMIN CHECK', NULL, NULL, CAST(1299.00 AS Numeric(9, 2)), 1, 5, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (24, N'PAIN CHECK', N'PAIN CHECK', N'Body check', NULL, CAST(1999.00 AS Numeric(9, 2)), 1, 5, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (25, N'BONE PROFILE', N'BONE PROFILE', NULL, NULL, CAST(2999.00 AS Numeric(9, 2)), 1, 5, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (26, N'PRE MARITAL HEALTH CHECKUP1 (MALE)', N'PRE MARITAL HEALTH CHECKUP1 (MALE)', NULL, NULL, CAST(4859.00 AS Numeric(9, 2)), 1, 6, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (27, N'PRE MARITAL HEALTH CHECKUP 1(FEMALE)', N'PRE MARITAL HEALTH CHECKUP 1(FEMALE)', NULL, NULL, CAST(1829.00 AS Numeric(9, 2)), 1, 6, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (28, N'PRE MARITAL HEALTH CHECKUP 3(FEMALE)', N'PRE MARITAL HEALTH CHECKUP 3(FEMALE)', NULL, NULL, CAST(3279.00 AS Numeric(9, 2)), 1, 6, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (29, N'PRE MARITAL HEALTH CHECKUP 2 (MALE)', N'PRE MARITAL HEALTH CHECKUP (MALE)', NULL, NULL, CAST(3279.00 AS Numeric(9, 2)), 1, 6, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (30, N'PRE MARITAL HEALTH CHECKUP2(FEMALE)', N'PRE MARITAL HEALTH CHECKUP2(FEMALE)', NULL, NULL, CAST(4859.00 AS Numeric(9, 2)), 1, 6, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (31, N'For MEN', N'For MEN', NULL, NULL, CAST(3190.00 AS Numeric(9, 2)), 1, 7, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (32, N'For  WOMEN', N'For  WOMEN', NULL, NULL, CAST(3090.00 AS Numeric(9, 2)), 1, 7, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (33, N'EXECUTIVE PACK 1', N'EXECUTIVE PACK 1', NULL, NULL, CAST(2950.00 AS Numeric(9, 2)), 1, 8, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
INSERT [dbo].[PackageMaster] ([ID], [Name], [Title], [SubTitle], [About], [Cost], [Status], [CatgID], [CreatedDate], [IsDeleted], [UpdatedDate], [ImageUrl], [CompanyID], [Sequence]) VALUES (34, N'EXECUTIVE PACK II', N'EXECUTIVE PACK II', NULL, NULL, CAST(1700.00 AS Numeric(9, 2)), 1, 8, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 99, NULL)
SET IDENTITY_INSERT [dbo].[PackageMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionID], [PermissionValue]) VALUES (1, N'Admin')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionValue]) VALUES (2, N'View')
INSERT [dbo].[Permissions] ([PermissionID], [PermissionValue]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleMaster] ON 

INSERT [dbo].[RoleMaster] ([RoleID], [Name], [Code], [Type], [Status], [IsAdmin], [IsDeleted], [RoleDescription], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (1, N'Admin', N'ADM', 1, 1, 1, 0, N'Admin Role', 1, NULL, CAST(N'2017-10-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RoleMaster] ([RoleID], [Name], [Code], [Type], [Status], [IsAdmin], [IsDeleted], [RoleDescription], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (2, N'Employee', N'EMP', 2, 1, 0, 0, N'Employee Role', 1, NULL, CAST(N'2017-10-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RoleMaster] ([RoleID], [Name], [Code], [Type], [Status], [IsAdmin], [IsDeleted], [RoleDescription], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (3, N'Customer', N'CST', 3, 1, 0, 0, N'Customer Role', 1, NULL, CAST(N'2017-11-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RoleMaster] ([RoleID], [Name], [Code], [Type], [Status], [IsAdmin], [IsDeleted], [RoleDescription], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (4, N'Student', N'STD', 4, 1, 0, 0, N'Student Role', 1, NULL, CAST(N'2020-06-10T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RoleMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleModule] ON 

INSERT [dbo].[RoleModule] ([RoleModuleID], [RoleID], [ModuleID], [Sequence], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (1, 1, 1, 1, 0, 0, 1, NULL, CAST(N'2017-10-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RoleModule] ([RoleModuleID], [RoleID], [ModuleID], [Sequence], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (2, 1, 2, 3, 0, 0, 15, NULL, CAST(N'2017-11-26T23:20:30.240' AS DateTime), NULL)
INSERT [dbo].[RoleModule] ([RoleModuleID], [RoleID], [ModuleID], [Sequence], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (3, 1, 3, 3, 0, 0, 15, NULL, CAST(N'2017-11-26T23:20:30.297' AS DateTime), NULL)
INSERT [dbo].[RoleModule] ([RoleModuleID], [RoleID], [ModuleID], [Sequence], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (5, 3, 2, 1, 1, 0, 1, NULL, CAST(N'2017-09-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[RoleModule] ([RoleModuleID], [RoleID], [ModuleID], [Sequence], [IsMandatory], [IsDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (6, 3, 3, 1, 0, 0, 1, NULL, CAST(N'2017-10-10T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RoleModule] OFF
GO
SET IDENTITY_INSERT [dbo].[SpecialityMaster] ON 

INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (1, N'General Physician', N'General Physician', 0, N'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (2, N'Laproscopic Surgery', N'Laproscopic Surgery', 1, N'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (3, N'Audiology and Speech Therepy', N'Audiology and Speech Therepy', 1, N'../../assets/img/h-packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (4, N'Cardiology', N'Cardiology (Heart)', 0, N'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (5, N'Cardiac Surgery', N'Cardiac Surgery (Heart)', 1, N'../../assets/img/h-packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (6, N'Endocrinologist', N'Endocrinologist', 1, N'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (7, N'ENT', N'Ear Nose Tounge', 0, N'../../assets/img/h-packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (8, N'Diabetes and Endocrinology', N'Diabetes & Endocrinology', 0, N'https://downloads.healthcatalyst.com/wp-content/uploads/2016/12/diabetes-care.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (9, N'Pediatrics/Paediatric Cardiology', N'Paediatric/Paediatric Intensivist', 0, N'../../assets/img/h-packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (10, N'Orthopaedic', N'Orthopaedic', 0, N'https://media.istockphoto.com/photos/radiologist-doctor-with-digital-tablet-checking-xray-healthcare-and-picture-id649856016?k=6&m=649856016&s=612x612&w=0&h=kzoxnRizg4drZo0ns47rB45QbgErsUBrSh-ZfGIjs3A=', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (11, N'Gynaecologist', N'Gynaecologist & Obstetrician', 0, N'https://www.mdoctorshub.com/wp-content/uploads/2017/04/1.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (12, N'Physiotherapist', N'Physiotherapist', 0, N'https://thumbs.dreamstime.com/b/young-woman-wearing-brace-rehabilitation-her-physiotherapist-women-horizontal-view-129652970.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (13, N'Nutrition/ Dietitian', N'Nutrition/ Dietitian', 0, N'https://image.shutterstock.com/image-photo/young-asian-dietician-nutritionist-holding-260nw-1311225152.jpg', NULL, 99)
SET IDENTITY_INSERT [dbo].[SpecialityMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentInvoice] ON 

INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (5, N'Billing Name Neeraj Singh', CAST(N'2020-06-24T18:30:00.000' AS DateTime), CAST(20000.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 1, 0, 1, N'', N'TestTest Billing Address', 1, 1, N'201301', 1, N'', 5, NULL, 0, CAST(N'2020-06-15T20:37:30.047' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (7, N'Student bill', CAST(N'2020-06-23T18:30:00.000' AS DateTime), CAST(19000.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 1, 0, 2, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T13:35:16.530' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (11, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:19:25.893' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (12, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:19:28.937' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (13, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:19.133' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (14, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:19.910' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (15, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:20.230' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (16, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:20.463' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (17, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:20.673' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (18, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:20.910' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (19, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:21.117' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (20, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:21.293' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (21, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:21.507' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (22, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:21.927' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (23, N'yytryr', CAST(N'2020-06-10T18:30:00.000' AS DateTime), CAST(4567.00 AS Decimal(9, 2)), CAST(768.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:20:22.453' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (24, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:53.537' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (25, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:56.153' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (26, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:56.793' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (27, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:57.273' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (28, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:57.653' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (29, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:58.047' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (30, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:58.270' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (31, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:58.403' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (32, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:58.627' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (33, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:58.800' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (34, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:59.020' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (35, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:59.150' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (36, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:59.357' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (37, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:59.557' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (38, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:20:59.767' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (39, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:00.000' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (40, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:00.283' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (41, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:00.540' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (42, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:00.770' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (43, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:01.007' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (44, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:01.237' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (45, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:01.507' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (46, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:01.653' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (47, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:01.897' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (48, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:02.103' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (49, N'yhhmb', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(6868.00 AS Decimal(9, 2)), CAST(99.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:21:56.633' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (50, N'Name inv', CAST(N'2020-06-23T18:30:00.000' AS DateTime), CAST(220001.00 AS Decimal(9, 2)), CAST(220.00 AS Decimal(9, 2)), 1, 0, 0, N'', N'qb jb jbjhsb jsbjhs bj', 2, 2, N'', 2, N'', 5, NULL, 0, CAST(N'2020-06-20T16:30:24.437' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (51, N'neer.s@outlook.com', CAST(N'2020-06-29T18:30:00.000' AS DateTime), CAST(10000.00 AS Decimal(9, 2)), CAST(10.00 AS Decimal(9, 2)), 1, 0, 3, N'', N'', 0, 0, N'', 1, N'', 5, NULL, 0, CAST(N'2020-06-20T16:33:02.460' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (52, N'Billing Name test', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(4500.00 AS Decimal(9, 2)), CAST(4500.00 AS Decimal(9, 2)), 1, 0, 2, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:37:18.067' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (53, N'Billing Name test', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(4500.00 AS Decimal(9, 2)), CAST(4500.00 AS Decimal(9, 2)), 1, 0, 2, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:37:26.620' AS DateTime), 0, NULL, NULL, 0)
INSERT [dbo].[StudentInvoice] ([ID], [Name], [InvoiceDate], [SubTotal], [Tax], [Status], [PaymentStatus], [PaymentMode], [CopyEmail], [Address], [City], [State], [Pin], [Country], [Mobile], [UserID], [CourseID], [IsDeleted], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [CompanyId]) VALUES (54, N'Billing Name test', CAST(N'2020-06-17T18:30:00.000' AS DateTime), CAST(4500.00 AS Decimal(9, 2)), CAST(4500.00 AS Decimal(9, 2)), 1, 0, 2, N'', N'', 0, 0, N'', 1, N'', 6, NULL, 0, CAST(N'2020-06-20T16:47:48.773' AS DateTime), 0, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[StudentInvoice] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCourses] ON 

INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (1, N'DMLT(Diploma In Medical Laboratory Technician)', 24, N'12th - Arts/Commerce', 17, 99, CAST(30000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), 1, 2)
INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (2, N'CMLT(Certificate in In Medical Laboratory Technician)', 12, N'12th - Arts/Commerce', 17, 99, CAST(15000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), 1, 2)
INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (3, N'DPT(Diploma In Physiotherapy)', 24, N'12th - Arts/Commerce', 17, 99, CAST(30000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), 2, 2)
INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (4, N'CPT(Certificate In Physiotherapy)', 12, N'12th - Arts/Commerce', 17, 99, CAST(15000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), 2, 2)
INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (5, N'DPC(Diploma In Patient Care)', 24, N'12th - Arts/Commerce', 17, 99, CAST(30000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), CAST(40000.00 AS Numeric(9, 2)), 3, 2)
INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (6, N'CPC(Certificate In Patient Care)', 12, N'12th - Arts/Commerce', 17, 99, CAST(15000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), 3, 2)
INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (7, N'Diploma In ECG Technicia', 12, N'12th - Arts/Commerce', 17, 99, CAST(5000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(10000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), 4, 2)
INSERT [dbo].[SubCourses] ([ID], [Name], [Duration], [MinQualification], [MinAge], [MaxAge], [IndianAdmissionFee], [ForeignAdmissionFee], [IndianOtherFee], [ForeignOtherFee], [CourseMasterID], [CompanyID]) VALUES (8, N'Certificate In Diet & Nutrition', 12, N'12th - Arts/Commerce', 17, 99, CAST(5000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), CAST(10000.00 AS Numeric(9, 2)), CAST(20000.00 AS Numeric(9, 2)), 5, 2)
SET IDENTITY_INSERT [dbo].[SubCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemSettings] ON 

INSERT [dbo].[SystemSettings] ([SettingID], [CompanyID], [LogoutTime], [LoginFailedAttempt], [MaxLeaveMarkDays], [WeeklyOffDays], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IdleSystemDay]) VALUES (1, 1, 2, 5, 15, N'2', CAST(N'2018-05-06T00:00:00.000' AS DateTime), 1, NULL, NULL, 30)
INSERT [dbo].[SystemSettings] ([SettingID], [CompanyID], [LogoutTime], [LoginFailedAttempt], [MaxLeaveMarkDays], [WeeklyOffDays], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IdleSystemDay]) VALUES (2, 2, 5, 5, 15, N'1', CAST(N'2018-05-06T00:00:00.000' AS DateTime), 1, NULL, NULL, 30)
SET IDENTITY_INSERT [dbo].[SystemSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[TestMaster] ON 

INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (1, N'COMPLETE BLOOD COUNT (CBC)', 1, N'', 24, N'', CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, 1, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (2, N'COMPLETE URINE EXAMINATION', 2, N'', 24, N'', CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, 1, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (3, N'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (4, N'GLUCOSE FASTING', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (6, N'COMPLETE BLOOD COUNT (CBC) - FEMALE', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 0, 2, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (7, N'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 2, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (8, N'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 2, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (9, N'GLUCOSE FASTING', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 2, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (10, N'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 2, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (11, N'GLUCOSE FASTING', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (12, N'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (13, N'ASPARTATE AMINOTRANSFERASE (AST/SGOT)', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (14, N'ALANINE AMINOTRANSFERASE (ALT/SGPT)', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (15, N'UREA - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (16, N'CREATININE SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (17, N'THYROID STIMULATING HORMONE (TSH)', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (18, N'CALCIUM	SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (19, N'HEMOGLOBIN', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 14, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (20, N'GLUCOSE FASTING', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (21, N'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (22, N'ASPARTATE AMINOTRANSFERASE (AST/SGOT) SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (23, N'ALANINE AMINOTRANSFERASE (ALT/SGPT) SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (24, N'UREA - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (25, N'CREATININE SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (26, N'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (27, N'CALCIUM SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (28, N'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (29, N'TRIGLYCERIDES - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (30, N'BILIRUBIN SERUM - TOTAL/DIRECT/INDIRECT', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (31, N'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 15, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (32, N'GLUCOSE FASTING', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (33, N'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (34, N'ASPARTATE AMINOTRANSFERASE (AST/SGOT) SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (35, N'ALANINE AMINOTRANSFERASE (ALT/SGPT) SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (36, N'UREA - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (37, N'CREATININE SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (38, N'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (39, N'TRIGLYCERIDES - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (40, N'BILIRUBIN SERUM - TOTAL/DIRECT/INDIRECT', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (41, N'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (42, N'VITAMIN D - 25 HYDROXY (D2+D3)', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (43, N'CALCIUM SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 16, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (44, N'COMPLETE URINE EXAMINATION', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 3, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (45, N'GLUCOSE  FASTING', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 3, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (46, N'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 3, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (47, N'GLUCOSE	 FASTING', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 4, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (48, N'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 4, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (49, N'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 4, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (50, N'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 4, 99)
INSERT [dbo].[TestMaster] ([ID], [Name], [Type], [PreTestInfo], [ResultInHours], [Components], [Cost], [CreatedDate], [UpdatedDate], [IsDeleted], [PackageID], [CompanyID]) VALUES (51, N'TRIGLYCERIDES - SERUM', 1, NULL, 24, NULL, CAST(0.00 AS Numeric(9, 2)), CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, 0, 4, 99)
SET IDENTITY_INSERT [dbo].[TestMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserMaster] ON 

INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent]) VALUES (1, N'Admin', N'Admin', 0, N'neer.s', N'123456', NULL, N'E101', N'neer.s@outlook.com', 1, 1, NULL, 1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'999999999', N'9999999999', 1, 0, 0)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent]) VALUES (2, N'Customer', N'Customer', 0, N'customer', N'123456', NULL, N'C101', N'customer@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-06-05T22:54:14.443' AS DateTime), 1, NULL, NULL, N'999989', N'9999999999', 1, 1, 0)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent]) VALUES (3, N'Student', N'Student', 0, N'student', N'123456', NULL, N'S101', N'student@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'99989', N'9999999999', 1, 0, 1)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent]) VALUES (5, N'Neeraj', N'Singh', 0, N'neeraj', N'123456', NULL, N'S102', N'neeraj@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-06-14T23:33:47.263' AS DateTime), 1, NULL, NULL, N'909089898', N'0900800', 1, 0, 1)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent]) VALUES (6, N'Akash', N'Shil', 0, N'akash', N'123456', NULL, N'S103', N'akash@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-06-14T23:33:47.263' AS DateTime), 1, NULL, NULL, N'909089898', N'0900800', 1, 0, 1)
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UserReports] ON 

INSERT [dbo].[UserReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (1, 2, N'adharx.pdf', N'C:\PROJECTS\IQHealth\IqHealth\IqHealth.WebApi\Content\DiagnosticReports\2/adharx.pdf', 1, CAST(N'2020-02-27T21:54:55.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UserReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (2, 2, N'Appoitent.pdf', N'C:\PROJECTS\IQHealth\IqHealth\IqHealth.WebApi\Content\DiagnosticReports\2/Appoitent.pdf', 1, CAST(N'2020-02-27T21:57:21.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UserReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (3, 2, N'getPolicyCopB.pdf', N'getPolicyCopB.pdf', 1, CAST(N'2020-02-27T10:42:02.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UserReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (4, 2, N'adharx (1).pdf', N'adharx (1).pdf', 1, CAST(N'2020-02-27T10:42:44.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UserReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (5, 2, N'0_01042008-AnnexureI.pdf', N'0_01042008-AnnexureI.pdf', 1, CAST(N'2020-04-09T23:43:41.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UserReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (6, 2, N'1042008-AnnexureI.pdf', N'1042008-AnnexureI.pdf', 1, CAST(N'2020-04-09T23:51:15.0000000' AS DateTime2), 1, 0, 2)
SET IDENTITY_INSERT [dbo].[UserReports] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([UserRoleID], [RoleID], [UserID], [IsActive], [isDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (4, 1, 1, 1, 0, 1, NULL, CAST(N'2020-06-11T19:51:24.850' AS DateTime), NULL)
INSERT [dbo].[UserRoles] ([UserRoleID], [RoleID], [UserID], [IsActive], [isDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (7, 3, 2, 1, 0, 1, NULL, CAST(N'2020-06-11T19:56:40.037' AS DateTime), NULL)
INSERT [dbo].[UserRoles] ([UserRoleID], [RoleID], [UserID], [IsActive], [isDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (8, 4, 3, 1, 0, 1, NULL, CAST(N'2020-06-11T20:02:46.353' AS DateTime), NULL)
INSERT [dbo].[UserRoles] ([UserRoleID], [RoleID], [UserID], [IsActive], [isDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (10, 4, 1, 1, 0, 1, NULL, CAST(N'2020-06-19T17:54:19.670' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
/****** Object:  Index [FK_Booking_Company_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Company_idx] ON [dbo].[BookingMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Package_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Package_ID_idx] ON [dbo].[BookingMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Test_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Test_ID_idx] ON [dbo].[BookingMaster]
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Curriculam_CourseMaster_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Curriculam_CourseMaster_ID_idx] ON [dbo].[CourseCurriculum]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Eligibility_Course_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Eligibility_Course_ID_idx] ON [dbo].[CourseEligibility]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Course_Company_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Course_Company_ID_idx] ON [dbo].[CourseMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Doctor]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Doctor] ON [dbo].[DoctorAppointment]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Hospital_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Hospital_idx] ON [dbo].[DoctorAppointment]
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_DoctorAppointment_Company_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_DoctorAppointment_Company_idx] ON [dbo].[DoctorAppointment]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Doctor_Speciality_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Doctor_Speciality_ID_idx] ON [dbo].[DoctorMaster]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_HealthServiceMaster_Company_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_HealthServiceMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageCategory_Company_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_PackageCategory_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageMaster_Company_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_PackageMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Docotr_Specialities_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Docotr_Specialities_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Specialites+Doctor_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Specialites+Doctor_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email_UNIQUE]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email_UNIQUE] ON [dbo].[JobApplication]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Catg_Name_UNIQUE]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Catg_Name_UNIQUE] ON [dbo].[PackageCategory]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_package_catg_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [fk_package_catg_ID_idx] ON [dbo].[PackageMaster]
(
	[CatgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Package_Comapny_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Package_Comapny_ID_idx] ON [dbo].[PackageMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Name_UNIQUE]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Name_UNIQUE] ON [dbo].[PackageMaster]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Speciality_Company_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Speciality_Company_ID_idx] ON [dbo].[SpecialityMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCources_Company_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_SubCources_Company_ID_idx] ON [dbo].[SubCourses]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCourses_Course_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_SubCourses_Course_ID_idx] ON [dbo].[SubCourses]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_TestMaster_Company_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_TestMaster_Company_ID_idx] ON [dbo].[TestMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_tests_packages_ID_idx]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE NONCLUSTERED INDEX [fk_tests_packages_ID_idx] ON [dbo].[TestMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FileName_UNIQUE]    Script Date: 21-Jun-20 2:31:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [FileName_UNIQUE] ON [dbo].[UserReports]
(
	[FileName] ASC
)
WHERE ([FileName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingMaster] ADD  DEFAULT ((0)) FOR [Age]
GO
ALTER TABLE [dbo].[BookingMaster] ADD  DEFAULT ('+91') FOR [Mobile]
GO
ALTER TABLE [dbo].[BookingMaster] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[CourseEligibility] ADD  DEFAULT ('10th') FOR [Qualification]
GO
ALTER TABLE [dbo].[CourseEligibility] ADD  DEFAULT ((15)) FOR [MinAge]
GO
ALTER TABLE [dbo].[CourseEligibility] ADD  DEFAULT ((99)) FOR [MaxAge]
GO
ALTER TABLE [dbo].[CourseEligibility] ADD  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[CourseEligibility] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  DEFAULT ((0)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  DEFAULT ('10th') FOR [Qualification]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  DEFAULT ((15)) FOR [MinAge]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  DEFAULT ((99)) FOR [MaxAge]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[CourseMaster] ADD  DEFAULT ('assets/images/academy/courses/courses.jpg') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[DoctorAppointment] ADD  DEFAULT ((0)) FOR [Age]
GO
ALTER TABLE [dbo].[DoctorAppointment] ADD  DEFAULT ('+91') FOR [Mobile]
GO
ALTER TABLE [dbo].[DoctorMaster] ADD  DEFAULT ((999)) FOR [Sequence]
GO
ALTER TABLE [dbo].[DoctorMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[DoctorMaster] ADD  DEFAULT ((1)) FOR [SpecialityID]
GO
ALTER TABLE [dbo].[EmailTemplate] ADD  CONSTRAINT [DF_EmailTemplate_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[HealthServiceMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[HealthServiceMaster] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[HospitalMaster] ADD  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[HospitalMaster] ADD  DEFAULT ((1)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[HospitalMaster] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[InvoiceItems] ADD  CONSTRAINT [InvI_DEF_Cost]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[InvoiceItems] ADD  CONSTRAINT [InvI_DEF_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[InvoiceItems] ADD  CONSTRAINT [InvI_DEF_ISDEL]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[JobApplication] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[ModuleMaster] ADD  CONSTRAINT [MM_DEF_ISDEL]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ModuleMaster] ADD  CONSTRAINT [MM_DEF]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OnlineEnquiry] ADD  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[OnlineEnquiry] ADD  DEFAULT ('+91') FOR [Phone]
GO
ALTER TABLE [dbo].[OnlineEnquiry] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[OnlineEnquiry] ADD  DEFAULT ((1)) FOR [Country]
GO
ALTER TABLE [dbo].[OnlineEnquiry] ADD  DEFAULT ((0)) FOR [CaptchaVerified]
GO
ALTER TABLE [dbo].[OnlineEnquiry] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[OTPMaster] ADD  CONSTRAINT [DF__OTPMaster__Creat__2BE97B0D]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OTPMaster] ADD  DEFAULT ((0)) FOR [Attempts]
GO
ALTER TABLE [dbo].[PackageCategory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PackageMaster] ADD  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[PackageMaster] ADD  DEFAULT ((1)) FOR [CatgID]
GO
ALTER TABLE [dbo].[PackageMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[PackageMaster] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[RoleMaster] ADD  CONSTRAINT [RM_DEF]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SpecialityMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SpecialityMaster] ADD  DEFAULT ('../../assets/img/h-packages/cardiac.jpg') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[SpecialityMaster] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[StudentInvoice] ADD  CONSTRAINT [SI_InvD_DEF]  DEFAULT (getdate()) FOR [InvoiceDate]
GO
ALTER TABLE [dbo].[StudentInvoice] ADD  CONSTRAINT [SI_DEF_TAX]  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[StudentInvoice] ADD  CONSTRAINT [SI_DEF_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[StudentInvoice] ADD  CONSTRAINT [SI_DEF_ISDEL]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StudentInvoice] ADD  CONSTRAINT [SI_CD_DEF]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SubCourses] ADD  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[SubCourses] ADD  DEFAULT ((15)) FOR [MinAge]
GO
ALTER TABLE [dbo].[SubCourses] ADD  DEFAULT ((99)) FOR [MaxAge]
GO
ALTER TABLE [dbo].[SubCourses] ADD  DEFAULT ((0)) FOR [IndianAdmissionFee]
GO
ALTER TABLE [dbo].[SubCourses] ADD  DEFAULT ((0)) FOR [ForeignAdmissionFee]
GO
ALTER TABLE [dbo].[SubCourses] ADD  DEFAULT ((1)) FOR [CourseMasterID]
GO
ALTER TABLE [dbo].[SubCourses] ADD  DEFAULT ((999)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[TestMaster] ADD  DEFAULT ((1)) FOR [Type]
GO
ALTER TABLE [dbo].[TestMaster] ADD  DEFAULT ((24)) FOR [ResultInHours]
GO
ALTER TABLE [dbo].[TestMaster] ADD  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[TestMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TestMaster] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [DF_UserMaster_Password]  DEFAULT ('_#^~!875(~$8') FOR [Password]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [UserMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserMaster] ADD  CONSTRAINT [UM_DEF]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserReports] ADD  DEFAULT ((1)) FOR [FileType]
GO
ALTER TABLE [dbo].[UserReports] ADD  DEFAULT ((1)) FOR [UploadedBy]
GO
ALTER TABLE [dbo].[UserReports] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserReports] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [UR_DEF_ISDEL]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [UR_DEF]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserServiceAccess] ADD  CONSTRAINT [DF_UserServiceAccess_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserSystemSettings] ADD  CONSTRAINT [DF_UserSystemSettings_IsAPKLoggingEnabled]  DEFAULT ((0)) FOR [IsAPKLoggingEnabled]
GO
ALTER TABLE [dbo].[UserSystemSettings] ADD  CONSTRAINT [DF_UserSystemSettings_IsCoverageException]  DEFAULT ((0)) FOR [IsCoverageException]
GO
ALTER TABLE [dbo].[UserSystemSettings] ADD  CONSTRAINT [DF_UserSystemSettings_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[InvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_InvI_StudentInvoice_ID] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[StudentInvoice] ([ID])
GO
ALTER TABLE [dbo].[InvoiceItems] CHECK CONSTRAINT [FK_InvI_StudentInvoice_ID]
GO
ALTER TABLE [dbo].[LoginAttemptHistory]  WITH CHECK ADD  CONSTRAINT [FK_LoginAttemptHistory_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[LoginAttemptHistory] CHECK CONSTRAINT [FK_LoginAttemptHistory_UserMaster]
GO
ALTER TABLE [dbo].[RoleModule]  WITH CHECK ADD  CONSTRAINT [FK_RoleModules_ModuleMaster] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[ModuleMaster] ([ModuleID])
GO
ALTER TABLE [dbo].[RoleModule] CHECK CONSTRAINT [FK_RoleModules_ModuleMaster]
GO
ALTER TABLE [dbo].[RoleModule]  WITH CHECK ADD  CONSTRAINT [FK_RoleModules_RoleMaster] FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleMaster] ([RoleID])
GO
ALTER TABLE [dbo].[RoleModule] CHECK CONSTRAINT [FK_RoleModules_RoleMaster]
GO
ALTER TABLE [dbo].[StudentInvoice]  WITH CHECK ADD  CONSTRAINT [FK_SI_CourseMaster] FOREIGN KEY([CourseID])
REFERENCES [dbo].[CourseMaster] ([ID])
GO
ALTER TABLE [dbo].[StudentInvoice] CHECK CONSTRAINT [FK_SI_CourseMaster]
GO
ALTER TABLE [dbo].[StudentInvoice]  WITH CHECK ADD  CONSTRAINT [FK_StdI_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[StudentInvoice] CHECK CONSTRAINT [FK_StdI_UserMaster]
GO
ALTER TABLE [dbo].[UserRoleModulePermission]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleModulePermissions_RoleModules] FOREIGN KEY([RoleModuleID])
REFERENCES [dbo].[RoleModule] ([RoleModuleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoleModulePermission] CHECK CONSTRAINT [FK_UserRoleModulePermissions_RoleModules]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_RoleMaster] FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleMaster] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_RoleMaster]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_UserMaster]
GO
ALTER TABLE [dbo].[UserServiceAccess]  WITH CHECK ADD  CONSTRAINT [FK_UserServiceAccess_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserServiceAccess] CHECK CONSTRAINT [FK_UserServiceAccess_UserMaster]
GO
ALTER TABLE [dbo].[UserSystemSettings]  WITH CHECK ADD  CONSTRAINT [FK_UserSystemSettings_UserMaster] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserMaster] ([UserID])
GO
ALTER TABLE [dbo].[UserSystemSettings] CHECK CONSTRAINT [FK_UserSystemSettings_UserMaster]
GO
/****** Object:  StoredProcedure [dbo].[SPCheckAuthentication]    Script Date: 21-Jun-20 2:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*** 
   Created Date      :     14-May-2015
   Created By        :     Dhiraj Mishra
   Purpose           :     To check the authentication of user
   
   Test Cases        :
   --------------------------------------------------------------------------   
   --- Test Case 1
    EXEC [SPCheckAuthentication] 'wrGxlga}mlGxGxroNDwvGx^$IAa}DxwnwnBu','>^$8^$baButnIAyqDxSO' 

   
***/
CREATE PROCEDURE [dbo].[SPCheckAuthentication] (	
	 @LoginName VARCHAR(150)
	,@Password VARCHAR(100)
	,@IMEINumber VARCHAR(50) = NULL
	,@lattitude VARCHAR(50) = NULL
	,@longitude VARCHAR(50) = NULL
	,@IpAddress VARCHAR(45) = NULL
	,@BrowserName VARCHAR(50) = NULL
	,@ApkDeviceName VARCHAR(50) = NULL
	,@APKVersion VARCHAR(7) = NULL
	,@LoginType TINYINT = NULL
	)
AS
BEGIN	
	/*
	Login Status in .Net
			None = 0,
            Active = 1,
            InActive = 2,
            Locked = 3,
            DaysExpire = 4,
            WrongPassword = 5,
            WrongIMEI = 6,
            MultipleIMEI = 7,
			WrongUserName = 9,
*/
	DECLARE @ImeiCount TINYINT = 0
	DECLARE @AuthStatus TINYINT = 0
	DECLARE @IMEITable TABLE (
		IEMINumber VARCHAR(50)
		,UserID INT
		)

	INSERT INTO @IMEITable
	SELECT ud.IMEINumber
		,ud.UserID
	FROM dbo.UserDevices ud(NOLOCK)
	WHERE ud.IMEINumber = @IMEINumber
		AND ud.IsDeleted = 0

	SELECT @ImeiCount = count(IEMINumber)
	FROM @IMEITable

	IF (@ImeiCount < 0)
	BEGIN
		SET @AuthStatus = 6 --WrongIMEI
	END
	--ELSE IF (@ImeiCount > 1)
	--BEGIN
	--	SET @AuthStatus = 7 --MultipleIMEI
	--END
	ELSE
	BEGIN
		--SystemSettting<Begin>
		DECLARE @IdleDaysSetting INT = 30
		DECLARE @LoginFailedAttemptSetting INT = 5

		SELECT TOP 1 @IdleDaysSetting = ss.IdleSystemDay
			,@LoginFailedAttemptSetting = ss.LoginFailedAttempt
		FROM SystemSettings ss

		--SystemSettting<End>

		--UserValidCheckDetail<Begin>
		DECLARE @AccountStatus INT
		DECLARE @UserPassword VARCHAR(50)
		DECLARE @IsDeleted BIT
		DECLARE @UserID INT
		DECLARE @UserName VARCHAR(150)

		SELECT @AccountStatus = um.AccountStatus
			,@UserPassword = um.Password
			,@IsDeleted = um.IsDeleted
			,@UserID = um.UserID
			,@UserName = um.LoginName
		FROM dbo.UserMaster um(NOLOCK)
		--INNER JOIN @IMEITable IM ON UM.UserID = IM.UserID

		IF (@IsDeleted = 1)
		BEGIN
			SET @AuthStatus = 2 --Inactive
		END
		ELSE
		BEGIN
		  IF (@LoginName = @UserName)
		  BEGIN
			  IF (@Password = @UserPassword)
			BEGIN
				IF (@AccountStatus = 3)
					SET @AuthStatus = @AccountStatus
				ELSE
				BEGIN
					SET @AuthStatus = 1 --Active & Password Matched

					INSERT INTO dbo.DailyLoginHistory (
						 UserID
						,Lattitude
						,Longitude
						,LoginTime
						,IpAddress
						,BrowserName
						,ApkDeviceName
						,IsLogin
						,APKVersion
						,LoginType
						)
					VALUES (
						 @UserID
						,@lattitude
						,@longitude
						,getdate() -- LoginTime - datetime					   
						,@IpAddress
						,@BrowserName
						,@ApkDeviceName
						,1 -- IsLogin - bit
						,@APKVersion
						,@LoginType
						)
				END
			END
			ELSE
			BEGIN
				SET @AuthStatus = 5 --WrongPassword

				DECLARE @FailedAttempt INT = 0

				SELECT @FailedAttempt = FailedAttempt + 1
				FROM LoginAttemptHistory lah(NOLOCK)
				WHERE lah.UserID = @UserID

				IF (@FailedAttempt IS NOT NULL)
				BEGIN
					UPDATE dbo.LoginAttemptHistory
					SET FailedAttempt = 0
						,LoginDate = GETDATE()
						,Lattitude = @lattitude
						,Longitude = @longitude
						,IpAddress = @IpAddress
					WHERE UserID = @UserID
				END
				ELSE
				BEGIN
					INSERT INTO LoginAttemptHistory (
						UserID
						,FailedAttempt
						,LoginDate
						,Lattitude
						,Longitude
						,IpAddress
						)
					VALUES (
						@UserID
						,1 -- FailedAttempt - int
						,Getdate() -- LoginDate - datetime					    
						,@lattitude -- Lattitude - varchar
						,@longitude -- Longitude - varchar
						,@IpAddress
						)
				END

				IF (@FailedAttempt > 3)
					UPDATE UserMaster
					SET AccountStatus = 3
						,ModifiedDate = getdate()
					WHERE UserID = @UserID
			END
		  END
		  ELSE
		  BEGIN
			  SET @AuthStatus = 8 --Incorrect UserName (Login Name)
		  END
		END
				--UserValidCheckDetail<End>
	END

	SELECT @AuthStatus AS AuthStatus
		,CASE 
			WHEN @AuthStatus = 1
				THEN @UserID
			ELSE 0
			END AS userID
END




GO
/****** Object:  StoredProcedure [dbo].[SPGetLoginDetails]    Script Date: 21-Jun-20 2:31:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*** 
   Created Date      :     14-May-2015
   Created By        :     Dhiraj Mishra
   Purpose           :     To check the authentication of user
   
   Test Cases        :
   --------------------------------------------------------------------------   
   --- Test Case 1
    EXEC [SPGetLoginDetails] 1088,1,'871qfvCS4J','efa6319a' , null

   
***/
CREATE PROCEDURE [dbo].[SPGetLoginDetails] (
	 @userID INT	
	,@showAnnouncment BIT = 1
	,@APIKey VARCHAR(50)
	,@APIToken VARCHAR(50)
    ,@APKVersion VARCHAR(7) = NULL
	)
AS
BEGIN    	
	SET NOCOUNT ON;
	
	
	CREATE TABLE #UserLoginDetails (
		 UserID INT NOT NULL
		,RoleID INT NOT NULL
		,RoleName VARCHAR(50) NOT NULL
		,UserRoleID INT
		)

	--,CompanyID INT
	--,EmplCode VARCHAR(50)
	--,FirstName VARCHAR(50)
	--,LastName VARCHAR(50)
	--,Mobile_Calling VARCHAR(50)
	DECLARE @RoleID INT
		,@RoleName VARCHAR(50)
		,@UserRoleID INT

	SELECT TOP 1 @RoleID = ur.RoleID
		,@UserRoleID = ur.UserRoleID
	FROM dbo.UserRoles ur(NOLOCK)
	WHERE ur.UserID = @userID
		AND ur.IsDeleted = 0

	--Profile level flags<Begin>
	SELECT 
		@RoleName = rm.Name	
	FROM dbo.RoleMaster rm(NOLOCK)
	WHERE rm.RoleID = @RoleID

	--Profile level flags<End>
	

	--Generate API KEY & Token<Begin>
	IF EXISTS (
			SELECT 1
			FROM dbo.UserServiceAccess usa(NOLOCK)
			WHERE usa.UserID = @userID
			)
	BEGIN
		UPDATE dbo.UserServiceAccess
		SET APIKey = @APIKey
			,APIToken = @APIToken
			,IsActive = 0
			,ModifiedDate = getdate()
			,ModifiedBy = @userID
		WHERE UserID = @userID
	END
	ELSE
	BEGIN
		INSERT INTO dbo.UserServiceAccess (
			 UserID
			,APIKey
			,APIToken
			,IsActive
			,CreatedDate
			,CreatedBy
			)
		VALUES (
			@userID
			,@APIKey
			,@APIToken
			,1
			,getdate()
			,@userID
			)
	END
	--TRUNCATE TABLE UserLoginDetails
	--Generate API KEY & Token<END>
	INSERT INTO #UserLoginDetails (
		UserID
		,RoleID
		,RoleName		
		,UserRoleID
		)
	VALUES (
		@userID
		,-- UserID - BIGINT
		@RoleID
		-- RoleID - INT
		,@RoleName
		,@UserRoleID -- UserRoleID - bigint
		)
			
	--SELECT l.UserID
	--	,l.RoleID
	--	,l.RoleName
	--	,l.UserRoleID
	--	,um.UserCode
	--	,um.FirstName
	--	,um.LastName
	--	,um.Mobile
	--	,um.LoginName
	--	,um.CompanyId
	--	,ISNULL(um.ImagePath, '') AS  ProfilePictureFileName
	--FROM #UserLoginDetails l
	--INNER JOIN dbo.UserMaster um(NOLOCK) ON l.UserID = um.UserID
	--DROP TABLE #UserLoginDetails

	DECLARE @Result Table(UserID INT, RoleID INT, RoleName VARCHAR(50), UserRoleID INT, EmpCode VARCHAR(50),
	 FirstName VARCHAR(40)
	,LastName VARCHAR(50)
	,Mobile VARCHAR(50)
	,LoginName VARCHAR(150)
	,CompanyId INT
	,ProfilePictureFileName VARCHAR(500))

	INSERT @Result SELECT 
	     l.UserID
		,l.RoleID
		,l.RoleName
		,l.UserRoleID
		,um.EmpCode
		,um.FirstName
		,um.LastName
		,um.Mobile
		,um.LoginName
		,um.CompanyId
		,ISNULL(um.ImagePath, '') AS  ProfilePictureFileName
	FROM #UserLoginDetails l
	INNER JOIN dbo.UserMaster um(NOLOCK) ON l.UserID = um.UserID
	
	DROP TABLE #UserLoginDetails

	select * from @Result
	END
GO
USE [master]
GO
ALTER DATABASE [HealthIQ] SET  READ_WRITE 
GO
