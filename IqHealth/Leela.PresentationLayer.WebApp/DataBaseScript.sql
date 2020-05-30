
/****** Object:  Table [dbo].[BookingMaster]    Script Date: 29-May-20 6:05:58 PM ******/
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
	[BookingTime] [nvarchar](25) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommonSetup]    Script Date: 29-May-20 6:05:58 PM ******/
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
	[CompanyID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 29-May-20 6:05:58 PM ******/
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
	[MapUrl] [nvarchar](1000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactUsEnquiry]    Script Date: 29-May-20 6:05:58 PM ******/
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
 CONSTRAINT [PK_ContactUsEnquiry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CorporateTieUpEnquiry]    Script Date: 29-May-20 6:05:59 PM ******/
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
 CONSTRAINT [PK_CorporateTieUpEnquiry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseCurriculum]    Script Date: 29-May-20 6:05:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCurriculum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CourseMasterID] [int] NOT NULL,
	[SubCourcesID] [int] NULL,
 CONSTRAINT [PK_CourseCurriculum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseEligibility]    Script Date: 29-May-20 6:05:59 PM ******/
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
 CONSTRAINT [PK_CourseEligibility] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseMaster]    Script Date: 29-May-20 6:05:59 PM ******/
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
 CONSTRAINT [PK_CourseMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorAppointment]    Script Date: 29-May-20 6:05:59 PM ******/
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
 CONSTRAINT [PK_DoctorAppointment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorMaster]    Script Date: 29-May-20 6:05:59 PM ******/
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
 CONSTRAINT [PK_DoctorMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorSpecialities]    Script Date: 29-May-20 6:05:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorSpecialities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NOT NULL,
	[SpecialityID] [int] NOT NULL,
 CONSTRAINT [PK_DoctorSpecialities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HealthServiceMaster]    Script Date: 29-May-20 6:05:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[ServiceCode] [varchar](5) NULL,
	[Title] [varchar](150) NULL,
 CONSTRAINT [PK_HSM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HospitalMaster]    Script Date: 29-May-20 6:05:59 PM ******/
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
 CONSTRAINT [PK_HospitalMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobApplication]    Script Date: 29-May-20 6:06:00 PM ******/
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
 CONSTRAINT [PK_JobApplication] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 29-May-20 6:06:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Password] [nvarchar](20) NOT NULL,
	[LastLoginDate] [datetime2](7) NULL,
	[LastLoginStatus] [int] NULL,
	[LoginDate] [datetime2](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OnlineEnquiry]    Script Date: 29-May-20 6:06:00 PM ******/
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
 CONSTRAINT [PK_OnlineEnquiry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrganizeCampEnquiry]    Script Date: 29-May-20 6:06:00 PM ******/
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
 CONSTRAINT [PK_OrganizeCampEnquiry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PackageCategory]    Script Date: 29-May-20 6:06:00 PM ******/
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
/****** Object:  Table [dbo].[PackageMaster]    Script Date: 29-May-20 6:06:00 PM ******/
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
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartnerEnquiry]    Script Date: 29-May-20 6:06:00 PM ******/
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
 CONSTRAINT [PK_PartnerEnquiry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceQuestions]    Script Date: 29-May-20 6:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceQuestions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Title] [varchar](500) NULL,
	[Answer] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](1000) NULL,
	[ServiceCode] [varchar](5) NULL,
	[ServiceID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpecialityMaster]    Script Date: 29-May-20 6:06:01 PM ******/
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
 CONSTRAINT [PK_SpecialityMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCourses]    Script Date: 29-May-20 6:06:01 PM ******/
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
	[CompanyID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestMaster]    Script Date: 29-May-20 6:06:01 PM ******/
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
 CONSTRAINT [PK_TestMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UploadedReports]    Script Date: 29-May-20 6:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadedReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[FilePath] [nvarchar](1000) NULL,
	[FileType] [int] NULL,
	[UploadedDate] [datetime2](7) NULL,
	[UploadedBy] [int] NOT NULL,
	[IsDeleted] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_UploadedReports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 29-May-20 6:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NOT NULL,
	[DateOfBirth] [date] NULL,
	[BloodGroup] [int] NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [int] NULL,
	[UserStatus] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[IsDeleted] [int] NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Mobile] [nvarchar](15) NULL,
	[UserType] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BookingMaster] ON 

INSERT [dbo].[BookingMaster] ([ID], [FirstName], [LastName], [Age], [Mobile], [Email], [Sex], [BookingDate], [CollectionType], [Address], [City], [Landmark], [PinCode], [CreatedDate], [IsDeleted], [Status], [PackageID], [TestID], [CompanyID], [BookingTime]) VALUES (44, N'Neeraj', N'Ajjyu', 6, N'09599660409', N'neer.s@outlook.com', 2, CAST(N'2020-05-13T00:00:00.0000000' AS DateTime2), 1, N'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West', N'1', N'uigkjb jgkj', N'201301', CAST(N'2020-05-13T15:36:55.0000000' AS DateTime2), 0, 1, 1, NULL, 1, N'8')
INSERT [dbo].[BookingMaster] ([ID], [FirstName], [LastName], [Age], [Mobile], [Email], [Sex], [BookingDate], [CollectionType], [Address], [City], [Landmark], [PinCode], [CreatedDate], [IsDeleted], [Status], [PackageID], [TestID], [CompanyID], [BookingTime]) VALUES (45, N'Neeraj', N'Ajjyu', 3, N'08527818810', N'singh.neer@ymail.com', 0, CAST(N'2020-05-21T00:00:00.0000000' AS DateTime2), 1, N'K-93, 2nd Floor,', N'1', N'uigkjb jgkj', N'110059', CAST(N'2020-05-13T16:48:35.0000000' AS DateTime2), 0, 1, 2, NULL, 1, N'23')
INSERT [dbo].[BookingMaster] ([ID], [FirstName], [LastName], [Age], [Mobile], [Email], [Sex], [BookingDate], [CollectionType], [Address], [City], [Landmark], [PinCode], [CreatedDate], [IsDeleted], [Status], [PackageID], [TestID], [CompanyID], [BookingTime]) VALUES (46, N'Neeraj', N'Singh', 122, N'08527818810', N'singh.neer@ymail.com', 1, CAST(N'2020-05-15T00:00:00.0000000' AS DateTime2), 1, N'K-93, 2nd Floor,', N'1', N'uigkjb jgkj', N'110059', CAST(N'2020-05-13T18:33:21.0000000' AS DateTime2), 0, 1, 2, NULL, 1, N'12:12')
INSERT [dbo].[BookingMaster] ([ID], [FirstName], [LastName], [Age], [Mobile], [Email], [Sex], [BookingDate], [CollectionType], [Address], [City], [Landmark], [PinCode], [CreatedDate], [IsDeleted], [Status], [PackageID], [TestID], [CompanyID], [BookingTime]) VALUES (47, N'Neeraj', N'Ajjyu', 21, N'08527818810', N'neer.s@outlook.com', 1, CAST(N'2020-05-28T00:00:00.0000000' AS DateTime2), 1, N'K-93, 2nd Floor,', N'2', N'uigkjb jgkj', N'110059', CAST(N'2020-05-24T17:26:49.4121600' AS DateTime2), 0, 1, 5, NULL, 1, N'12:12')
SET IDENTITY_INSERT [dbo].[BookingMaster] OFF
SET IDENTITY_INSERT [dbo].[CommonSetup] ON 

