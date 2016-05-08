USE [master]
GO
/****** Object:  Database [PhilosopherPeasant]    Script Date: 5/7/2016 9:12:19 PM ******/
CREATE DATABASE [PhilosopherPeasant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PhilosopherPeasant', FILENAME = N'C:\Users\David\PhilosopherPeasant.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PhilosopherPeasant_log', FILENAME = N'C:\Users\David\PhilosopherPeasant_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PhilosopherPeasant] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhilosopherPeasant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhilosopherPeasant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PhilosopherPeasant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhilosopherPeasant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhilosopherPeasant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PhilosopherPeasant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhilosopherPeasant] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PhilosopherPeasant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PhilosopherPeasant] SET  MULTI_USER 
GO
ALTER DATABASE [PhilosopherPeasant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhilosopherPeasant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhilosopherPeasant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhilosopherPeasant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PhilosopherPeasant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PhilosopherPeasant] SET QUERY_STORE = OFF
GO
USE [PhilosopherPeasant]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PhilosopherPeasant]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_HistoryRow] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Articles]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ArticleId] [int] IDENTITY(1,1) NOT NULL,
	[Abstract] [nvarchar](max) NULL,
	[Approved] [bit] NOT NULL,
	[Body] [nvarchar](max) NULL,
	[ContributorId] [int] NOT NULL,
	[PublishDate] [datetime2](7) NOT NULL,
	[Reviewed] [bit] NOT NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_IdentityRoleClaim<string>] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_IdentityRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_IdentityUserClaim<string>] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_IdentityUserLogin<string>] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_IdentityUserRole<string>] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[IsContributor] [bit] NOT NULL,
 CONSTRAINT [PK_ApplicationUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
	[ArticleArticleId] [int] NULL,
	[PostDateTime] [datetime2](7) NOT NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contributors]    Script Date: 5/7/2016 9:12:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contributors](
	[ContributorId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
	[Bio] [nvarchar](max) NULL,
	[ImageLink] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[PublicEmail] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Contributor] PRIMARY KEY CLUSTERED 
(
	[ContributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160507041841_A', N'7.0.0-rc1-16348')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160507173256_B', N'7.0.0-rc1-16348')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160507173516_C', N'7.0.0-rc1-16348')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160507221931_D', N'7.0.0-rc1-16348')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160508003821_E', N'7.0.0-rc1-16348')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'0187dbda-b40a-46d9-9098-ea3984ad58c8', N'bbb8a6fb-bedd-4507-9a5b-2fae61ca3fec', N'Writer', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'cdfcb3b3-2248-49a1-80e3-9d929cfd1f79', N'e3ff2b48-207c-4546-9aba-ca380cc0a3c1', N'Editor in chief', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'ed538e1e-1f2f-4ddc-a172-52c00dd82e8e', N'eae5e90f-0859-49f8-bb50-81666e74d806', N'Admin', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'f2a00fc2-c0f0-43bd-9caa-c905efe852f6', N'0f3f5d48-4ccb-4302-9d82-d90d8bb3df42', N'Editor', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0c159f08-d673-4dd9-9945-525911b1cf39', N'0187dbda-b40a-46d9-9098-ea3984ad58c8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6c68d9fa-8306-47b3-88a1-12f25ee2ee5a', N'ed538e1e-1f2f-4ddc-a172-52c00dd82e8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9af61e4b-355e-4971-9a41-c8ad66865129', N'cdfcb3b3-2248-49a1-80e3-9d929cfd1f79')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName], [IsContributor]) VALUES (N'0c159f08-d673-4dd9-9945-525911b1cf39', 0, N'd178b865-c9b0-498f-a04a-da1eef6df4d9', N'writer1@writer1.com', 0, 1, NULL, N'WRITER1@WRITER1.COM', N'WRITER1', N'AQAAAAEAACcQAAAAENGvWAfp1iQTzuUBAlwZHPeMpPBHJD+Nig0o2u+/bWXR+2ItFLyy1ZFcfjIHu8F1Bw==', NULL, 0, N'3af54140-ac87-4038-b194-9575a6b20b1e', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2), 0, N'writer1', 1)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName], [IsContributor]) VALUES (N'3b319d0d-1ad9-4352-ace3-f900e4b9f0a2', 0, N'95858be7-7578-4250-b92d-141259f14a85', N'editor1@editor1.com', 0, 1, NULL, N'EDITOR1@EDITOR1.COM', N'EDITOR1', N'AQAAAAEAACcQAAAAEFv6WXh53+RWwTKD/LykKKuB5rR4mZukBcP2t6gbfnrfQ/lV3kjnVb0ZcY5HzkDyJg==', NULL, 0, N'39bc9bdb-d989-49a6-b9d0-5ba1cb3cd98f', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2), 0, N'editor1', 0)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName], [IsContributor]) VALUES (N'6c68d9fa-8306-47b3-88a1-12f25ee2ee5a', 0, N'a02bba93-3e95-42cf-a808-2c64c43a7e2b', N'admin@admin.com', 0, 1, NULL, N'ADMIN@ADMIN.COM', N'ADMIN', N'AQAAAAEAACcQAAAAEMQMmTLPi/2kZwnsL85mP35LFa5VKwOqEbmKtyt0Qdu8BuTt5Y2NcGXH4UYthy2jtg==', NULL, 0, N'20b0adc6-b681-4338-8644-3d894d474650', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2), 0, N'admin', 0)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName], [IsContributor]) VALUES (N'9af61e4b-355e-4971-9a41-c8ad66865129', 0, N'99b18ab2-fe35-4e0f-aa9b-ffc994cf5c49', N'dmdiehr@outlook.com', 0, 1, NULL, N'DMDIEHR@OUTLOOK.COM', N'DMDIEHR', N'AQAAAAEAACcQAAAAENmEEOwSRoS1Mrq2UUyViqSSjbxMnqYgBnEHiN3/lJZDniM5oAaPYGKYm0GStY/dGg==', NULL, 0, N'ba93f830-47d7-4b28-aca9-8105dc12fbdd', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2), 0, N'dmdiehr', 1)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName], [IsContributor]) VALUES (N'cae5c184-fed6-4bad-863c-0e013df1add8', 0, N'18b5738e-19eb-4a42-97b1-1e32e15d5192', N'writer2@writer2.com', 0, 1, NULL, N'WRITER2@WRITER2.COM', N'WRITER2', N'AQAAAAEAACcQAAAAEGGnxqOHLpiRJ8+yA4hjSoNAk85pLAV97dLus8aCR4MGQL3lFwxnWJ4LMYtip1Y3GQ==', NULL, 0, N'd5b0cb9f-f239-432c-b71c-822e46357177', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2), 0, N'writer2', 0)
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName], [IsContributor]) VALUES (N'ea923fd6-f4e2-49d3-8a59-83a341297676', 0, N'2c9e86cf-06e7-4033-9099-40c22520c960', N'editor2@editor2.com', 0, 1, NULL, N'EDITOR2@EDITOR2.COM', N'EDITOR2', N'AQAAAAEAACcQAAAAEBnyQhiG8MURREhxGOYEQiHamhipAfcFQgwZSfO/4hnjH3R6sZ2+/Tk49sj6/D84QA==', NULL, 0, N'39169a97-e6d0-482f-b3a8-86ab567d9c08', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2), 0, N'editor2', 0)
SET IDENTITY_INSERT [dbo].[Contributors] ON 

INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate]) VALUES (5, N'9af61e4b-355e-4971-9a41-c8ad66865129', N'David is just so fuckin great. Forreals yo! Na just playin.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'David Diehr', N'dmdiehr@outlook.com', N'Editor in chief', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate]) VALUES (7, N'0c159f08-d673-4dd9-9945-525911b1cf39', N'Writer One Bio!!!!!!!!!!!!!!!!!!!!!!!!!!!!', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Writer One', N'WriterOne@WriterOne.com', N'Writer', CAST(N'2016-05-06T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Contributors] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/7/2016 9:12:19 PM ******/
CREATE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 5/7/2016 9:12:19 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/7/2016 9:12:19 PM ******/
CREATE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ((0)) FOR [IsContributor]
GO
ALTER TABLE [dbo].[Contributors] ADD  DEFAULT ('0001-01-01 00:00:00.0000000') FOR [StartDate]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Article_Contributor_ContributorId] FOREIGN KEY([ContributorId])
REFERENCES [dbo].[Contributors] ([ContributorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Article_Contributor_ContributorId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityRoleClaim<string>_IdentityRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_IdentityRoleClaim<string>_IdentityRole_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserClaim<string>_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_IdentityUserClaim<string>_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserLogin<string>_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_IdentityUserLogin<string>_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserRole<string>_ApplicationUser_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_IdentityUserRole<string>_ApplicationUser_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_IdentityUserRole<string>_IdentityRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_IdentityUserRole<string>_IdentityRole_RoleId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_ApplicationUser_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_ApplicationUser_ApplicationUserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article_ArticleArticleId] FOREIGN KEY([ArticleArticleId])
REFERENCES [dbo].[Articles] ([ArticleId])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_Article_ArticleArticleId]
GO
ALTER TABLE [dbo].[Contributors]  WITH CHECK ADD  CONSTRAINT [FK_Contributor_ApplicationUser_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Contributors] CHECK CONSTRAINT [FK_Contributor_ApplicationUser_ApplicationUserId]
GO
USE [master]
GO
ALTER DATABASE [PhilosopherPeasant] SET  READ_WRITE 
GO
