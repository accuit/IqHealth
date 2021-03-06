USE [master]
GO
/****** Object:  Database [HIQAdmin]    Script Date: 08/09/2020 19:04:15 ******/
CREATE DATABASE [HIQAdmin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HIQAdmin', FILENAME = N'E:\MSSQL.MSSQLSERVER\DATA\HIQAdmin.mdf' , SIZE = 9536KB , MAXSIZE = 204800KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HIQAdmin_log', FILENAME = N'D:\MSSQL.MSSQLSERVER\DATA\HIQAdmin_log.ldf' , SIZE = 4096KB , MAXSIZE = 102400KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [HIQAdmin] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HIQAdmin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HIQAdmin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HIQAdmin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HIQAdmin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HIQAdmin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HIQAdmin] SET ARITHABORT OFF 
GO
ALTER DATABASE [HIQAdmin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HIQAdmin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HIQAdmin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HIQAdmin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HIQAdmin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HIQAdmin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HIQAdmin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HIQAdmin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HIQAdmin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HIQAdmin] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HIQAdmin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HIQAdmin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HIQAdmin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HIQAdmin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HIQAdmin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HIQAdmin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HIQAdmin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HIQAdmin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HIQAdmin] SET  MULTI_USER 
GO
ALTER DATABASE [HIQAdmin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HIQAdmin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HIQAdmin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HIQAdmin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HIQAdmin] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HIQAdmin]
GO
/****** Object:  User [hiqadm]    Script Date: 08/09/2020 19:04:22 ******/
CREATE USER [hiqadm] FOR LOGIN [hiqadm] WITH DEFAULT_SCHEMA=[hiqadm]
GO
/****** Object:  User [admhiq]    Script Date: 08/09/2020 19:04:22 ******/
CREATE USER [admhiq] FOR LOGIN [admhiq] WITH DEFAULT_SCHEMA=[admhiq]
GO
/****** Object:  User [adm]    Script Date: 08/09/2020 19:04:22 ******/
CREATE USER [adm] FOR LOGIN [adm] WITH DEFAULT_SCHEMA=[adm]
GO
/****** Object:  DatabaseRole [gd_execprocs]    Script Date: 08/09/2020 19:04:23 ******/
CREATE ROLE [gd_execprocs]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [hiqadm]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [hiqadm]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [hiqadm]
GO
ALTER ROLE [db_datareader] ADD MEMBER [hiqadm]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [hiqadm]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admhiq]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admhiq]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admhiq]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admhiq]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admhiq]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [adm]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [adm]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [adm]
GO
ALTER ROLE [db_datareader] ADD MEMBER [adm]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [adm]
GO
/****** Object:  Schema [adm]    Script Date: 08/09/2020 19:04:24 ******/
CREATE SCHEMA [adm]
GO
/****** Object:  Schema [admhiq]    Script Date: 08/09/2020 19:04:24 ******/
CREATE SCHEMA [admhiq]
GO
/****** Object:  Schema [hiqadm]    Script Date: 08/09/2020 19:04:24 ******/
CREATE SCHEMA [hiqadm]
GO
/****** Object:  UserDefinedFunction [dbo].[DecryptStr]    Script Date: 08/09/2020 19:04:24 ******/
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
/****** Object:  Table [dbo].[AddressMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[BlogCategoryMapping]    Script Date: 08/09/2020 19:04:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategoryMapping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategoryMaster]    Script Date: 08/09/2020 19:04:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategoryMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Type] [int] NOT NULL,
	[BannerImage] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[CompanyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogMaster]    Script Date: 08/09/2020 19:04:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[SubTitle] [nvarchar](500) NULL,
	[PostDate] [datetime] NOT NULL,
	[BannerImage] [nvarchar](max) NULL,
	[ThumbImage] [nvarchar](max) NULL,
	[Sequence] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Tags] [nvarchar](max) NULL,
	[IsLive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[CommonSetup]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[ContactUsEnquiry]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[CorporateTieUpEnquiry]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[CourseCurriculum]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[CourseEligibility]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[CourseMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[DailyLoginHistory]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[DoctorAppointment]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[DoctorMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[DoctorSpecialities]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[EmailService]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[HealthServiceMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[HospitalMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[InvoiceItems]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[JobApplication]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[LoginAttemptHistory]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[ModuleMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[OnlineEnquiry]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[OrganizeCampEnquiry]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[OTPMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[PackageCategory]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[PackageMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[PartnerEnquiry]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[Permissions]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[RoleModule]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[SpecialityMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[StudentInvoice]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[StudentMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[SubCourses]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[SystemSettings]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[TestMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[UserDevices]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[UserMaster]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[UserReports]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[UserRoleModulePermission]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[UserRoles]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[UserServiceAccess]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Table [dbo].[UserSystemSettings]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  View [dbo].[vwGetUserRoleModule]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  Index [FK_Booking_Company_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Company_idx] ON [dbo].[BookingMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Package_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Package_ID_idx] ON [dbo].[BookingMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Test_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Test_ID_idx] ON [dbo].[BookingMaster]
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Curriculam_CourseMaster_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Curriculam_CourseMaster_ID_idx] ON [dbo].[CourseCurriculum]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Eligibility_Course_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Eligibility_Course_ID_idx] ON [dbo].[CourseEligibility]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Course_Company_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Course_Company_ID_idx] ON [dbo].[CourseMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Doctor]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Doctor] ON [dbo].[DoctorAppointment]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Hospital_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Hospital_idx] ON [dbo].[DoctorAppointment]
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_DoctorAppointment_Company_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_DoctorAppointment_Company_idx] ON [dbo].[DoctorAppointment]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Doctor_Speciality_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Doctor_Speciality_ID_idx] ON [dbo].[DoctorMaster]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_HealthServiceMaster_Company_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_HealthServiceMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageCategory_Company_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_PackageCategory_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageMaster_Company_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_PackageMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Docotr_Specialities_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Docotr_Specialities_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Specialites+Doctor_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Specialites+Doctor_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email_UNIQUE]    Script Date: 08/09/2020 19:04:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email_UNIQUE] ON [dbo].[JobApplication]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Catg_Name_UNIQUE]    Script Date: 08/09/2020 19:04:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Catg_Name_UNIQUE] ON [dbo].[PackageCategory]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_package_catg_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [fk_package_catg_ID_idx] ON [dbo].[PackageMaster]
(
	[CatgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Package_Comapny_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Package_Comapny_ID_idx] ON [dbo].[PackageMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Name_UNIQUE]    Script Date: 08/09/2020 19:04:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Name_UNIQUE] ON [dbo].[PackageMaster]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Speciality_Company_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_Speciality_Company_ID_idx] ON [dbo].[SpecialityMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCources_Company_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_SubCources_Company_ID_idx] ON [dbo].[SubCourses]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCourses_Course_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_SubCourses_Course_ID_idx] ON [dbo].[SubCourses]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_TestMaster_Company_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [FK_TestMaster_Company_ID_idx] ON [dbo].[TestMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_tests_packages_ID_idx]    Script Date: 08/09/2020 19:04:25 ******/
