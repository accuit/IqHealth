USE [master]
GO
/****** Object:  Database [HealthIQ]    Script Date: 29-Jun-20 1:05:06 AM ******/
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
/****** Object:  UserDefinedFunction [dbo].[DecryptStr]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[RoleModule]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  View [dbo].[vwGetUserRoleModule]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[AddressMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[BookingMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[CommonSetup]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[ContactUsEnquiry]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[CorporateTieUpEnquiry]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[CourseCurriculum]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[CourseEligibility]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[CourseMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[DailyLoginHistory]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[DoctorAppointment]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[DoctorMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[DoctorSpecialities]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[EmailService]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[HealthServiceMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[HospitalMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[InvoiceItems]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[JobApplication]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[LoginAttemptHistory]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[OnlineEnquiry]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[OrganizeCampEnquiry]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[OTPMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[PackageCategory]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[PackageMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[PartnerEnquiry]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[Permissions]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[SpecialityMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[StudentInvoice]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[StudentMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[SubCourses]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[SystemSettings]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[TestMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[UserDevices]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[UserMaster]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
	[Image] [varchar](max) NULL,
	[Address] [varchar](500) NULL,
	[City] [int] NULL,
	[State] [int] NULL,
	[Country] [int] NULL,
	[Pin] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserReports]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[UserRoleModulePermission]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[UserServiceAccess]    Script Date: 29-Jun-20 1:05:07 AM ******/
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
/****** Object:  Table [dbo].[UserSystemSettings]    Script Date: 29-Jun-20 1:05:07 AM ******/
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

INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (1, N'Admin', N'Admin', 0, N'neer.s', N'123456', NULL, N'E101', N'neer.s@outlook.com', 1, 1, NULL, 1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'999999999', N'9999999999', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (2, N'Customer', N'Customer', 0, N'customer', N'123456', NULL, N'C101', N'customer@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-06-05T22:54:14.443' AS DateTime), 1, NULL, NULL, N'999989', N'9999999999', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (3, N'Student', N'Student', 0, N'student', N'123456', NULL, N'S101', N'student@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, NULL, NULL, N'99989', N'9999999999', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (5, N'Neeraj', N'Singh', 0, N'neeraj', N'123456', NULL, N'S102', N'neeraj@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-06-14T23:33:47.263' AS DateTime), 1, NULL, NULL, N'909089898', N'0900800', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (6, N'Akash', N'Shil', 0, N'akash', N'123456', NULL, N'S103', N'akash@gmail.com', 1, 1, NULL, NULL, CAST(N'2020-06-14T23:33:47.263' AS DateTime), 1, NULL, NULL, N'909089898', N'0900800', 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (7, N'Neeraj', N'Singh', 0, NULL, NULL, NULL, N'', N'singh.neer@ymail.com', NULL, 0, NULL, NULL, CAST(N'2020-06-25T00:27:33.233' AS DateTime), 0, NULL, NULL, NULL, N'08527818810', 0, 0, 1, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAoEA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (8, N'Sanjay Sahi', N'Walia', 0, NULL, NULL, NULL, N'', N'abc@test.com', NULL, 1, NULL, NULL, CAST(N'2020-06-25T00:45:56.530' AS DateTime), 1, NULL, NULL, NULL, N'0852781881', 0, 0, 1, N'data:image/png;base64,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', N'tyf yfjyf jyf', 2, 2, 1, N'775212')
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (9, N'Test Em', N'Employee', 0, NULL, N'123456', N'', N'', N'test@emp@gmail.com', 1, 1, NULL, 1, CAST(N'2020-06-28T02:40:07.867' AS DateTime), 1, NULL, NULL, NULL, N'23493242', 0, 0, 1, NULL, N'Test Employee Address herer', 2, 2, 1, N'741088')
INSERT [dbo].[UserMaster] ([UserID], [FirstName], [LastName], [IsDeleted], [LoginName], [Password], [ImagePath], [UserCode], [Email], [AccountStatus], [IsActive], [SeniorEmpID], [IsEmployee], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Phone], [Mobile], [CompanyId], [IsCustomer], [IsStudent], [Image], [Address], [City], [State], [Country], [Pin]) VALUES (10, N'Test', N'User', 0, NULL, N'123456', N'', N'', N'test@gmail.com', 1, 1, NULL, 1, CAST(N'2020-06-29T00:32:36.063' AS DateTime), 1, NULL, NULL, NULL, N'09599660409', 0, 0, 1, N'data:image/png;base64,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', N'My Test Address user created', 2, 3, 1, N'11012')
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
INSERT [dbo].[UserRoles] ([UserRoleID], [RoleID], [UserID], [IsActive], [isDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (11, 1, 9, 1, 0, 1, NULL, CAST(N'2020-06-28T02:40:08.417' AS DateTime), NULL)
INSERT [dbo].[UserRoles] ([UserRoleID], [RoleID], [UserID], [IsActive], [isDeleted], [CreatedBy], [ModifiedBy], [CreatedDate], [ModifiedDate]) VALUES (12, 1, 10, 1, 0, 1, NULL, CAST(N'2020-06-29T00:32:38.103' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
/****** Object:  Index [FK_Booking_Company_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Company_idx] ON [dbo].[BookingMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Package_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Package_ID_idx] ON [dbo].[BookingMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Test_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Test_ID_idx] ON [dbo].[BookingMaster]
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Curriculam_CourseMaster_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Curriculam_CourseMaster_ID_idx] ON [dbo].[CourseCurriculum]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Eligibility_Course_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Eligibility_Course_ID_idx] ON [dbo].[CourseEligibility]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Course_Company_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Course_Company_ID_idx] ON [dbo].[CourseMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Doctor]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Doctor] ON [dbo].[DoctorAppointment]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Hospital_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Hospital_idx] ON [dbo].[DoctorAppointment]
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_DoctorAppointment_Company_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_DoctorAppointment_Company_idx] ON [dbo].[DoctorAppointment]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Doctor_Speciality_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Doctor_Speciality_ID_idx] ON [dbo].[DoctorMaster]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_HealthServiceMaster_Company_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_HealthServiceMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageCategory_Company_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_PackageCategory_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageMaster_Company_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_PackageMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Docotr_Specialities_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Docotr_Specialities_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Specialites+Doctor_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Specialites+Doctor_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email_UNIQUE]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email_UNIQUE] ON [dbo].[JobApplication]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Catg_Name_UNIQUE]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Catg_Name_UNIQUE] ON [dbo].[PackageCategory]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_package_catg_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [fk_package_catg_ID_idx] ON [dbo].[PackageMaster]
(
	[CatgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Package_Comapny_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Package_Comapny_ID_idx] ON [dbo].[PackageMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Name_UNIQUE]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Name_UNIQUE] ON [dbo].[PackageMaster]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Speciality_Company_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_Speciality_Company_ID_idx] ON [dbo].[SpecialityMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCources_Company_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_SubCources_Company_ID_idx] ON [dbo].[SubCourses]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCourses_Course_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_SubCourses_Course_ID_idx] ON [dbo].[SubCourses]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_TestMaster_Company_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [FK_TestMaster_Company_ID_idx] ON [dbo].[TestMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_tests_packages_ID_idx]    Script Date: 29-Jun-20 1:05:08 AM ******/
CREATE NONCLUSTERED INDEX [fk_tests_packages_ID_idx] ON [dbo].[TestMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FileName_UNIQUE]    Script Date: 29-Jun-20 1:05:08 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SPCheckAuthentication]    Script Date: 29-Jun-20 1:05:08 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SPGetLoginDetails]    Script Date: 29-Jun-20 1:05:08 AM ******/
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