INSERT [dbo].[CommonSetup] ([ID], [MainType], [SubType], [DisplayText], [DisplayValue], [ParentID], [isDeleted], [CompanyID]) VALUES (1, N'User', N'Type', N'Customer', 1, NULL, 0, 2)
INSERT [dbo].[CommonSetup] ([ID], [MainType], [SubType], [DisplayText], [DisplayValue], [ParentID], [isDeleted], [CompanyID]) VALUES (2, N'User', N'Type', N'Employee', 2, NULL, 0, 2)
INSERT [dbo].[CommonSetup] ([ID], [MainType], [SubType], [DisplayText], [DisplayValue], [ParentID], [isDeleted], [CompanyID]) VALUES (3, N'User', N'Type', N'Student', 3, NULL, 0, 2)
SET IDENTITY_INSERT [dbo].[CommonSetup] OFF
SET IDENTITY_INSERT [dbo].[CompanyMaster] ON 

INSERT [dbo].[CompanyMaster] ([ID], [Name], [LogoUrl], [SecondryEmail], [PrimaryEmail], [Address], [BannerUrl], [About], [MapUrl]) VALUES (1, N'Leela Health Care', N'https://leelahealthcare.com/assets/img/leelahealthcare/LeelaHealthcare-logo.png', N'', N'info@leelahealthcare.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[CompanyMaster] ([ID], [Name], [LogoUrl], [SecondryEmail], [PrimaryEmail], [Address], [BannerUrl], [About], [MapUrl]) VALUES (2, N'Leela HealthCare', N'https://health-iq.in/assets/images/logo.jpg', N'', N'info@health-iq.in', NULL, NULL, NULL, NULL)
INSERT [dbo].[CompanyMaster] ([ID], [Name], [LogoUrl], [SecondryEmail], [PrimaryEmail], [Address], [BannerUrl], [About], [MapUrl]) VALUES (99, N'Anonymous', NULL, N'', N'', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CompanyMaster] OFF
SET IDENTITY_INSERT [dbo].[ContactUsEnquiry] ON 

INSERT [dbo].[ContactUsEnquiry] ([ID], [Name], [Mobile], [Email], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (71, N'Neeraj Singh', N'9599660409', N'neer.s@outlook.com', N'vc gnvgvhg vhjgv hvhgv hgvhgvgh v', CAST(N'2020-04-21T11:52:46.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[ContactUsEnquiry] ([ID], [Name], [Mobile], [Email], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (72, N'Neeraj Singh', N'0852781881', N'singh.neer@ymail.com', N'tsdgfcbv ', CAST(N'2020-05-03T20:57:25.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[ContactUsEnquiry] ([ID], [Name], [Mobile], [Email], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (73, N'Neeraj Singh', N'0852781881', N'singh.neer@ymail.com', N'vnhghjtfftghhhhh', CAST(N'2020-05-03T09:19:30.0000000' AS DateTime2), 0, 0, 2)
SET IDENTITY_INSERT [dbo].[ContactUsEnquiry] OFF
SET IDENTITY_INSERT [dbo].[CorporateTieUpEnquiry] ON 

INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (67, N'Neeraj Singh', N'08527818810', N'singh.neer@ymail.com', N'CAP Global', 3, NULL, 0, 0, N'nmnb mfb mnsb msdnb msnbg sdbfsdmn bsdfs', CAST(N'2020-03-28T20:20:00.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (68, N'Neeraj Singh', N'09599660409', N'neer19ultimate@gmail.com', N'CAP Global', 4, NULL, 0, 0, N'sdwd', CAST(N'2020-04-11T00:35:07.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (69, N'Neeraj Singh', N'08527818810', N'singh.neer@ymail.com', N'CAP Global', 1, NULL, 0, 0, N'chgvjhbknlm;lnbh gygjh klj', CAST(N'2020-04-11T01:02:56.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (70, N'Neeraj Singh', N'09599660409', N'neer.s@outlook.com', N'CAP Global', 1, NULL, 0, 0, N'h vvh jbjbjhb ', CAST(N'2020-04-11T01:12:00.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (71, N'Neeraj Singh', N'08527818810', N'singh.neer@ymail.com', N'MERCER', 2, NULL, 0, 0, N'hghg j jb', CAST(N'2020-04-10T13:45:16.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (72, N'Neeraj Singh', N'08527818810', N'neer.s@outlook.com', N'MERCER', 5, NULL, 0, 0, N'vdfg dfgdfg fd g', CAST(N'2020-04-10T13:57:43.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (73, N'Neeraj Singh', N'08527818810', N'singh.neer@ymail.com', N'CAP Global', 2, NULL, 0, 0, N'retxcfhgvj ,m', CAST(N'2020-04-10T14:37:28.0000000' AS DateTime2), 0, 0, 2)
INSERT [dbo].[CorporateTieUpEnquiry] ([ID], [Name], [Mobile], [Email], [CompanyName], [Designation], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (74, N'Neeraj Singh', N'0852781881', N'singh.neer@ymail.com', N'CAP Global', 3, NULL, 0, 0, N'cvgdfgfddfgg', CAST(N'2020-05-03T20:59:09.0000000' AS DateTime2), 0, 0, 2)
SET IDENTITY_INSERT [dbo].[CorporateTieUpEnquiry] OFF
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
SET IDENTITY_INSERT [dbo].[CourseMaster] ON 

INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (1, N'Medical Lab Technician', N'Medical Lab Technicians are important members of any clinical laboratory team. Medical Lab Technicians analyze fluid, tissues and blood samples to perform a variety of diagnoses. Additionally, students from this course are trained to clean and maintain lab equipment, manage biomedical waste and adhere to quality control standards as per the NABL regulations. They generally work under the supervision of a pathologist.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable', 17, 99, 2, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', 6, N'assets/images/academy/courses/1.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (2, N'Physiotherapy', N'Physiotherapists are trained professionals working in health care. They are trained to restore mobility, alleviate pain and suffering and work to prevent permanent disability in patients. The job of a physical therapist is preventive, restorative and rehabilitative.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable.', 17, 99, 2, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, N'assets/images/academy/courses/2.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (3, N'General Duty Assistant (Nursing)', N'This course trains students to work as nursing aides in hospitals and home care scenarios and they can also provide basic nursing care. They are taught to support nurses and also directly handle ill patients who are unable to look after themselves in both hospital and home care settings.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable.', 17, 30, 2, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', 6, N'assets/images/academy/courses/3.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (4, N'E.C.G. Technician', N'This course trains students in Emergency situation to detect whether the illness is due to Cardiac problem or else, Use of E.C.G. Machine of different makes & Models- Manual, Semi-Auto & Fully Auto, To carry out E.C.G. on pacemaker patient, Determination of heart beats, Axis, Cardiac Arrhythmias, Ventricular status, Interpretation of normal and abnormal E.C.G, Indication of E.C.G. recording, Requirement of Halter Study & Doppler study, TMT etc.', 0, 2, N'10th / Matric / Madhyamik passed', 18, 99, 1, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, N'assets/images/academy/courses/4.jpg')
INSERT [dbo].[CourseMaster] ([ID], [Name], [About], [IsDeleted], [CompanyID], [Qualification], [MinAge], [MaxAge], [Duration], [Certification], [InternshipDuration], [ImageUrl]) VALUES (5, N'Diet & Nutrition', N'The focus of the programme is to enable you to make the best possible choice for meeting the nutritional needs of your family. The student will learn various concepts in nutrition, the role of nutrients such as carbohydrates, lipids, proteins, vitamins, and minerals, including their sources, requirements, functions, and roles in health. It also includes guidelines for nutrition, dietary reference intakes, dietary guidelines for Indians, and basics of nutritional assessment methods.', 0, 2, N'10th / Madhyamik passed. 10+2 pass is preferable.', 18, 99, 1, N'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, N'assets/images/academy/courses/5.jpg')
SET IDENTITY_INSERT [dbo].[CourseMaster] OFF
SET IDENTITY_INSERT [dbo].[DoctorAppointment] ON 

INSERT [dbo].[DoctorAppointment] ([ID], [Name], [Age], [Mobile], [Email], [Sex], [BookingDate], [BookingTime], [DoctorID], [CreatedDate], [IsDeleted], [Status], [HospitalID], [CompanyID]) VALUES (42, N'neeraj', 46, N'9823923863', N'neer19ultimate@gmailcion', 1, CAST(N'2020-01-24T00:00:00.0000000' AS DateTime2), N'12:00 AM - 01:00 PM', 6, CAST(N'2020-01-20T23:27:58.0000000' AS DateTime2), 0, 1, NULL, NULL)
INSERT [dbo].[DoctorAppointment] ([ID], [Name], [Age], [Mobile], [Email], [Sex], [BookingDate], [BookingTime], [DoctorID], [CreatedDate], [IsDeleted], [Status], [HospitalID], [CompanyID]) VALUES (43, N'Neeraj', 54, N'8392983823', N'kbsdfksbdfk@kjaf.com', 1, CAST(N'2020-01-24T00:00:00.0000000' AS DateTime2), N'10:00 AM - 11:00 AM', 6, CAST(N'2020-01-20T23:29:06.0000000' AS DateTime2), 0, 1, NULL, NULL)
INSERT [dbo].[DoctorAppointment] ([ID], [Name], [Age], [Mobile], [Email], [Sex], [BookingDate], [BookingTime], [DoctorID], [CreatedDate], [IsDeleted], [Status], [HospitalID], [CompanyID]) VALUES (66, N'dtygu', 12, N'07696085020', N'parmanandsingh469@gmail.com', 1, CAST(N'2019-12-12T00:00:00.0000000' AS DateTime2), N'drg', 10, CAST(N'2020-03-15T04:11:36.0000000' AS DateTime2), 0, 1, NULL, 1)
INSERT [dbo].[DoctorAppointment] ([ID], [Name], [Age], [Mobile], [Email], [Sex], [BookingDate], [BookingTime], [DoctorID], [CreatedDate], [IsDeleted], [Status], [HospitalID], [CompanyID]) VALUES (85, N'Neeraj Singh', 34, N'08527818810', N'singh.neer@ymail.com', 2, CAST(N'2020-11-12T00:00:00.0000000' AS DateTime2), N'12:12', 4, CAST(N'2020-05-24T16:32:16.6929956' AS DateTime2), 0, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[DoctorAppointment] OFF
SET IDENTITY_INSERT [dbo].[DoctorMaster] ON 

INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (1, N'Trinath', N'Sarkar', CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), 10, N'Cardiology', N'../../assets/img/Doctors images/Dr.Trinath Sarkar.jpg', N'Calcutta Medical College Paramount Nursing Home', N'M.B.B.S. (Cal), M.D. (Cal), CCEBDM (IDF) ', 999, N'Member: - European Society of Cardiology', N'lnr-heart-pulse', 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), CAST(N'2019-08-03T01:40:14.0000000' AS DateTime2), N'9051672875', N'trinath_sarkar2004@yahoo.co.in', NULL, 4, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (2, N'Jayanta', N'Raja', NULL, 0, N'Cardiology', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', N' BM Birla Heart Research Centre Hindustan Health Point', N'M.B.B.S, D.CARD (CAL), DC.CM.A.F.I.C.A (USA)', 999, N'', N'lnr-Users', 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, N'033-2475 5390', N' drjrajani@yahoo.co.in', NULL, 4, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (3, N'Amit', N'Gupta', NULL, 0, N'Diabetese and Endocrinology', N'../../assets/img/Doctors images/Dr.Amit.jpg', N'Fellow Observer Critical Care & Chest Medicine(Johns Hopkins Hospital(USA)', N' M.D.,MRCP, FCGP, DFM(UK)  Dip. Diabetology (Chennai)', 999, N'', N'lnr-rocket', 1, CAST(N'2019-07-28T00:00:00.0000000' AS DateTime2), NULL, N'9830075316', N'', NULL, 8, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (4, N'Poulomi', N'Saha', NULL, 0, N'ENT Specialist', N'../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg', N'Faculty of WBMES', N'MBBS, MS', 4, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'8727072555', N'drpoulomisaha@gmail.com', NULL, 7, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (5, N'Ranajit', N'Bari', NULL, 0, N'Diabetes & Endocrinology Consultant', N'../../assets/img/Doctors images/DR.Ranajit Bari.jpg', N'Asst. Prof. R.G.Kar Medical College & Hospital', N'MBBS,MD,DM', 2, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9433360027', N'dr.ranajit@gmail.com', NULL, 8, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (6, N'Md Rahiul', N'Islam', NULL, 0, N'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist', N'../../assets/img/Doctors images/Dr.R Islam.jpg', N'                                                                                                  Chittaranjan Seva Sadan          ', N'MBBS,MD(CAL)', 1, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'7003258132', N'rahcnmc@gmail.com', NULL, 9, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (7, N'Tapas', N'Das', NULL, 0, N'Consultant Physiotherapist', N'../../assets/img/Doctors images/Dr.Tapas Das.jpg', N'Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)', N'Phd,M.Sc, Sports and Allied Science,', 6, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9831020106', N'tapasdas76@yahoo.co.in', NULL, 12, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (8, N'Soumyendra Nath', N'Mitra', NULL, 0, N'General Physician', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', N'Ex-Resident Surgeon Marwari Relief Society Hospital,Kolkata	                                Medical Superitendent Apollo Nursing Home,Kolkata', N'Bsc.(Hons.),M.B.B.S', 999, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9830243153', NULL, NULL, 1, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (9, N'Nilima', N'Tudu', NULL, 0, N'Gynaecologist', N'../../assets/img/Doctors images/Dr.Nilima Tudu.jpg', N'                                                                                                                 Belle Vue Clinic        ', N'MBBS(Cal), Dgo(Cal)', 999, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9883118528', N'nilima.tudu14@gmail.com', NULL, 11, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (10, N'Paushali', N'Sanyal', NULL, 0, N'Consultant Gynaecologist & Obstetrician', N'../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg', N' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ', N'MBBS,MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG(London), FMAS', 5, NULL, NULL, 0, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9830279680', N'poushali.sanyal@yahoo.co.in', NULL, 11, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (12, N'Sajeev', N'Shekhar', NULL, 0, N'Consultant Orthopaedic Surgeon', N'../../assets/img/Doctors images/Sajeeve.jpg', N'IPGMER & SSKM Hospital', N'MBBS,MS', 3, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'8197420121', N'sajshekh@hotmail.com', NULL, 10, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (13, N'Robin', N'Kumar', NULL, 0, N'Consultant Chest Physician', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', N'MBBS,MRCHCH(I)', N'MBBS,MRCHCH(I)', 999, NULL, NULL, 0, CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (14, N'Pallabi', N'Chatterjee', NULL, 0, N'Nutrition Dietitian', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', NULL, N'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),', 999, NULL, NULL, 0, CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 13, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (15, N'OPD', N'', NULL, 0, N'OPD', NULL, N'OPD', NULL, 999, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 1, NULL, 1)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (16, N'Sabyasachi', N'Sarkar', NULL, 0, N'Consultant Gynaecologist & Obstetrician', N'../../assets/img/Doctors images/Dr.R Islam.jpg', N'                                                                                                  Chittaranjan Seva Sadan          ', N'MBBS,MS(G &O)', 6, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'7003258132', N'rahcnmc@gmail.com', NULL, 9, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (17, N'Suvendu', N'Maji', NULL, 0, N'General Surgery & Oncology Consultant', N'../../assets/img/Doctors images/DR.Ranajit Bari.jpg', N'Asst. Prof. R.G.Kar Medical College & Hospital', N'MBBS,MS(GEN SURG),DNB(Onco)', 2, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9433360027', N'dr.ranajit@gmail.com', NULL, 8, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (18, N'Poulomi', N'Saha', NULL, 0, N'ENT Specialist', N'../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg', N'Faculty of WBMES', N'MBBS, MS', 4, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'8727072555', N'drpoulomisaha@gmail.com', NULL, 7, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (19, N'Ranajit ', N'Bari', NULL, 0, N'Diabetes & Endocrinology Consultant', N'../../assets/img/Doctors images/DR.Ranajit Bari.jpg', N'Asst. Prof. R.G.Kar Medical College & Hospital', N'MBBS,MD,DM', 2, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9433360027', N'dr.ranajit@gmail.com', NULL, 8, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (20, N'Md Rahiul ', N'Islam', NULL, 0, N'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist', N'../../assets/img/Doctors images/Dr.R Islam.jpg', N'                                                                                                  Chittaranjan Seva Sadan          ', N'MBBS,MD(CAL)', 1, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'7003258132', N'rahcnmc@gmail.com', NULL, 9, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (21, N'Tapas ', N'Das', NULL, 0, N'Consultant Physiotherapist', N'../../assets/img/Doctors images/Dr.Tapas Das.jpg', N'Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)', N'Phd, M.Sc, Sports and Allied Science,', 6, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9831020106', N'tapasdas76@yahoo.co.in', NULL, 12, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (22, N'Paushali ', N'Sanyal', NULL, 0, N'Consultant Gynaecologist & Obstetrician', N'../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg', N' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ', N'MBBS, MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG (London),  FMAS', 5, NULL, NULL, 1, CAST(N'2019-08-08T00:00:00.0000000' AS DateTime2), NULL, N'9830279680', N'poushali.sanyal@yahoo.co.in', NULL, 11, NULL, 2)
INSERT [dbo].[DoctorMaster] ([ID], [FirstName], [LastName], [DateOfBirth], [Experience], [Specialist], [ImageUrl], [Hospital], [Designation], [Sequence], [About], [LogoUrl], [IsDeleted], [CreatedDate], [UpdatedDate], [Mobile], [Email], [RegistrationNo], [SpecialityID], [HospitalID], [CompanyID]) VALUES (23, N'Pallabi', N'Chatterjee', NULL, 0, N'Nutrition Dietitian', N'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', NULL, N'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),', 999, NULL, NULL, 1, CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, N'', NULL, NULL, 13, NULL, 1)
SET IDENTITY_INSERT [dbo].[DoctorMaster] OFF
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
SET IDENTITY_INSERT [dbo].[HealthServiceMaster] ON 

INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (1, N'Pathology', N'Leela HealthCare basically aims at improving lifeâ€™s of others. In terms of pathology, it is a medical specialty that determines the cause and nature of diseases by examining and testing body tissues (from biopsies and pap smears, for example) and bodily fluids (from samples including blood and urine). The results from these pathology tests help Doctors diagnose and treat patients correctly. Basically, an integral part of clinical diagnosis', N'../../assets/img/services images/pathology .jpg', N'page3 url (if any)', CAST(N'2016-03-22T09:27:52.0000000' AS DateTime2), CAST(N'2019-08-03T12:17:18.0000000' AS DateTime2), 0, 0, N'Biochemistry,Clinical Pathology,Cytopathology,Haematology, Immunology, Molecular Biology, Molecular Genetics, Serology', 2, N'101', N'Pathology')
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (2, N'Cardiology', N'Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart. It deals with the diagnosis and treatment of such conditions as congenital heart defects, coronary artery disease, electrophysiology, heart failure and heart disease. Subspecialties of the cardiology field include cardiac electrophysiology, echocardiography, interventional cardiology and nuclear cardiology', N'../../assets/img/services images/cardiology.jpg', N'page3 url (if any)', CAST(N'2019-07-29T09:27:52.0000000' AS DateTime2), CAST(N'2019-08-03T12:16:24.0000000' AS DateTime2), 0, 0, N'ECG, Holter monitoring, BP monitoring', 2, N'102', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (3, N'Spirometry', N'Spirometry (spy-ROM-uh-tree) is a common office test used to assess how well your lungs work by measuring how much air you inhale, how much you exhale and how quickly you exhale.Spirometry is used to diagnose asthma, chronic obstructive pulmonary disease (COPD) and other conditions that affect breathing. Spirometry may also be used periodically to monitor your lung condition and check whether a treatment for a chronic lung condition is helping you breathe better.', N'../../assets/img/services images/spirometry.jpg', N'page3 url (if any)', CAST(N'2019-07-29T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2, N'103', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (4, N'Neurology', N'Neurology is a branch of medicine dealing with disorders of the nervous system. Neurology deals with the diagnosis and treatment of all categories of conditions and disease involving the central and peripheral nervous systems, including their coverings, blood vessels, and all effector tissue, such as muscle.', N'../../assets/img/services images/Neurology.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'NCV Study,  EMG Study , EEG ,BLINK REFLEX    ,VEP Study ,BAER Study  ,SSEP Study  ', 2, N'104', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (5, N'Gynae Care', N'Gynaecare clinic offers a comprehensive range of treatments with complete scientific solutions for infertility and sexual disfunctions. Our dedicated team of doctors personally interact with the patients , answer their queries and decide on the treatment accordingly. We offer the best services in fertility and reproductive medicine. Some of the services offered at our clinic are:', N'../../assets/img/services images/gynae-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'Pre & post-natal check up,Laproscopic surgeries, Hysterectomy,Measures for Family Planning, Abnormal bleeding problems, Treatment for Hormonal Imbalance, Blood Tests, IVF or In Vitro Fertilization, Infertility work up, IUI or Intrauterine Insemination,
 Safe medical termination of pregnancy (abortion).
', 2, N'105', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (6, N'Child Care Clinic', N'Childcare clinic offers a comprehensive range of treatments with complete solutions for Child. Our experienced team of Paediatricians caters to the Medical Needs of Newborns, Toddlers, Teenagers and Adolescents., answer their queries and decide on the treatment accordingly. We offer the best services in Paedtrics. Some of the services offered at our clinic are', N'../../assets/img/services images/child-care-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'Neonatology
,Paedtric Intensivist', 2, N'106', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (7, N'Diabetes Care Clinic', N'Diabetes is a hassle-some disease. At Leela HealthCare, we take the stress out of diabetes. We provide everything a diabetic might need, under one roof. Right from diagnosis to speaking to a dietician, educator, diabetologist. As a patient, you donâ€™t have to keep going from pillar to post. We help patients manage Type 1, 2, gestational or prediabetes. Our evaluations, physical exams and treatments are geared to detect and prevent complications brought on by the disease. Our medical team can help you create routines for nutrition and exercise to prevent diabetes if you are prediabetes. For some type 2 patients, we may be able to control diabetes without medication through weight loss, diet and exercise. Our goal is to provide the best possible solution for your particular diagnosis. There are many ways to treat diabetes. Our doctors gives you options and works with you to design a plan that fits your lifestyle so you can successfully live with diabetes. Along with diet, exercise, oral medications, insulin and non-insulin injections, we also have expertise in insulin pump and continuous glucose monitoring.', N'../../assets/img/services images/diabetes-.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2, N'107', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (8, N'Endrocrinology', N'The department of endocrinology at  Leela HealthCare offers the best treatment modalities available for endocrine disorders to provide accurate and comprehensive care for its patients suffering from various endocrine diseases.
', N'../../assets/img/services images/endrocrinology.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2, N'108', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (9, N'Ortho Clinic', N'The department of orthopaedic at Leela HealthCare offers the best treatment modalities available for ortho ailments to provide accurate and comprehensive care for its patients suffering from various ortho problems. In addition, efficient occupational therapists, physiotherapists and pain management experts work towards the quick rehabilitation of the patient leading to a better quality of life', N'../../assets/img/services images/ortho-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2, N'109', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (10, N'Physiotherapy', N'Physiotherapy is a health science that aims in rehabilitation and enhance individuals with movement chaos by utilizing evidence-based, natural process like motivation, exercise, education, advocacy and adapted tools. Physiotherapists study subjects like neuroscience,physiology and anatomy for developing attitudes and skills that are very much required for health prevention, education, rehabilitation and treatment of the patients with disabilities and physical ailments.It is sad to say that there are still many educated people in India who think that physiotherapy is only related to a few exercises. Physiotherapy is a science in itself. One might be suffering from cardiopulmonary ,orthopaedic, paediatric, neurology, sports injury, congenital abnormality, to name a few, where physical management becomes as a essential part of the rehabilitation process and some times is the only process. 
<br> <br><p><strong> Why physiotherapy at Leela HealthCare? </strong> <br> At Leela HealthCare our clinic run by experienced team of doctors and paramedics.  We have all type modern Electrotherapy equipments,exercise Theraphy,Manual Theraphy,here patient can get Acupuncture Treatment facility also apart with these. We basically try to alleviate the pain through various modern techniques or tools that can be used by the experience team of doctors and paramedics.</p>', N'../../assets/img/services images/physiotherapy.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2, N'110', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (11, N'Pain Clinic', N'We provide pain management services for diagnosis and treatment for painful conditions.We treat back pain, knee pain, headache, neck pain and cancer pain etc.... due to slipped disc, migraine, Cluster Headacheï»¿, trigeminal neuralgia, arthritis, spondylitis, cancer etc. We use most advanced interventional pain management methods...like radio-frequency ablation, spinal cord stimulation, Percutaneous Discectomy, vertebroplasty, Epidural steroid injections, Epiduroscopy, Ozone Necleolysis, Platelet Rich Plasma (PRP)ï»¿ Therapy etc.', N'../../assets/img/services images/pain-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'IFT,Laser Therapy,Tens,Acupuncture/Dry Needling,Electro acupuncture,Ultrasonic therapy,Diapulse /SWD,Electro stimulators,Neuromuscular stimulations,Electronic tractions,Manual Therapy/Manupulataion,Taping Techniques
 "', 2, N'111', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (12, N'Sports Medicine', N'Sports Medicine is an integral part of modern medicine. Sports Medicine practitioners deal with human fitness and conditioning related to performance, different types of injuries including sports injuries, rehabilitation, pain and weaknesses arising out of different kinds of injuries and diseases The GOAL of Sports Medicine is to prevent injuries, to improve bodily functions and movements and to treat pain in the shortest possible time and with minimum use of medicines. Sports Medicine Therapy requires specific infrastructure including modern Physiotherapy and modern gadgets and also a team of qualified and dedicated experts from different branches of sports sciences. ', N'../../assets/img/services images/Sports-Medicine.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2, N'112', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (13, N'Nutrition / Dietician', N'Dietetics is about healthy eating practices which act as a preventive and curative means and pave the foundation for a healthier life. At  Leela HealthCare, we regularly counsel our patients about a nutritious, balanced diet that consists of carbohydrates, fats, proteins, minerals, vitamins and electrolytes for their general well-being. Good nutrition is essential for normal organ development and function, normal reproduction, growth and maintenance of muscles and tissue, optimum activity and working efficiency, building resistance to infection and in repairing body damage or injury. The Nutrition and Dietetics team at Leela HealthCare aims to improve the clinical, biochemical, cellular and psychological status of individuals experiencing complications or side effects of various treatments by providing adequate nutrition and related information.', N'../../assets/img/services images/nutrition-dietician.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, 2, N'113', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (18, N'Gynae Care', N'Gynaecare clinic offers a comprehensive range of treatments with complete scientific solutions for infertility and sexual disfunctions. Our dedicated team of doctors personally interact with the patients , answer their queries and decide on the treatment accordingly. We offer the best services in fertility and reproductive medicine. Some of the services offered at our clinic are:', N'../../assets/img/services images/gynae-clinic.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, N'Pre & post-natal check up,Laproscopic surgeries, Hysterectomy,Measures for Family Planning, Abnormal bleeding problems, Treatment for Hormonal Imbalance, Blood Tests, IVF or In Vitro Fertilization, Infertility work up, IUI or Intrauterine Insemination,
 Safe medical termination of pregnancy (abortion).
', NULL, N'118', NULL)
INSERT [dbo].[HealthServiceMaster] ([ID], [Name], [Description], [ImageUrl], [PageUrl], [CreatedDate], [UpdatedDate], [IsDeleted], [Type], [ServicesIncluded], [CompanyID], [ServiceCode], [Title]) VALUES (21, N'Endrocrinology', N'The department of endocrinology at  Leela Healthcare offers the best treatment modalities available for endocrine disorders to provide accurate and comprehensive care for its patients suffering from various endocrine diseases.
', N'../../assets/img/services images/endrocrinology.jpg', NULL, CAST(N'2019-08-08T09:27:52.0000000' AS DateTime2), NULL, 0, 0, NULL, NULL, N'121', NULL)
SET IDENTITY_INSERT [dbo].[HealthServiceMaster] OFF
SET IDENTITY_INSERT [dbo].[JobApplication] ON 

INSERT [dbo].[JobApplication] ([ID], [FirstName], [LastName], [Email], [Phone], [Address], [City], [ZipCode], [ResumeText], [ResumePath], [CreatedDate], [CompanyID]) VALUES (16, N'Neeraj', N'Singh', N'neer.s@outlook.com', N'9599660409', NULL, N'Noida', NULL, NULL, N'C:\PROJECTS\IQHealth\IqHealth\IqHealth.WebApi\Content\Resumes\9599660409_neer.s@outlook.com.pdf', CAST(N'2020-04-22T00:13:32.0000000' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[JobApplication] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [UserID], [Password], [LastLoginDate], [LastLoginStatus], [LoginDate]) VALUES (1, 1, N'Krishna_2012', CAST(N'2019-07-25T00:00:00.0000000' AS DateTime2), 1, CAST(N'2019-07-25T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[OnlineEnquiry] ON 

INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (42, 2, 1, N'Akash', N'akash.shil15@nshm.edu.in', N'7908181407', NULL, N'Enquiry For Courses.', N'I ', 0, N'', N'', N'', N'', 1, N'', 0, 2, CAST(N'2020-03-31T07:29:49.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (43, 2, 1, N'Akash', N'akashshil123@gmail.com', N'8083336401', NULL, N'Enquiry For Courses.', N'dmlt', 0, N'', N'k', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-05T06:51:59.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (54, 2, 3, N'Akash', N'akashshil.15@nshm.edu.in', N'7908181407', NULL, N'Enquiry For Courses.', N'sbahgsh', 0, N'', N'kOlatata', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-08T08:22:44.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (55, 2, 8, N'Biplab Roy', N'Biplab.arambagh@gmail.com', N'9609651043', NULL, N'Enquiry For Courses.', N'Course details', 0, N'', N'Kolkata', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-09T05:39:03.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (56, 2, 1, N'Imtiaz Ahmed ', N'Imtiazcool93@gmail.com', N'8585045459', NULL, N'Enquiry For Courses.', N'I want to know the course details,  fee structure and about placement', 0, N'', N'Kolkata', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-09T21:33:59.0000000' AS DateTime2))
INSERT [dbo].[OnlineEnquiry] ([ID], [Type], [TypeValue], [Name], [Email], [Phone], [AltPhone], [Subject], [Message], [Status], [Address], [Place], [City], [State], [Country], [CaptchaText], [CaptchaVerified], [CompanyID], [CreatedDate]) VALUES (57, 2, 8, N'Jyotirmay Banerjee', N'dr.jyotirmay1987@gmail.com', N'9434387646', NULL, N'Enquiry For Courses.', N'Details of course 
Online possible?? ', 0, N'', N'Bardhaman ', N'', N'', 1, N'', 0, 2, CAST(N'2020-05-10T05:52:49.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[OnlineEnquiry] OFF
SET IDENTITY_INSERT [dbo].[OrganizeCampEnquiry] ON 

INSERT [dbo].[OrganizeCampEnquiry] ([ID], [Name], [Mobile], [Email], [ExpectedCount], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (70, N'Neeraj Singh', N'0852781881', N'singh.neer@ymail.com', 22, N'CAP Global', 2, 0, NULL, CAST(N'2020-05-03T20:59:51.0000000' AS DateTime2), 0, 0, 2)
SET IDENTITY_INSERT [dbo].[OrganizeCampEnquiry] OFF
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
SET IDENTITY_INSERT [dbo].[PartnerEnquiry] ON 

INSERT [dbo].[PartnerEnquiry] ([ID], [Name], [Mobile], [Email], [Address], [City], [State], [Message], [CreatedDate], [IsDeleted], [Status], [CompanyID]) VALUES (72, N'Neeraj Singh', N'0852781881', N'singh.neer@ymail.com', N'K-93, 2nd Floor,', 2, NULL, NULL, CAST(N'2020-05-03T20:58:34.0000000' AS DateTime2), 0, 0, 2)
SET IDENTITY_INSERT [dbo].[PartnerEnquiry] OFF
SET IDENTITY_INSERT [dbo].[ServiceQuestions] ON 

INSERT [dbo].[ServiceQuestions] ([ID], [Name], [Title], [Answer], [ImageUrl], [ServiceCode], [ServiceID]) VALUES (1, N'Why Pathology', N'Why is Pathology Important', N'<p>
Pathology is a branch of modern medicine which is concerned with diagnosis, prognosis and follow up of a patient. It deals with causation of disease(oetiology),its morphological appearances(gross and microscopic) before,during and after the disease process(morphology).It also encompasses the methods and techniques in the laboratory with its finer details(lab diagnosis). It also predicts the progress of disease with or without treatment(prognostication).Pathology(systematic study of disease) includes prediction of complications and their effects in the disease process.
</p>
<p>
Pathology is the study of Disease. So whenever you feel unhealthy, you need to go for a blood test or any body fluid test. Symptoms are sometimes not enough to make any clinical decision for a doctor, thus to confirm any disease presence, clinician needs a confirmation before starting any therapy.
</p>
', NULL, NULL, NULL)
INSERT [dbo].[ServiceQuestions] ([ID], [Name], [Title], [Answer], [ImageUrl], [ServiceCode], [ServiceID]) VALUES (2, N'Heart Disease', N'Heart disease: what are the symptoms?', N'Pathologu', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ServiceQuestions] OFF
SET IDENTITY_INSERT [dbo].[SpecialityMaster] ON 

INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (1, N'General Physician', N'General Physician', 0, N'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (2, N'Laproscopic Surgery', N'Laproscopic Surgery', 1, N'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (3, N'Audiology', N'Audiology and Speech Therepy', 1, N'../../assets/img/packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (4, N'Cardiology', N'Cardiology (Heart)', 0, N'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (5, N'Cardiac Surgery', N'Cardiac Surgery (Heart)', 1, N'../../assets/img/packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (6, N'Endocrinologist', N'Endocrinologist', 1, N'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (7, N'ENT', N'Ear Nose Tounge', 0, N'../../assets/img/packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (8, N'Diabetes', N'Diabetes & Endocrinology', 0, N'https://downloads.healthcatalyst.com/wp-content/uploads/2016/12/diabetes-care.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (9, N'Pediatric', N'Paediatric/Paediatric Intensivist', 0, N'../../assets/img/packages/cardiac.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (10, N'Orthopaedic', N'Orthopaedic', 0, N'https://media.istockphoto.com/photos/radiologist-doctor-with-digital-tablet-checking-xray-healthcare-and-picture-id649856016?k=6&m=649856016&s=612x612&w=0&h=kzoxnRizg4drZo0ns47rB45QbgErsUBrSh-ZfGIjs3A=', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (11, N'Gynaecologist', N'Gynaecologist & Obstetrician', 0, N'https://www.mdoctorshub.com/wp-content/uploads/2017/04/1.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (12, N'Physiotherapist', N'Physiotherapist', 0, N'https://thumbs.dreamstime.com/b/young-woman-wearing-brace-rehabilitation-her-physiotherapist-women-horizontal-view-129652970.jpg', NULL, 99)
INSERT [dbo].[SpecialityMaster] ([ID], [Speciality], [Title], [IsDeleted], [ImageUrl], [LogoUrl], [CompanyID]) VALUES (13, N'Nutrition', N'Nutrition/ Dietitian', 0, N'https://image.shutterstock.com/image-photo/young-asian-dietician-nutritionist-holding-260nw-1311225152.jpg', NULL, 99)
SET IDENTITY_INSERT [dbo].[SpecialityMaster] OFF
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
SET IDENTITY_INSERT [dbo].[UploadedReports] ON 

INSERT [dbo].[UploadedReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (1, 2, N'adharx.pdf', N'C:\PROJECTS\IQHealth\IqHealth\IqHealth.WebApi\Content\DiagnosticReports\2/adharx.pdf', 1, CAST(N'2020-02-27T21:54:55.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UploadedReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (2, 2, N'Appoitent.pdf', N'C:\PROJECTS\IQHealth\IqHealth\IqHealth.WebApi\Content\DiagnosticReports\2/Appoitent.pdf', 1, CAST(N'2020-02-27T21:57:21.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UploadedReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (3, 2, N'getPolicyCopB.pdf', N'getPolicyCopB.pdf', 1, CAST(N'2020-02-27T10:42:02.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UploadedReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (4, 2, N'adharx (1).pdf', N'adharx (1).pdf', 1, CAST(N'2020-02-27T10:42:44.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UploadedReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (5, 2, N'0_01042008-AnnexureI.pdf', N'0_01042008-AnnexureI.pdf', 1, CAST(N'2020-04-09T23:43:41.0000000' AS DateTime2), 1, 0, 2)
INSERT [dbo].[UploadedReports] ([ID], [UserID], [FileName], [FilePath], [FileType], [UploadedDate], [UploadedBy], [IsDeleted], [CompanyID]) VALUES (6, 2, N'1042008-AnnexureI.pdf', N'1042008-AnnexureI.pdf', 1, CAST(N'2020-04-09T23:51:15.0000000' AS DateTime2), 1, 0, 2)
SET IDENTITY_INSERT [dbo].[UploadedReports] OFF
SET IDENTITY_INSERT [dbo].[UserMaster] ON 

INSERT [dbo].[UserMaster] ([ID], [FirstName], [LastName], [UserName], [Email], [DateOfBirth], [BloodGroup], [Address], [City], [State], [UserStatus], [CreatedDate], [UpdatedDate], [IsDeleted], [Password], [Mobile], [UserType], [CompanyID]) VALUES (1, N'Neeraj', N'Singh', NULL, N'employee@gmail.com', NULL, NULL, N'K-93, 2nd Floor, y fyu gjgg j', N'New Delhi', 20, 0, CAST(N'2020-02-27T18:52:13.0000000' AS DateTime2), NULL, 0, N'Krishna_2012', N'54354254545354', 3, 2)
INSERT [dbo].[UserMaster] ([ID], [FirstName], [LastName], [UserName], [Email], [DateOfBirth], [BloodGroup], [Address], [City], [State], [UserStatus], [CreatedDate], [UpdatedDate], [IsDeleted], [Password], [Mobile], [UserType], [CompanyID]) VALUES (2, N'Customer', N'Singh', NULL, N'customer@gmail.com', NULL, NULL, N'K-93, 2nd Floor,', N'New Delhi', 29, 0, CAST(N'2020-02-27T18:54:40.0000000' AS DateTime2), NULL, 0, N'123456', N'9898987675', 1, 2)
INSERT [dbo].[UserMaster] ([ID], [FirstName], [LastName], [UserName], [Email], [DateOfBirth], [BloodGroup], [Address], [City], [State], [UserStatus], [CreatedDate], [UpdatedDate], [IsDeleted], [Password], [Mobile], [UserType], [CompanyID]) VALUES (3, N'Rousan', N'Alam', NULL, N'rousangitaldaha@gmail.com', NULL, NULL, N'Vill-Ghughumari, P. O- Gitaldaha, p. S- Dinhata', N'Dinhata', 36, 0, CAST(N'2020-05-09T22:23:27.0000000' AS DateTime2), NULL, 0, N'Rousan@2240', N'7478462240', 2, 2)
SET IDENTITY_INSERT [dbo].[UserMaster] OFF
/****** Object:  Index [PRIMARY]    Script Date: 29-May-20 6:06:01 PM ******/
ALTER TABLE [dbo].[BookingMaster] ADD  CONSTRAINT [PRIMARY] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Company_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Company_idx] ON [dbo].[BookingMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Package_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Package_ID_idx] ON [dbo].[BookingMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Booking_Test_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Booking_Test_ID_idx] ON [dbo].[BookingMaster]
(
	[TestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Curriculam_CourseMaster_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Curriculam_CourseMaster_ID_idx] ON [dbo].[CourseCurriculum]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Eligibility_Course_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Eligibility_Course_ID_idx] ON [dbo].[CourseEligibility]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Course_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Course_Company_ID_idx] ON [dbo].[CourseMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Doctor]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Doctor] ON [dbo].[DoctorAppointment]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Appointment_Hospital_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Appointment_Hospital_idx] ON [dbo].[DoctorAppointment]
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_DoctorAppointment_Company_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_DoctorAppointment_Company_idx] ON [dbo].[DoctorAppointment]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Doctor_Speciality_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Doctor_Speciality_ID_idx] ON [dbo].[DoctorMaster]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_HealthServiceMaster_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_HealthServiceMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageCategory_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_PackageCategory_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_PackageMaster_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_PackageMaster_Company_ID_idx] ON [dbo].[DoctorMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Docotr_Specialities_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Docotr_Specialities_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Specialites+Doctor_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Specialites+Doctor_ID_idx] ON [dbo].[DoctorSpecialities]
(
	[SpecialityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Email_UNIQUE]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email_UNIQUE] ON [dbo].[JobApplication]
(
	[Email] ASC
)
WHERE ([Email] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_ID_Login_User]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_ID_Login_User] ON [dbo].[Login]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Catg_Name_UNIQUE]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Catg_Name_UNIQUE] ON [dbo].[PackageCategory]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_package_catg_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [fk_package_catg_ID_idx] ON [dbo].[PackageMaster]
(
	[CatgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Package_Comapny_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Package_Comapny_ID_idx] ON [dbo].[PackageMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Name_UNIQUE]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Name_UNIQUE] ON [dbo].[PackageMaster]
(
	[Name] ASC
)
WHERE ([Name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Speciality_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_Speciality_Company_ID_idx] ON [dbo].[SpecialityMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCources_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_SubCources_Company_ID_idx] ON [dbo].[SubCourses]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_SubCourses_Course_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_SubCourses_Course_ID_idx] ON [dbo].[SubCourses]
(
	[CourseMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_TestMaster_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_TestMaster_Company_ID_idx] ON [dbo].[TestMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_tests_packages_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [fk_tests_packages_ID_idx] ON [dbo].[TestMaster]
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [FileName_UNIQUE]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [FileName_UNIQUE] ON [dbo].[UploadedReports]
(
	[FileName] ASC
)
WHERE ([FileName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_User_Company_ID_idx]    Script Date: 29-May-20 6:06:01 PM ******/
CREATE NONCLUSTERED INDEX [FK_User_Company_ID_idx] ON [dbo].[UserMaster]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[JobApplication] ADD  DEFAULT ((99)) FOR [CompanyID]
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
ALTER TABLE [dbo].[SpecialityMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SpecialityMaster] ADD  DEFAULT ('../../assets/img/h-packages/cardiac.jpg') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[SpecialityMaster] ADD  DEFAULT ((99)) FOR [CompanyID]
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
ALTER TABLE [dbo].[UploadedReports] ADD  DEFAULT ((1)) FOR [FileType]
GO
ALTER TABLE [dbo].[UploadedReports] ADD  DEFAULT ((1)) FOR [UploadedBy]
GO
ALTER TABLE [dbo].[UploadedReports] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UploadedReports] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT ('Password123') FOR [Password]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT ((1)) FOR [UserType]
GO
ALTER TABLE [dbo].[UserMaster] ADD  DEFAULT ((99)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[PackageMaster]  WITH CHECK ADD FOREIGN KEY([CatgID])
REFERENCES [dbo].[PackageCategory] ([ID])
GO
ALTER TABLE [dbo].[ServiceQuestions]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[HealthServiceMaster] ([ID])
GO
ALTER TABLE [dbo].[TestMaster]  WITH CHECK ADD  CONSTRAINT [FK_Test_Package] FOREIGN KEY([PackageID])
REFERENCES [dbo].[PackageMaster] ([ID])
GO
ALTER TABLE [dbo].[TestMaster] CHECK CONSTRAINT [FK_Test_Package]
GO