CREATE NONCLUSTERED INDEX [fk_tests_packages_ID_idx] ON [dbo].[TestMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [FileName_UNIQUE]    Script Date: 08/09/2020 19:04:25 ******/
CREATE UNIQUE NONCLUSTERED INDEX [FileName_UNIQUE] ON [dbo].[UserReports]
(
	[FileName] ASC
)
WHERE ([FileName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlogCategoryMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BlogCategoryMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BlogCategoryMaster] ADD  DEFAULT ((1)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[BlogMaster] ADD  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[BlogMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[BlogMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[BlogMaster] ADD  DEFAULT ((1)) FOR [CompanyID]
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
ALTER TABLE [dbo].[BlogCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_BCM_Blog] FOREIGN KEY([BlogID])
REFERENCES [dbo].[BlogMaster] ([ID])
GO
ALTER TABLE [dbo].[BlogCategoryMapping] CHECK CONSTRAINT [FK_BCM_Blog]
GO
ALTER TABLE [dbo].[BlogCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_BCM_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[BlogCategoryMaster] ([ID])
GO
ALTER TABLE [dbo].[BlogCategoryMapping] CHECK CONSTRAINT [FK_BCM_Category]
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
/****** Object:  StoredProcedure [dbo].[SPCheckAuthentication]    Script Date: 08/09/2020 19:04:25 ******/
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
/****** Object:  StoredProcedure [dbo].[SPGetLoginDetails]    Script Date: 08/09/2020 19:04:25 ******/
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
ALTER DATABASE [HIQAdmin] SET  READ_WRITE 
GO
