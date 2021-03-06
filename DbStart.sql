CREATE DATABASE [PhilosopherPeasant]
GO
USE [PhilosopherPeasant]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/12/2016 9:55:35 AM ******/
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
/****** Object:  Table [dbo].[Articles]    Script Date: 5/12/2016 9:55:35 AM ******/
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
	[SubmitDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/12/2016 9:55:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/12/2016 9:55:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/12/2016 9:55:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/12/2016 9:55:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/12/2016 9:55:35 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/12/2016 9:55:35 AM ******/
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
	[IsContributor] [bit] NOT NULL,
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
 CONSTRAINT [PK_ApplicationUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/12/2016 9:55:35 AM ******/
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
/****** Object:  Table [dbo].[Contributors]    Script Date: 5/12/2016 9:55:35 AM ******/
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
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contributor] PRIMARY KEY CLUSTERED 
(
	[ContributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tangents]    Script Date: 5/12/2016 9:55:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tangents](
	[TangentId] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NOT NULL,
	[Key] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tangent] PRIMARY KEY CLUSTERED 
(
	[TangentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160508191925_Initial', N'7.0.0-rc1-16348')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160508193417_A', N'7.0.0-rc1-16348')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20160508223040_B', N'7.0.0-rc1-16348')
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'16373557-ca23-4e4b-820b-7802b30725f6', N'7a04320d-a9cd-4850-a77a-3a7832f75ad2', N'Writer', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'26e198f0-e4fd-4355-8ae2-6957a1be0d74', N'917bd4cb-2140-41a4-a7fb-a2a533e478d1', N'Editor', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'edd0f1ec-b411-4e72-ac68-0b6243d222f5', N'8be32e7e-b6f5-44e5-b28e-5940ff1d975f', N'Editor in chief', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'f2db18d5-3905-4d61-9111-41ebe4ddfc97', N'ba4fa6c4-2b57-4388-8d62-54feb01ecf9d', N'Admin', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'359c8f5c-b59a-4d57-bd7d-6050b0fa2524', N'26e198f0-e4fd-4355-8ae2-6957a1be0d74')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'456c9cb4-51e0-4741-bd99-28d802e4b510', N'26e198f0-e4fd-4355-8ae2-6957a1be0d74')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'48cd5ec7-7b43-4fe7-8273-42fa470d2fb7', N'16373557-ca23-4e4b-820b-7802b30725f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'819a5853-4eb6-475c-bfa7-b8d28c7c97db', N'26e198f0-e4fd-4355-8ae2-6957a1be0d74')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'88f2bda9-f1e0-4849-8347-7075be681ec7', N'16373557-ca23-4e4b-820b-7802b30725f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ac6da04f-5bf1-408e-a4f1-1d9f890b40a3', N'16373557-ca23-4e4b-820b-7802b30725f6')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'be977c4d-dc60-46fa-aefb-93cd965aaffa', N'f2db18d5-3905-4d61-9111-41ebe4ddfc97')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd29a53fb-8e4c-4903-bc3c-973de0f432cc', N'edd0f1ec-b411-4e72-ac68-0b6243d222f5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'eb091a81-b04e-4fb4-ace3-463c79fafda9', N'16373557-ca23-4e4b-820b-7802b30725f6')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'359c8f5c-b59a-4d57-bd7d-6050b0fa2524', 0, N'3b71f768-8a23-477b-bceb-b25c7a641398', N'plato@plato.com', 0, 1, 1, NULL, N'PLATO@PLATO.COM', N'PLATO', N'AQAAAAEAACcQAAAAEEpx3f1L2YIxbdrBkebhMTNmo1WrXhjOKw3Yo+toxGo1jNIytVWXydzBJv2DfmoSzw==', NULL, 0, N'd7928a87-b200-4597-a139-0f6fe8224a90', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'plato')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'456c9cb4-51e0-4741-bd99-28d802e4b510', 0, N'171b4439-c8b5-4d32-9937-6fb49eeedd01', N'socrates@socrates.com', 0, 1, 1, NULL, N'SOCRATES@SOCRATES.COM', N'SOCRATES', N'AQAAAAEAACcQAAAAEJAGYaO+O8SuxikxdNxgvd5hCjI+21mXvGgAiKsMsHtbrO9ko6Jua0+bxSDhxYl6+g==', NULL, 0, N'f30b78de-0dba-44d3-acc5-45fb54276236', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'socrates')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'48cd5ec7-7b43-4fe7-8273-42fa470d2fb7', 0, N'2394518e-6bc9-434e-8da9-bae52efb7fd2', N'hegel@hegel.com', 0, 1, 1, NULL, N'HEGEL@HEGEL.COM', N'HEGEL', N'AQAAAAEAACcQAAAAEP55mW6ZXg/LuGSK/Ryl2oCikT5isCRAw0BUKIkf/3XHwk4q2e7OAhHstVngmXrAcw==', NULL, 0, N'0aa86648-5a12-4a4b-928a-71b1e5329cd0', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'hegel')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'819a5853-4eb6-475c-bfa7-b8d28c7c97db', 0, N'46283a63-5202-4e2a-9601-1de4750cdae5', N'aristotle@aristotle.com', 0, 1, 1, NULL, N'ARISTOTLE@ARISTOTLE.COM', N'ARISTOTLE', N'AQAAAAEAACcQAAAAEGi37CCz3aGR8EMEqg/TPobJOq9LagZLvQIXWiENwzLId5fMRSh6wua+kne5AJfJiQ==', NULL, 0, N'f90c4529-a0f0-42a3-9663-11b273f79962', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'aristotle')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'88f2bda9-f1e0-4849-8347-7075be681ec7', 0, N'fd0b2567-39a4-49b4-a5f0-6d285a0917ff', N'kant@kant.com', 0, 1, 1, NULL, N'KANT@KANT.COM', N'KANT', N'AQAAAAEAACcQAAAAENGwD6snN04U2q3erfE7h0UoWsfkW8YQRtmzgaMCRRDalqzYwR0x+djQhKl3tL8vWg==', NULL, 0, N'cd67e1b6-ac4a-4b4f-9579-99e644c3d437', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'kant')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'ac6da04f-5bf1-408e-a4f1-1d9f890b40a3', 0, N'3a5335fa-55bd-427a-b0bf-740ed1841fa6', N'descartes@descartes.com', 0, 1, 1, NULL, N'DESCARTES@DESCARTES.COM', N'DESCARTES', N'AQAAAAEAACcQAAAAEC4B9uNNd9nWREuDoRiHbGmrjr/uOuxZ5emZtk4hA7ThzEvehqktmzkikOaCTPRXig==', NULL, 0, N'7b5e58dd-68fc-40cf-86c7-e912f403cd7c', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'descartes')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'be977c4d-dc60-46fa-aefb-93cd965aaffa', 0, N'1250cf57-1446-4f00-81bd-d5d86381f708', N'admin@admin.com', 0, 0, 1, NULL, N'ADMIN@ADMIN.COM', N'ADMIN', N'AQAAAAEAACcQAAAAEGbCV9BNL4ncAXaRGLihcGKsgYWQ0Es92nSngr5LVPknGAONwg+JUF0VK0Yphr0fgQ==', NULL, 0, N'28262b5d-e7fe-4dc7-8ab9-97918f147eca', CAST(N'2016-05-08T00:00:00.0000000' AS DateTime2), 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'd29a53fb-8e4c-4903-bc3c-973de0f432cc', 0, N'ac47bd19-947e-495a-9ea2-e02d5e280cf6', N'dmdiehr@outlook.com', 0, 1, 1, NULL, N'DMDIEHR@OUTLOOK.COM', N'DMDIEHR', N'AQAAAAEAACcQAAAAECUJwHUbmgSFs835BVAh0SmMd1N3yrqhB1mfOwj5PMwhLh8F/Y6mbROvUlRE8Q/Crg==', NULL, 0, N'fb8468c8-427c-4497-ba71-990d333607b3', CAST(N'2016-05-08T00:00:00.0000000' AS DateTime2), 0, N'dmdiehr')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'eb091a81-b04e-4fb4-ace3-463c79fafda9', 0, N'7a375b27-6f5f-4158-87bc-adcf791653f7', N'spinoza@spinoza.com', 0, 1, 1, NULL, N'SPINOZA@SPINOZA.COM', N'SPINOZA', N'AQAAAAEAACcQAAAAEONrijYcUvB6bjC4usD1UMCSmx57hgNwucclVo2FHPr+YNh58sbapWH4ARL5APyE3w==', NULL, 0, N'2fc74e9c-9e48-4c62-af84-bf80a70ed3b1', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'spinoza')
SET IDENTITY_INSERT [dbo].[Contributors] ON 

INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (1, N'd29a53fb-8e4c-4903-bc3c-973de0f432cc', N'David is awesome, trust us.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'David Diehr', N'dmdiehr@outlook.com', N'Editor in chief', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'dmdiehr')
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (2, N'359c8f5c-b59a-4d57-bd7d-6050b0fa2524', N'Just so overrated.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Plato', N'plato@plato.com', N'Editor', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), N'plato')
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (3, N'456c9cb4-51e0-4741-bd99-28d802e4b510', N'Manages to be ugly and attractive at the same time.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Socrates', N'socrates@socrates.com', N'Editor', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), N'socrates')
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (4, N'48cd5ec7-7b43-4fe7-8273-42fa470d2fb7', N'Whether it''s through sublation or supersession he just gets better and better.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'G.W.F. Hegel', N'hegel@hegel.com', N'Writer', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), N'hegel')
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (5, N'819a5853-4eb6-475c-bfa7-b8d28c7c97db', N'Insert Aristotle joke here.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Aristotle', N'aristotle@aristotle.com', N'Editor', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), N'aristotle')
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (6, N'88f2bda9-f1e0-4849-8347-7075be681ec7', N'I''d like to be funny, but I Kant.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Immanuel Kant', N'kant@kant.com', N'Writer', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), N'kant')
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (7, N'ac6da04f-5bf1-408e-a4f1-1d9f890b40a3', N'I sincerely believed that the soul resided in the pituitary gland, and people still call me a genius.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Rene Descartes', N'descartes@descartes.com', N'Writer', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), N'descartes')
INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (8, N'eb091a81-b04e-4fb4-ace3-463c79fafda9', N'I believe in the ultimate unity of all things but still managed to have two first names.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Baruch Spinoza', N'spinoza@spinoza.com', N'Writer', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), N'spinoza')
SET IDENTITY_INSERT [dbo].[Contributors] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/12/2016 9:55:35 AM ******/
CREATE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 5/12/2016 9:55:35 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/12/2016 9:55:35 AM ******/
CREATE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articles] ADD  DEFAULT ('0001-01-01 00:00:00.0000000') FOR [SubmitDate]
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
ALTER TABLE [dbo].[Tangents]  WITH CHECK ADD  CONSTRAINT [FK_Tangent_Article_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([ArticleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tangents] CHECK CONSTRAINT [FK_Tangent_Article_ArticleId]
GO
USE [master]
GO
ALTER DATABASE [PhilosopherPeasant] SET  READ_WRITE 
GO
