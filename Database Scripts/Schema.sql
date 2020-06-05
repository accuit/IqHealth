USE LaymanWoods
GO

/****** Object:  Table [dbo].[Category]    Script Date: 6/20/2016 1:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](32) NOT NULL,
	[CategoryCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secondary]
) ON [Secondary]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Products]    Script Date: 29-05-2016 15:39:38 ******/
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 6/20/2016 1:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[ProductTypeCode] [varchar](50) NOT NULL,
	[ProductTypeName] [varchar](50) NOT NULL,
	[CategoryCode] [varchar](50) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[BasicModelCode] [varchar](50) NOT NULL,
	[BasicModelName] [varchar](50) NOT NULL,
	[SKUCode] [varchar](50) NULL,
	[SKUName] [varchar](50) NULL,
	[MRP] [decimal](18, 2) NULL,
	[DealerPrice] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secondary]
) ON [Secondary]

GO
SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_CreatedBy]  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductMaster] ADD  CONSTRAINT [DF_ProductMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[CommonSetup]    Script Date: 6/20/2016 1:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CommonSetup](
	[CommonSetupID] [int] IDENTITY(1,1) NOT NULL,
	[MainType] [varchar](200) NULL,
	[SubType] [varchar](200) NULL,
	[DisplayText] [varchar](200) NULL,
	[DisplayValue] [tinyint] NULL,
	[ParentID] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CompanyID] [int] NULL
) ON [Secondary]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[CommonSetup] ADD [Description] [varchar](200) NULL
 CONSTRAINT [PK_CommonSetup] PRIMARY KEY CLUSTERED 
(
	[CommonSetupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secondary]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[OTPMaster]    Script Date: 6/20/2016 1:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OTPMaster](
	[OTPMasterID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[GUID] [varchar](500) NULL,
	[OTP] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Attempts] [int] NULL,
 CONSTRAINT [PK_OTPMaster] PRIMARY KEY CLUSTERED 
(
	[OTPMasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
)

GO

/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 6/20/2016 1:05:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[EmailTemplate] ADD  CONSTRAINT [DF_EmailTemplate_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
