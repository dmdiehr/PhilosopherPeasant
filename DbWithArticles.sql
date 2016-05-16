USE [master]
GO
/****** Object:  Database [PhilosopherPeasant]    Script Date: 5/15/2016 9:59:19 PM ******/
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
ALTER DATABASE [PhilosopherPeasant] SET READ_COMMITTED_SNAPSHOT OFF 
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/15/2016 9:59:19 PM ******/
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
/****** Object:  Table [dbo].[Articles]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[Contributors]    Script Date: 5/15/2016 9:59:20 PM ******/
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
/****** Object:  Table [dbo].[Tangents]    Script Date: 5/15/2016 9:59:20 PM ******/
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
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (1, N'Abstract', 0, N'test {foo}(bar) test {foofoo}(barbar)', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Title', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (2, N'Virtues transvaluation strong sea victorious joy law right contradict fearful enlightenment. Battle oneself pious christianity will enlightenment salvation reason superiority burying play reason. Depths gains will depths zarathustra endless faithful against ultimate battle gains decieve. Faithful convictions ideal gains justice war insofar. Play sexuality depths snare transvaluation contradict zarathustra.', 0, N'Virtues transvaluation strong sea victorious joy law right contradict fearful enlightenment. Battle oneself pious christianity will enlightenment salvation reason superiority burying play reason. Depths gains will depths zarathustra endless faithful against ultimate battle gains decieve. Faithful convictions ideal gains justice war insofar. Play sexuality depths snare transvaluation contradict zarathustra.
Virtues transvaluation strong sea victorious joy law right contradict fearful enlightenment. Battle oneself pious christianity will enlightenment salvation reason superiority burying play reason. Depths gains will depths zarathustra endless faithful against ultimate battle gains decieve. Faithful convictions ideal gains justice war insofar. Play sexuality depths snare transvaluation contradict zarathustra.
Virtues transvaluation strong sea victorious joy law right contradict fearful enlightenment. Battle oneself pious christianity will enlightenment salvation reason superiority burying play reason. Depths gains will depths zarathustra endless faithful against ultimate battle gains decieve. Faithful convictions ideal gains justice war insofar. Play sexuality depths snare transvaluation contradict zarathustra.
Virtues transvaluation strong sea victorious joy law right contradict fearful enlightenment. Battle oneself pious christianity will enlightenment salvation reason superiority burying play reason. Depths gains will depths zarathustra endless faithful against ultimate battle gains decieve. Faithful convictions ideal gains justice war insofar. Play sexuality depths snare transvaluation contradict zarathustra.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'The Moral Significance of "Normal"', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (3, N'evaluation sexuality noble pinnacle derive. Strong intentions oneself will free truth. Ideal holiest eternal-return intentions snare strong superiority law strong aversion. Fearful zarathustra against transvaluation noble strong convictions ultimate faith passion strong horror love.

Evil strong grandeur decieve hatred marvelous revaluation salvation ubermensch enlightenment. Fearful gains madness strong prejudice ascetic.', 0, N'Passion evil will free overcome. Insofar ubermensch snare decrepit endless moral ultimate strong holiest truth spirit law justice joy. Strong moral philosophy merciful salvation victorious inexpedient good self superiority. Depths christian selfish ocean chaos hatred ubermensch dead suicide. Endless transvaluation depths insofar evil transvaluation reason faithful revaluation eternal-return. Overcome prejudice joy good horror depths madness war christianity evil war pious prejudice.

Ascetic ascetic value sea inexpedient play ubermensch play. Aversion intentions ultimate evil value right salvation endless. Truth god society aversion ascetic fearful value inexpedient. Horror morality holiest passion pious sexuality.

Revaluation eternal-return merciful victorious right dead pious war ascetic ultimate decrepit oneself superiority law. Overcome christianity play ascetic fearful battle law gains faithful war. Society zarathustra endless salvation truth war hope derive burying good zarathustra reason. Decrepit deceptions sexuality intentions decrepit convictions contradict revaluation ideal abstract burying aversion fearful. Revaluation hope ideal christianity.
', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'The Problem of Poetics', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (4, N'Passion evil will free overcome. Insofar ubermensch snare decrepit endless moral ultimate strong holiest truth spirit law justice joy. Strong moral philosophy merciful salvation victorious inexpedient good self superiority. Depths christian selfish ocean chaos hatred ubermensch dead suicide. Endless transvaluation depths insofar evil transvaluation reason faithful revaluation eternal-return. Overcome prejudice joy good horror depths madness war christianity evil war pious prejudice.', 0, N'Virtues christian ultimate ocean justice moral derive overcome joy. Right burying reason grandeur of justice joy depths zarathustra play. Prejudice snare ideal disgust derive right spirit aversion noble ultimate enlightenment reason. Pinnacle convictions play holiest intentions strong overcome society burying ultimate salvation christianity.

Ubermensch grandeur pious fearful battle faith sexuality noble war decieve. Free selfish salvation intentions transvaluation battle truth ubermensch enlightenment fearful.

Pious christian virtues evil pious decrepit. Gains faith spirit strong pious deceptions strong. Ascetic ocean depths oneself dead justice zarathustra ideal mountains enlightenment zarathustra holiest war. Prejudice strong grandeur passion right society.

Insofar eternal-return revaluation love ocean. War ascetic faith evil prejudice dead spirit inexpedient love ascetic derive. Inexpedient moral will battle love value morality christianity decieve god overcome victorious insofar prejudice. Joy ascetic sea god reason. Holiest overcome victorious battle pious. Grandeur selfish merciful intentions faithful burying superiority ultimate joy strong. Ocean will snare horror ubermensch truth.

Disgust hope moral merciful eternal-return dead war. Transvaluation against overcome of pinnacle hatred free madness derive merciful morality.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'A New Atomism and other Physics Metaphors', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (5, N'Pious christian virtues evil pious decrepit. Gains faith spirit strong pious deceptions strong. Ascetic ocean depths oneself dead justice zarathustra ideal mountains enlightenment zarathustra holiest war. Prejudice strong grandeur passion right society.', 0, N'Christianity justice ideal society intentions hope salvation sea endless ultimate dead. Ascetic horror law disgust hope noble sea zarathustra will burying ocean depths free hope. Hatred battle reason love zarathustra noble.

Play against hatred faithful faith fearful gains fearful madness. Philosophy spirit abstract pinnacle ideal ultimate intentions war inexpedient chaos contradict spirit justice. Faithful moral of of christianity inexpedient ultimate aversion play grandeur self intentions burying selfish. Grandeur good transvaluation value decieve decrepit snare madness christianity abstract derive decrepit hatred abstract. Inexpedient self hatred passion ascetic superiority insofar. Hope battle decrepit intentions marvelous grandeur truth oneself strong evil enlightenment play hope revaluation.

Burying revaluation virtues noble endless ideal philosophy law horror. Good decrepit mountains christian noble endless pious aversion suicide faith aversion ocean selfish. Ocean will battle hope transvaluation oneself reason evil faithful suicide prejudice oneself.

Holiest hatred will intentions of selfish play selfish. Depths pinnacle noble inexpedient pinnacle decrepit merciful oneself snare merciful. Of derive overcome play revaluation hope value. Holiest merciful value moral prejudice.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'the Foundations and Folly of Libertarianism', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (6, N'Good sexuality mountains christian ideal joy fearful aversion ultimate good. Reason horror disgust sea depths. Ascetic eternal-return merciful christian war value. Value ultimate law pious prejudice justice snare eternal-return moral. Spirit noble play gains contradict pinnacle sexuality selfish derive revaluation evil free ideal. Ideal value revaluation insofar reason salvation mountains.', 0, N'Dead mountains holiest justice god against hope ultimate strong superiority zarathustra. Spirit christian decrepit evil enlightenment faith snare decrepit snare god love decieve spirit ultimate. Decrepit noble salvation pious play horror fearful decieve holiest justice self ubermensch. Hope abstract eternal-return christian right dead sexuality horror battle pious depths inexpedient grandeur sexuality. Evil truth battle reason ideal madness hope superiority moral fearful abstract self transvaluation.

Inexpedient grandeur good marvelous philosophy self suicide sea eternal-return superiority moral convictions dead dead. Christianity good decieve contradict oneself hope. Of pious against self deceptions aversion joy morality mountains intentions marvelous zarathustra. Will prejudice depths victorious decieve hope sea merciful good abstract burying virtues. Merciful transvaluation play pinnacle ultimate morality salvation ubermensch faith society against justice. Pious eternal-return merciful pinnacle passion passion faith hatred christian philosophy. War law transvaluation sexuality holiest decrepit.

Chaos philosophy right dead depths hatred self horror ubermensch. Transvaluation hatred abstract deceptions ocean holiest marvelous christianity hope enlightenment.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'The Objectivity Problem in the Social Sciences', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (7, N'Strong christian passion enlightenment society marvelous justice. Holiest aversion disgust contradict deceptions. Dead horror derive selfish war morality philosophy prejudice burying oneself god. Mountains fearful superiority of convictions philosophy ultimate war war good zarathustra right joy. Sea will pious eternal-return convictions faith ocean. Society ultimate virtues strong moral hatred law revaluation battle holiest endless fearful society pinnacle.', 0, N'Dead mountains holiest justice god against hope ultimate strong superiority zarathustra. Spirit christian decrepit evil enlightenment faith snare decrepit snare god love decieve spirit ultimate. Decrepit noble salvation pious play horror fearful decieve holiest justice self ubermensch. Hope abstract eternal-return christian right dead sexuality horror battle pious depths inexpedient grandeur sexuality. Evil truth battle reason ideal madness hope superiority moral fearful abstract self transvaluation.

Inexpedient grandeur good marvelous philosophy self suicide sea eternal-return superiority moral convictions dead dead. Christianity good decieve contradict oneself hope. Of pious against self deceptions aversion joy morality mountains intentions marvelous zarathustra. Will prejudice depths victorious decieve hope sea merciful good abstract burying virtues. Merciful transvaluation play pinnacle ultimate morality salvation ubermensch faith society against justice. Pious eternal-return merciful pinnacle passion passion faith hatred christian philosophy. War law transvaluation sexuality holiest decrepit.

Chaos philosophy right dead depths hatred self horror ubermensch. Transvaluation hatred abstract deceptions ocean holiest marvelous christianity hope enlightenment.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Atheism and Theism, Beginning or End?', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (8, N'Zarathustra morality faith virtues faith decieve pious overcome contradict. Aversion mountains ubermensch truth contradict ultimate faith. God decieve ocean sea inexpedient superiority philosophy prejudice. Endless merciful horror morality insofar truth evil horror battle good hope suicide christianity. Sea prejudice revaluation intentions law enlightenment noble superiority intentions truth merciful self dead truth. Self ultimate passion superiority law intentions dead.', 0, N'Reason zarathustra philosophy right selfish love evil dead reason enlightenment deceptions. Evil of gains will disgust god victorious superiority sea contradict love deceptions derive.

Insofar strong decieve derive hatred christianity. Strong strong inexpedient horror salvation decrepit ultimate.

Faith war zarathustra christian dead against love ideal. Grandeur merciful prejudice overcome insofar mountains free endless dead decieve revaluation enlightenment pinnacle philosophy. Gains prejudice god holiest christianity dead hatred justice right noble.

Value marvelous play philosophy right christian fearful abstract selfish joy. Revaluation hope hatred sexuality horror battle transvaluation war insofar depths fearful self burying.

Suicide play justice snare horror holiest god superiority christian play will merciful. God ascetic sexuality value salvation abstract insofar against fearful madness overcome morality. Ideal deceptions strong ultimate selfish of law decieve horror right chaos. Love eternal-return passion war self law grandeur philosophy against dead deceptions play.

Revaluation sea.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Have the Communitarians Won?', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (9, N'Dead ubermensch free pious dead contradict joy endless battle marvelous zarathustra. Right good of law salvation suicide gains battle.

Decieve ocean right intentions truth evil play ideal. Dead convictions joy zarathustra gains christianity battle faith decrepit. Suicide abstract strong merciful god insofar noble ubermensch. Victorious overcome pinnacle aversion christian contradict justice grandeur. Gains moral sea love inexpedient holiest love battle ultimate madness aversion love ultimate. Battle ocean good intentions disgust.', 0, N'Dead selfish ultimate deceptions prejudice decrepit. Burying endless hope ocean noble disgust revaluation grandeur ultimate revaluation snare. Value convictions ubermensch horror holiest ideal fearful decrepit play ocean ultimate hope superiority. Horror god victorious intentions madness salvation.

Decrepit good faith philosophy inexpedient. Love right ubermensch derive overcome transvaluation decrepit justice ubermensch of burying pious madness. Love ultimate inexpedient joy merciful truth faithful disgust.

Intentions insofar faith disgust deceptions prejudice truth transvaluation ultimate derive philosophy ubermensch aversion sexuality. Dead value virtues sexuality intentions pious enlightenment right salvation sea reason abstract love. Joy law gains christian war fearful.

Inexpedient grandeur moral chaos dead hatred. Truth free sea gains selfish right dead noble fearful law dead inexpedient disgust transvaluation. Decieve burying mountains ultimate pious burying intentions pinnacle justice.

Holiest will fearful ascetic virtues. Strong prejudice marvelous justice christian derive christian ocean sea. Christian play right convictions fearful enlightenment convictions oneself spirit chaos free philosophy holiest. Abstract salvation convictions moral god prejudice overcome ultimate passion aversion. Self will free battle sea fearful. Will zarathustra of enlightenment derive holiest prejudice ocean holiest fearful. Overcome contradict free of mountains grandeur marvelous overcome.

Disgust hope superiority society christian derive hope suicide ocean faithful moral dead. Evil love decieve.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Rethinking the Hammurabic Code', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (10, N'Horror deceptions moral enlightenment deceptions revaluation revaluation. Will against philosophy faithful love revaluation reason holiest depths burying depths reason victorious. Joy oneself revaluation decrepit ascetic spirit dead christian ideal value convictions self intentions grandeur.
', 0, N'
Revaluation ocean pinnacle value suicide holiest derive ubermensch strong passion. Oneself ascetic oneself hope inexpedient evil depths pious of faith hope decrepit justice virtues. Ocean ocean mountains ultimate horror spirit pinnacle war ultimate spirit abstract. Intentions zarathustra contradict virtues passion faith. Fearful gains spirit victorious faith deceptions eternal-return.

Spirit chaos self decrepit decieve mountains. Mountains virtues marvelous christian ultimate faith marvelous transvaluation society convictions madness. Noble self endless of victorious strong prejudice christian snare prejudice pinnacle endless virtues. Zarathustra pinnacle virtues hope enlightenment enlightenment disgust chaos gains god war ascetic ideal salvation. Endless society suicide selfish good truth merciful.

Chaos decieve law aversion against enlightenment god. Hope truth faith victorious good overcome sexuality ocean. Prejudice fearful of right of depths intentions self noble love intentions contradict.

Eternal-return will zarathustra ultimate ubermensch suicide christian grandeur zarathustra decieve. Eternal-return ultimate suicide evil law burying aversion of faithful. Ocean aversion aversion play ideal.

Hope christianity sexuality of war depths god selfish enlightenment law. Overcome philosophy faith battle ubermensch.', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Blame and Praise', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (11, N'Eternal-return fearful christianity marvelous dead ascetic good god ubermensch joy contradict dead transvaluation sexuality. Intentions transvaluation intentions self ultimate right intentions god chaos will spirit evil gains derive. Contradict merciful mountains pinnacle hatred law enlightenment joy ascetic moral derive decieve eternal-return holiest. Decrepit mountains battle victorious ascetic good ultimate war inexpedient self noble. Oneself ascetic mountains victorious mountains burying ultimate eternal-return value right. Joy ubermensch god evil justice good suicide will marvelous marvelous christian pinnacle pinnacle oneself.
', 0, N'
Dead marvelous salvation burying hope will spirit ascetic ideal will. Sexuality ultimate chaos ultimate enlightenment dead. Will virtues dead convictions pious burying.

Decieve depths marvelous society superiority insofar christian ideal depths endless hatred. Ultimate against faithful joy ubermensch philosophy play intentions snare. Revaluation holiest holiest derive philosophy self joy depths chaos dead sexuality merciful god faith. Will sea snare zarathustra horror horror inexpedient horror prejudice justice revaluation. Faith will dead good decieve snare deceptions convictions right free superiority faithful.

Intentions gains passion ascetic prejudice ultimate pious eternal-return decieve grandeur. God gains justice selfish zarathustra horror inexpedient disgust snare. Victorious joy war contradict ultimate will spirit moral ideal merciful spirit. Hatred hatred selfish intentions superiority ubermensch madness snare christianity value law. Christian faithful transvaluation gains pious.

Passion decrepit ideal snare zarathustra strong sea ultimate disgust victorious passion disgust of. Free faith ubermensch transvaluation of prejudice overcome derive decieve christianity.
', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Need Versus Want and other Meaningless Distinctions', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (12, N'Virtues virtues ultimate evil ideal. Ocean gains battle faith ultimate reason. Burying truth snare gains justice depths gains moral dead enlightenment love madness convictions. Philosophy holiest reason against justice strong. Virtues decieve ascetic victorious good aversion prejudice prejudice free value christian disgust right selfish.
', 0, N'
Philosophy faithful snare suicide decrepit prejudice transvaluation convictions. Victorious reason value derive joy hatred passion contradict good against war hatred. Christianity horror right truth salvation oneself will against eternal-return good morality revaluation.

Transvaluation love justice chaos zarathustra insofar snare love pious of sexuality pinnacle. Transvaluation noble law snare sea aversion christian sea value sea holiest faithful convictions value. Superiority derive victorious sea overcome justice inexpedient joy selfish self battle salvation society superiority. Will passion moral truth mountains dead fearful morality ascetic. Grandeur ultimate spirit law reason intentions overcome. Dead prejudice enlightenment good virtues overcome prejudice.

Merciful oneself burying passion philosophy deceptions decieve justice of reason marvelous faithful. Philosophy superiority society victorious ocean philosophy ideal god marvelous intentions law ultimate.

Grandeur revaluation snare dead aversion value will gains horror hope salvation. Eternal-return morality value justice war depths ideal madness enlightenment evil. Ultimate salvation ascetic decrepit gains madness ocean battle war. Suicide prejudice free evil selfish burying contradict eternal-return grandeur love. Ultimate horror christianity ideal enlightenment enlightenment selfish mountains. ', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'The Selfishness Paradox', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (13, N'We have therefore wanted to say that all our intuition is nothing but the representation of appearance; that the things that we intuit are not in themselves what we intuit them to be, nor are their relations so constituted in themselves as they appear to us; and that if we remove our own subject or even only the subjective constitution of the senses in general, then all constitution, all relations of objects in space and time, indeed space and time themselves would disappear, and as appearances they cannot exist in themselves, but only in us. What may be the case with objects in themselves and abstracted from all this receptivity of our sensibility remains entirely unknown to us. We are acquainted with nothing except our way of perceiving them, which is peculiar to us, and which therefore does not necessarily pertain to every being, though to be sure it pertains to every human being. We are concerned solely with this. Space and time are its pure forms, sensation in general its matter. We can cognize only the former a priori, i.e., prior to all actual perception, and they are therefore called pure intuition; the latter, however, is that in our cognition that is responsible for its being called a posteriori cognition, i.e., empirical intuition. The former adheres to our sensibility absolutely necessarily, whatever sort of sensations we may have; the latter can be very different', 0, N'The two-objects reading is the traditional interpretation of Kant''s transcendental idealism. It goes back to the earliest review of the Critique — the so-called Göttingen review by Christian Garve (1742–1798) and J. G. Feder (1740–1821)[9] — and it was the dominant way of interpreting Kant''s transcendental idealism during his own lifetime. It has been a live interpretive option since then and remains so today, although it no longer enjoys the dominance that it once did.[10]

According to the two-objects interpretation, transcendental idealism is essentially a metaphysical thesis that distinguishes between two classes of objects: appearances and things in themselves. Another name for this view is the two-worlds interpretation, since it can also be expressed by saying that transcendental idealism essentially distinguishes between a world of appearances and another world of things in themselves.

Things in themselves, on this interpretation, are absolutely real in the sense that they would exist and have whatever properties they have even if no human beings were around to perceive them. Appearances, on the other hand, are not absolutely real in that sense, because their existence and properties depend on human perceivers. Moreover, whenever appearances do exist, in some sense they exist in the mind of human perceivers. So appearances are mental entities or mental representations. This, coupled with the claim that we experience only appearances, makes transcendental idealism a form of phenomenalism on this interpretation, because it reduces the objects of experience to mental representations. All of our experiences – all of our perceptions of objects and events in space, even those objects and events themselves, and all non-spatial but still temporal thoughts and feelings – fall into the class of appearances that exist in the mind of human perceivers. These appearances cut us off entirely from the reality of things in themselves, which are non-spatial and non-temporal. Yet Kant''s theory, on this interpretation, nevertheless requires that things in themselves exist, because they must transmit to us the sensory data from which we construct appearances. In principle we cannot know how things in themselves affect our senses, because our experience and knowledge is limited to the world of appearances constructed by and in the mind. Things in themselves are therefore a sort of theoretical posit, whose existence and role are required by the theory but are not directly verifiable.

The main problems with the two-objects interpretation are philosophical. Most readers of Kant who have interpreted his transcendental idealism in this way have been — often very — critical of it, for reasons such as the following:

First, at best Kant is walking a fine line in claiming on the one hand that we can have no knowledge about things in themselves, but on the other hand that we know that things in themselves exist, that they affect our senses, and that they are non-spatial and non-temporal. At worst his theory depends on contradictory claims about what we can and cannot know about things in themselves. This objection was influentially articulated by Jacobi, when he complained that “without that presupposition [of things in themselves] I could not enter into the system, but with it I could not stay within it” (Jacobi 1787, 336).

Second, even if that problem is surmounted, it has seemed to many that Kant''s theory, interpreted in this way, implies a radical form of skepticism that traps each of us within the contents of our own mind and cuts us off from reality. Some versions of this objection proceed from premises that Kant rejects. One version maintains that things in themselves are real while appearances are not, and hence that on Kant''s view we cannot have experience or knowledge of reality. But Kant denies that appearances are unreal: they are just as real as things in themselves but are in a different metaphysical class. Another version claims that truth always involves a correspondence between mental representations and things in themselves, from which it would follow that on Kant''s view it is impossible for us to have true beliefs about the world. But just as Kant denies that things in themselves are the only (or privileged) reality, he also denies that correspondence with things in themselves is the only kind of truth. Empirical judgments are true just in case they correspond with their empirical objects in accordance with the a priori principles that structure all possible human experience. But the fact that Kant can appeal in this way to an objective criterion of empirical truth that is internal to our experience has not been enough to convince some critics that Kant is innocent of an unacceptable form of skepticism, mainly because of his insistence on our irreparable ignorance about things in themselves.

Third and finally, Kant''s denial that things in themselves are spatial or temporal has struck many of his readers as incoherent. The role of things in themselves, on the two-object interpretation, is to affect our senses and thereby to provide the sensory data from which our cognitive faculties construct appearances within the framework of our a priori intuitions of space and time and a priori concepts such as causality. But if there is no space, time, change, or causation in the realm of things in themselves, then how can things in themselves affect us? Transcendental affection seems to involve a causal relation between things in themselves and our sensibility. If this is simply the way we unavoidably think about transcendental affection, because we can give positive content to this thought only by employing the concept of a cause, while it is nevertheless strictly false that things in themselves affect us causally, then it seems not only that we are ignorant of how things in themselves really affect us. It seems, rather, to be incoherent that things in themselves could affect us at all if they are not in space or time.', 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Transcendental Idealism', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (14, N'The most important belief about things in themselves that Kant thinks only practical philosophy can justify concerns human freedom. Freedom is important because, on Kant''s view, moral appraisal presupposes that we are free in the sense that we have the ability to do otherwise. To see why, consider Kant''s example of a man who commits a theft (5:95ff.). Kant holds that in order for this man''s action to be morally wrong, it must have been within his control in the sense that it was within his power at the time not to have committed the theft. If this was not within his control at the time, then, while it may be useful to punish him in order to shape his behavior or to influence others, it nevertheless would not be correct to say that his action was morally wrong. Moral rightness and wrongness apply only to free agents who control their actions and have it in their power, at the time of their actions, either to act rightly or not. According to Kant, this is just common sense.', 0, N'On these grounds, Kant rejects a type of compatibilism that he calls the “comparative concept of freedom” and associates with Leibniz (5:96–97). (Note that Kant has a specific type of compatibilism in mind, which I will refer to simply as “compatibilism,” although there may be other types of compatibilism that do not fit Kant''s characterization of that view). On the compatibilist view, as Kant understands it, I am free whenever the cause of my action is within me. So I am unfree only when something external to me pushes or moves me, but I am free whenever the proximate cause of my body''s movement is internal to me as an “acting being” (5:96). If we distinguish between involuntary convulsions and voluntary bodily movements, then on this view free actions are just voluntary bodily movements. Kant ridicules this view as a “wretched subterfuge” that tries to solve an ancient philosophical problem “with a little quibbling about words” (ibid.). This view, he says, assimilates human freedom to “the freedom of a turnspit,” or a projectile in flight, or the motion of a clock''s hands (5:96–97). The proximate causes of these movements are internal to the turnspit, the projectile, and the clock at the time of the movement. This cannot be sufficient for moral responsibility.

Why not? The reason, Kant says, is ultimately that the causes of these movements occur in time. Return to the theft example. A compatibilist would say that the thief''s action is free because its proximate cause is inside him, and because the theft was not an involuntary convulsion but a voluntary action. The thief decided to commit the theft, and his action flowed from this decision. According to Kant, however, if the thief''s decision is a natural phenomenon that occurs in time, then it must be the effect of some cause that occurred in a previous time. This is an essential part of Kant''s Newtonian worldview and is grounded in the a priori laws (specifically, the category of cause and effect) in accordance with which our understanding constructs experience: every event has a cause that begins in an earlier time. If that cause too was an event occurring in time, then it must also have a cause beginning in a still earlier time, etc. All natural events occur in time and are thoroughly determined by causal chains that stretch backwards into the distant past. So there is no room for freedom in nature, which is deterministic in a strong sense.

The root of the problem, for Kant, is time. Again, if the thief''s choice to commit the theft is a natural event in time, then it is the effect of a causal chain extending into the distant past. But the past is out of his control now, in the present. Once the past is past, he can''t change it. On Kant''s view, that is why his actions would not be in his control in the present if they are determined by events in the past. Even if he could control those past events in the past, he cannot control them now. But in fact past events were not in his control in the past either if they too were determined by events in the more distant past, because eventually the causal antecedents of his action stretch back before his birth, and obviously events that occurred before his birth were not in his control. So if the thief''s choice to commit the theft is a natural event in time, then it is not now and never was in his control, and he could not have done otherwise than to commit the theft. In that case, it would be a mistake to hold him morally responsible for it.

Compatibilism, as Kant understands it, therefore locates the issue in the wrong place. Even if the cause of my action is internal to me, if it is in the past — for example, if my action today is determined by a decision I made yesterday, or from the character I developed in childhood — then it is not within my control now. The real issue is not whether the cause of my action is internal or external to me, but whether it is in my control now. For Kant, however, the cause of my action can be within my control now only if it is not in time. This is why Kant thinks that transcendental idealism is the only way to make sense of the kind of freedom that morality requires. For transcendental idealism allows that the cause of my action may be a thing in itself outside of time: namely, my noumenal self, which is free because it is not part of nature. No matter what kind of character I have developed or what external influences act on me, on Kant''s view all of my intentional, voluntary actions are immediate effects of my noumenal self, which is causally undetermined (5:97–98). My noumenal self is an uncaused cause outside of time, which therefore is not subject to the deterministic laws of nature in accordance with which our understanding constructs experience.

Many puzzles arise on this picture that Kant does not resolve. For example, if my understanding constructs all appearances in my experience of nature, not only appearances of my own actions, then why am I responsible only for my own actions but not for everything that happens in the natural world? Moreover, if I am not alone in the world but there are many noumenal selves acting freely and incorporating their free actions into the experience they construct, then how do multiple transcendentally free agents interact? How do you integrate my free actions into the experience that your understanding constructs?[21] In spite of these unsolved puzzles, Kant holds that we can make sense of moral appraisal and responsibility only by thinking about human freedom in this way, because it is the only way to prevent natural necessity from undermining both.

Finally, since Kant invokes transcendental idealism to make sense of freedom, interpreting his thinking about freedom leads us back to disputes between the two-objects and two-aspects interpretations of transcendental idealism. On the face of it, the two-objects interpretation seems to make better sense of Kant''s view of transcendental freedom than the two-aspects interpretation. If morality requires that I am transcendentally free, then it seems that my true self, and not just an aspect of my self, must be outside of time, according to Kant''s argument. But applying the two-objects interpretation to freedom raises problems of its own, since it involves making a distinction between noumenal and phenomenal selves that does not arise on the two-aspects view. If only my noumenal self is free, and freedom is required for moral responsibility, then my phenomenal self is not morally responsible. But how are my noumenal and phenomenal selves related, and why is punishment inflicted on phenomenal selves? It is unclear whether and to what extent appealing to Kant''s theory of freedom can help to settle disputes about the proper interpretation of transcendental idealism, since there are serious questions about the coherence of Kant''s theory on either interpretation.', 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Freedom', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (15, N'Hegel’s Science of Logic is divided into three books, dealing with the topics of being, essence, and the concept, which appeared in 1812, 1813, and 1816 respectively. For most of the 20th century it was not received with the enthusiasm that often marked the reception of Phenomenology of Spirit. First, as a work of logic most have regarded it as radically outdated and relying on an Aristotelian approach that was definitively surpassed in the later nineteenth century—a view promoted especially by Bertrand Russell in the early years of the twentieth. Thus many readers sympathetic to particular doctrines in Hegel have attempted, contrary to Hegel’s insistence, to quarantine his philosophical approach to particular areas from it. Recently, this skepticism has started to change.', 0, N'Some advocate that the Science of Logic be read as a first-order ontological doctrine (Doz 1987) or as a category theory that simultaneously represents structures of being and thought (Houlgate 2005b), and so as having very little to do with what has traditionally been known as logic. Others argue that in contrast to the project of formal (or general) logic, it is best understood as a version of what Kant had called “transcendental logic” (di Giovanni 2010). In this sense it should thereby be thought of as a successor to Kant’s “transcendental deduction of the categories” in the Critique of Pure Reason in which Kant attempted to derive a list of those non-empirical concepts, the categories, which he believed to be presupposed by all empirical judgments made by finite, discursive knowers like ourselves. In short, taking the logic as a category theory opens up two general lines of interpretation: should the categories be understood as primarily ontological categories, as found in Aristotle, or as primarily categories revealing the necessary structure of thought, as in Kant? Those, such as the advocates of the revised metaphysical interpretation, interpreting Hegel as basically a metaphysician, typically stress the former, while post-Kantian interpreters typically stress the latter.

A glance at the table of contents of Science of Logic reveals the same triadic structuring among the categories or thought determinations discussed that has been noted among the shapes of consciousness in the Phenomenology. At the highest level of its branching structure there are the three books devoted to the doctrines of being, essence, and concept, while in turn, each book has three sections, each section containing three chapters, and so on. In general, each of these individual nodes deals with some particular category. In fact, Hegel’s categorial triads appear to repeat Kant’s own triadic way of articulating the categories in the Table of Categories (Critique of Pure Reason A80/B106) in which the third term in the triad in some way integrates the first two. (In Hegel’s terminology, he would say that the first two were sublated [aufgehoben] in the third—while the first two are negated by the third, they continue to work within the context defined by it.) Hegel’s later treatment of the syllogism found in Book 3, in which he follows Aristotle’s own three-termed schematism of the syllogistic structure, repeats this triadic structure as does his ultimate analysis of its component concepts as the moments of universality, particularity, and singularity.

Reading into the first chapter of Book 1, Being, it is quickly seen that the transitions of the Logic broadly repeat those of the first chapters of the Phenomenology, now, however, as between the categories themselves rather than between conceptions of the respective objects of conscious experience. Thus, being is the thought determination with which the work commences because it at first seems to be the most immediate, fundamental determination that characterises any possible thought content at all. (In contrast, being in the Phenomenology’s Sense-certainty chapter was described as the known truth of the purported immediate sensory given—the category that it was discovered to instantiate.) Whatever thought is about, that topic must in some sense exist. Like those purported simple sensory givens with which the Phenomenology starts, the category being looks to have no internal structure or constituents, but again in a parallel to the Phenomenology, it is the effort of thought to make this category explicit that both undermines it and brings about new ones. Being seems to be both immediate and simple, but it will show itself to be, in fact, only something in opposition to something else, nothing. The point seems to be that while the categories being and nothing seem both absolutely distinct and opposed, on reflection (and following Leibniz’s principle of the identity of indiscernibles) they appear identical as no criterion can be invoked which differentiates them. The only way out of this paradox is to posit a third category within which they can coexist as negated (Aufgehoben) moments. This category is becoming, which saves thinking from paralysis because it accommodates both concepts. Becoming contains being and nothing in the sense that when something becomes it passes, as it were, from nothingness to being. But these contents cannot be understood apart from their contributions to the overarching category: this is what it is to be negated (aufgehoben) within the new category.

In general this is how the Logic proceeds: seeking its most basic and universal determination, thought posits a category to be reflected upon, finds then that this collapses due to a contradiction generated, like that generated by the category being, and so then seeks a further category with which to make retrospective senses of those contradictory categories. However, in turn the new category will generate some further contradictory negation and again the demand will arise for a further concept that can reconcile these opposed concepts by incorporating them as moments.

The method Hegel employs here, determinate negation, is often compared with Spinoza’s principle that “all determination is negation”, but while Hegel’s is related to Spinoza’s thought, it cannot be identified with or reduced to it. Spinoza’s top-down determination starts with a single category (in his case, divine substance) that is then progressively divided by the application of concepts—the model being Plato’s method of division in which a genus concept is divided into particular species by the presence or absence of some differentiating property. From Hegel’s point of view, however, this cannot capture individuals as other than parts of that greater whole—a metaphysical picture in relation to Spinoza he refers to as acosmism. So Hegel will balance this type of determination by negation, with a different type of negation modeled on that which holds between incompatible properties of some object (for example, red and blue as incompatible colors) and that is reflected in the term negation of Aristotle’s logic. This allows Hegel to go beyond the determination of something as particular (suggesting the part-whole relation) to a more robust sense of singularity [Einzelheit]—the sense of the pure thisness seen initially in the Phenomenology’s Sense-certainty chapter, the truth of which was then shown to be Aristotle’s idea of an individual thing’s substantial form in the Perception chapter. It is in terms of this category that we can think, along with Aristotle, of a thing having an underlying substrate within which properties inhere and which, unlike the properties themselves, cannot be thought in general terms, but only in terms of the category of singularity. And yet this will encounter a problem for the determinacy of this underlying substrate—it will have to find determining contrasts that allow it to be determinately conceived. (In Book 2 of the Logic we will learn that the category of singularity will rely on particularity just as particularity has been shown to rely on singularlity. Singular substrates or “essences” can only be known in relation to the general properties that constitute their appearances.)

Attempting to unravel the intricacies of the patterns of dependence between such categories will be task of this mammoth work, but here a general point might be made. If Hegel’s thought here is considered to be, like Spinoza’s, holistic, it is only so at a higher level of abstraction, such that these determinations of singularity, particularity and universality cannot themselves be understood in isolation from each other but only via their complex interactions. Hegel only explicitly explores the details of the interactions of these determinations of conceptuality in his discussion of judgments and syllogisms in Book 3, The Doctrine of Concept, suggesting that concerns of logic as traditionally conceived are not as irrelevant to the Science of Logic as often thought. However, the general point separating his approach from that of Spinoza clearly emerges earlier on. Determinate negation is not Spinoza’s principle as Spinoza’s presupposes a whole that precedes its parts, and that all negations are negations of something that is primitively positive. In contrast, Hegel’s negations will be negations of determinations that are already to be conceived as themselves negations.', 4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Science of Logic', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (16, N'“On God” begins with some deceptively simple definitions of terms that would be familiar to any seventeenth century philosopher. “By substance I understand what is in itself and is conceived through itself”; “By attribute I understand what the intellect perceives of a substance, as constituting its essence”; “By God I understand a being absolutely infinite, i.e., a substance consisting of an infinity of attributes, of which each one expresses an eternal and infinite essence.” The definitions of Part One are, in effect, simply clear concepts that ground the rest of his system. They are followed by a number of axioms that, he assumes, will be regarded as obvious and unproblematic by the philosophically informed (“Whatever is, is either in itself or in another”; “From a given determinate cause the effect follows necessarily”). From these, the first proposition necessarily follows, and every subsequent proposition can be demonstrated using only what precedes it. (References to the Ethics will be by part (I-V), proposition (p), definition (d), scholium (s) and corollary (c).)', 0, N'In propositions one through fifteen of Part One, Spinoza presents the basic elements of his picture of God. God is the infinite, necessarily existing (that is, uncaused), unique substance of the universe. There is only one substance in the universe; it is God; and everything else that is, is in God.

Proposition 1: A substance is prior in nature to its affections.
Proposition 2: Two substances having different attributes have nothing in common with one another. (In other words, if two substances differ in nature, then they have nothing in common).

Proposition 3: If things have nothing in common with one another, one of them cannot be the cause of the other.

Proposition 4: Two or more distinct things are distinguished from one another, either by a difference in the attributes [i.e., the natures or essences] of the substances or by a difference in their affections [i.e., their accidental properties].

Proposition 5: In nature, there cannot be two or more substances of the same nature or attribute.

Proposition 6: One substance cannot be produced by another substance.

Proposition 7: It pertains to the nature of a substance to exist.

Proposition 8: Every substance is necessarily infinite.

Proposition 9: The more reality or being each thing has, the more attributes belong to it.

Proposition 10: Each attribute of a substance must be conceived through itself.

Proposition 11: God, or a substance consisting of infinite attributes, each of which expresses eternal and infinite essence, necessarily exists. (The proof of this proposition consists simply in the classic “ontological proof for God''s existence”. Spinoza writes that “if you deny this, conceive, if you can, that God does not exist. Therefore, by axiom 7 [‘If a thing can be conceived as not existing, its essence does not involve existence’], his essence does not involve existence. But this, by proposition 7, is absurd. Therefore, God necessarily exists, q.e.d.”)

Proposition 12: No attribute of a substance can be truly conceived from which it follows that the substance can be divided.

Proposition 13: A substance which is absolutely infinite is indivisible.

Proposition 14: Except God, no substance can be or be conceived.', 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'On God', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (17, N'Descartes first presented his metaphysics in the Meditations and then reformulated it in textbook-format in the Principles. His metaphysics sought to answer these philosophical questions: How does the human mind acquire knowledge? What is the mark of truth? What is the actual nature of reality? How are our experiences related to our bodies and brains? Is there a benevolent God, and if so, how can we reconcile his existence with the facts of illness, error, and immoral actions?', 0, N'Descartes had no doubt that human beings know some things and are capable of discovering others, including (at least since his metaphysical insights of 1629) fundamental truths about the basic structure of reality. Yet he also believed that the philosophical methods taught in the schools of his time and used by most of his contemporaries were deeply flawed. He believed that the doctrines of scholastic Aristotelian philosophy contained a basic error about the manner in which fundamental truths, such as the truths of metaphysics, are to be gained. He expressed this mistaken view in the First Meditation, by saying (not in his own voice, but in a voice for the reader): “Whatever I have up till now accepted as most true I have acquired either from the senses or through the senses” (7:18). He then went on to challenge the veridicality of the senses with the skeptical arguments of First Meditation, including arguments from previous errors, the dream argument, and the argument from a deceptive God or an evil deceiver.

In the Aristotelian scheme against which Descartes is moving, all knowledge arises from the senses, in accordance with the slogan “There is nothing in the intellect that was not previously in the senses” (7:75, 267). Similarly, orthodox scholastic Aristotelians agreed that there is “no thought without a phantasm,” or an image. Descartes explained these convictions as the results of childhood prejudice (7:2, 17, 69, 107; Princ. I.71–3). As children, we are naturally led by our senses in seeking benefits and avoiding bodily harms. As a result, when we grow into adults we are “immersed” in the body and the senses, and so we accept the philosophical view that the senses are the basis for learning about the nature of the reality (7:38, 75, 82–3).

Descartes denied that the senses reveal the natures of substances. He held that in fact the human intellect is able to perceive the nature of reality through a purely intellectual perception. This means that, in order to procure the fundamental truths of metaphysics, we must “withdraw the mind from the senses” (7:4, 12, 14) and turn toward our innate ideas of the essences of things, including the essences of mind, matter, and an infinite being (God). Descartes constructed the Meditations so as to secure this process of withdrawal from the senses in Meditation I. Meditation II brings the discovery of an initial truth, in the cogito (7:25), which is elsewhere summarized as the argument “cogito, ergo sum,” or “I think, therefore I am” (7:140). Descartes observes that the cogito result is known only from the fact that it is “clearly and distinctly” perceived by the intellect (7:35). Hence, he sets up clear and distinct intellectual perception, independent of the senses, as the mark of truth (7:35, 62, 73).

Descartes then unfolds the results of clear and distinct perception in Meditations III–VI, and he repeats and extends these results in Principles I–II. We consider these results in Secs. 3.3–3.5. For now, let us examine what Descartes thought about the senses as a source of knowledge that was different from the pure intellect.

Descartes famously calls the senses into doubt in the First Meditation, and he affirms in Meditation Six that the senses are not meant to provide knowledge of the “essential nature” of external objects (7:83). In that way, his position in the Meditations differs from that in the Rules, for in that work he allowed that some “simple natures” pertaining to corporeal things can and should be considered through the images of the senses (10:383, 417). In the Meditations, he held that the essence of matter could be apprehended by innate ideas, independently of any sensory image (7:64–5, 72–3). To that extent, his later position agrees with the Platonic tradition in philosophy, which denigrated sensory knowledge and held that the things known by the intellect have a higher reality than the objects of the senses. Descartes, however, was no Platonist, a point to which we will return. His attitude toward the senses in his mature period was not one of total disparagement.

Descartes assigned two roles to the senses in the acquisition of human knowledge. First, he acknowledged that the senses are usually adequate for detecting benefits and harms for the body. Indeed, he considered their natural function to be “to inform the mind of what is beneficial or harmful for the composite of which the mind is a part” (7:83), that is, for the composite of mind and body. In this connection, he was agreeing with the conception of the function of the senses that was widely shared in the traditional literature in natural philosophy, including the Aristotelian literature, as well as in the medical literature on the natural functions of the senses.

Second, he recognized that the senses have an essential role to play in natural philosophy. The older interpretive literature sometimes had Descartes claiming that he could derive all natural philosophical or scientific knowledge from the pure intellect, independent of the senses. But Descartes knew full well that he could not do that. He distinguished between the general principles of his physics and the more particular mechanisms that he posited to explain natural phenomena, such as magnetism or the properties of oil and water. He claimed to derive the general principles “from certain seeds of truth” that are innate in the mind (6:64). These include the fundamental doctrine that the essence of matter is extension (Princ. II.3–4, IV.203). As to particular phenomena, in general he had to rely on observations to determine their properties (such as the properties of the magnet), and he acknowledged that multiple hypotheses about subvisible mechanisms could be constructed to account for those phenomena. The natural philosopher must, therefore, test the various hypotheses by their consequences, and consider empirical virtues such as simplicity and scope (Disc. VI; Princ. IV.201–6). Further, Descartes knew that some problems rely on measurements that can only be made with the senses, including determining the size of the sun (7:80) or the refractive indexes of various materials (Met. VIII).

Although Descartes recognized an important role for the senses in natural philosophy, he also limited the role of sense-based knowledge by comparison with Aristotelian epistemology. According to many scholastic Aristotelians, all intellectual content arises through a process of intellectual abstraction that starts from sensory images as present in the faculty of imagination. Mathematical objects are formed by abstraction from such images. Even metaphysics rests on knowledge derived by abstraction from images. Of course, in this Aristotelian scheme the intellect plays an important role in grasping mathematical objects or the essences of natural things through considering images. By contrast, Descartes affirmed that the truths of mathematics and metaphysics are grasped by the intellect operating independently of the senses and without need for assistance from the faculty of imagination. Descartes designated the exercise of the intellectual capacity apart from sense-based images the use of the “pure intellect.”

In Descartes'' scheme of mental capacities, knowledge does not arise from the intellect alone. The intellect may present some content as true, but by itself it does not affirm or deny that truth. That function belongs to the will. A judgment, and hence an instance of (at least putative) knowledge, does not arise in this scheme until the will has affirmed or denied the content presented by the intellect.', 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'A New Metaphysics', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (18, N'Standards of beauty are different in different eras, and in Socrates''s time beauty could easily be measured by the standard of the gods, stately, proportionate sculptures of whom had been adorning the Athenian acropolis since about the time Socrates reached the age of thirty. Good looks and proper bearing were important to a man''s political prospects, for beauty and goodness were linked in the popular imagination. The extant sources agree that Socrates was profoundly ugly, resembling a satyr more than a man—and resembling not at all the statues that turned up later in ancient times and now grace Internet sites and the covers of books. He had wide-set, bulging eyes that darted sideways and enabled him, like a crab, to see not only what was straight ahead, but what was beside him as well; a flat, upturned nose with flaring nostrils; and large fleshy lips like an ass. Socrates let his hair grow long, Spartan-style (even while Athens and Sparta were at war), and went about barefoot and unwashed, carrying a stick and looking arrogant. He didn''t change his clothes but efficiently wore in the daytime what he covered himself with at night. Something was peculiar about his gait as well, sometimes described as a swagger so intimidating that enemy soldiers kept their distance. He was impervious to the effects of alcohol and cold, but this made him an object of suspicion to his fellow soldiers on campaign. We can safely assume an average height (since no one mentions it at all), and a strong build, given the active life he appears to have led. Against the iconic tradition of a pot-belly, Socrates and his companions are described as going hungry (Aristophanes, Birds 1280–83). On his appearance, see Plato''s Theaetetus 143e, and Symposium 215a-c, 216c-d, 221d-e; Xenophon''s Symposium 4.19, 5.5–7; and Aristophanes''s Clouds 362. Brancusi''s oak sculpture, standing 51.25 inches including its base, captures Socrates''s appearance and strangeness in the sense that it looks different from every angle, including a second “eye” that cannot be seen if the first is in view. (See the Museum of Modern Art''s page on Brancusi''s Socrates which offers additional views.) Also true to Socrates''s reputation for ugliness, but less available, are the drawings of the contemporary Swiss artist, Hans Erni.', 0, N'In the late fifth century B.C.E., it was more or less taken for granted that any self-respecting Athenian male would prefer fame, wealth, honors, and political power to a life of labor. Although many citizens lived by their labor in a wide variety of occupations, they were expected to spend much of their leisure time, if they had any, busying themselves with the affairs of the city. Men regularly participated in the governing Assembly and in the city''s many courts; and those who could afford it prepared themselves for success at public life by studying with rhetoricians and sophists from abroad who could themselves become wealthy and famous by teaching the young men of Athens to use words to their advantage. Other forms of higher education were also known in Athens: mathematics, astronomy, geometry, music, ancient history, and linguistics. What seemed strange about Socrates is that he neither labored to earn a living, nor participated voluntarily in affairs of state. Rather, he embraced poverty and, although youths of the city kept company with him and imitated him, Socrates adamantly insisted he was not a teacher (Plato, Apology 33a-b) and refused all his life to take money for what he did. The strangeness of this behavior is mitigated by the image then current of teachers and students: teachers were viewed as pitchers pouring their contents into the empty cups that were the students. Because Socrates was no transmitter of information that others were passively to receive, he resists the comparison to teachers. Rather, he helped others recognize on their own what is real, true, and good (Plato, Meno, Theaetetus)—a new, and thus suspect, approach to education. He was known for confusing, stinging and stunning his conversation partners into the unpleasant experience of realizing their own ignorance, a state sometimes superseded by genuine intellectual curiosity.

It did not help matters that Socrates seemed to have a higher opinion of women than most of his companions had, speaking of “men and women,” “priests and priestesses,” and naming foreign women as his teachers: Socrates claimed to have learned rhetoric from Aspasia of Miletus, the lover of Pericles (Plato, Menexenus); and to have learned erotics from the priestess Diotima of Mantinea (Plato, Symposium). Socrates was unconventional in a related respect. Athenian citizen males of the upper social classes did not marry until they were at least thirty, and Athenian females were poorly educated and kept sequestered until puberty, when they were given in marriage by their fathers. Thus the socialization and education of males often involved a relationship for which the English word ‘pederasty’ (though often used) is misleading, in which a youth approaching manhood, fifteen to seventeen, became the beloved of a male lover a few years older, under whose tutelage and through whose influence and gifts, the younger man would be guided and improved. It was assumed among Athenians that mature men would find youths sexually attractive, and such relationships were conventionally viewed as beneficial to both parties by family and friends alike. A degree of hypocrisy (or denial), however, was implied by the arrangement: “officially” it did not involve sexual relations between the lovers and, if it did, then the beloved was not supposed to derive pleasure from the act—but ancient evidence (comedies, vase paintings, et al.) shows that both restrictions were often violated (Dover 1989, 204). What was odd about Socrates is that, although he was no exception to the rule of finding youths attractive (Plato, Charmides 155d, Protagoras 309a-b; Xenophon, Symposium 4.27–28), he refused the physical advances of even his favorite (Plato, Symposium 219b-d) and kept his eye on the improvement of their, and all the Athenians'', souls (Plato, Apology 30a-b), a mission he said he had been assigned by the oracle of Apollo at Delphi, if he was interpreting his friend Chaerephon''s report correctly (Plato, Apology 20e–23b), a preposterous claim in the eyes of his fellow citizens. Socrates also acknowledged a rather strange personal phenomenon, a daimonion or internal voice that prohibited his doing certain things, some trivial and some important, often unrelated to matters of right and wrong (thus not to be confused with the popular notions of a superego or a conscience); the implication that he was guided by something he regarded as divine or semi-divine was suspect to other Athenians.

Socrates was usually to be found in the marketplace and other public areas, conversing with a variety of different people—young and old, male and female, slave and free, rich and poor—that is, with virtually anyone he could persuade to join with him in his question-and-answer mode of probing serious matters. Socrates''s lifework consisted in the examination of people''s lives, his own and others'', because “the unexamined life is not worth living for a human being,” as he says at his trial (Plato, Apology 38a). Socrates pursued this task single-mindedly, questioning people about what matters most, e.g., courage, love, reverence, moderation, and the state of their souls generally. He did this regardless of whether his respondents wanted to be questioned or resisted him; and Athenian youths imitated Socrates''s questioning style, much to the annoyance of some of their elders. He had a reputation for irony, though what that means exactly is controversial; at a minimum, Socrates''s irony consisted in his saying that he knew nothing of importance and wanted to listen to others, yet keeping the upper hand in every discussion. One further aspect of Socrates''s much-touted strangeness should be mentioned: his dogged failure to align himself politically with oligarchs or democrats; rather, he had friends and enemies among both, and he supported and opposed actions of both (see §3).', 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'Strangeness', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (19, N'The Laws comprises a conversation in 12 books, set on Crete, among three interlocutors: an unnamed Athenian Visitor (Plato’s spokesman in the Laws), Megillus, a Spartan, and Kleinias, a Cretan. The Athenian proposes that the three discuss governance and laws as they walk along the long road to the temple of Zeus. The first two books of the dialogue consider the proper goal or end (telos) of legislation, which turns out to be the virtue of the citizens. They also contain discussion of topics, such as ethical psychology and education, which will help them to understand how a city could achieve this goal. The third book turns to a discussion of the origins of political systems (politeia) and of changes in those political systems, and attempts to draw lessons for the lawmaker from the histories of various actual states, including Persia, Sparta, Crete, and Athens. At the end of Book 3 (Laws 702B4-D5), Kleinias reveals that he has a practical use for just the kinds of discussions they’ve been having: the cities of Crete have decided to found a new city, to be named Magnesia, in a long abandoned part of Crete, and he, along with nine others, is to be responsible for doing so. He asks the Athenian to help in the construction of the new city’s constitution and laws. The Athenian agrees, and proposes that they use a new method of law-giving – one in which preludes which aim at persuading the citizens come before the laws themselves. Books 4–5 contain an argument for the use of preludes and the Great Prelude to the laws in general. The Great Prelude to the laws in general ends in the latter part of Book 5, after which the Athenian proceeds to sketch, often in considerable detail, the constitution, the political and social institutions, and the laws of this new city, along with the political and ethical principles that justify them', 0, N'The dialogue begins with an investigation into the reasons for the laws and social practices of Sparta and Crete. The Athenian argues that laws ought to be justified not by reference to war – which is how both Megillus and Kleinias first attempt to justify the laws of their own cities – but rather by reference to what is best, which is complete virtue (that is, courage, justice, moderation, and wisdom, rather than courage alone). In fact, the Athenian says that the complete virtue of the citizens as a whole should be the single goal of the lawgiver (Laws 630C3–6; see also e.g., 705D3–706A4, 963A).[4] The Athenian also tells us that laws are true laws insofar as they promote the happiness (eudaimonia) of the citizens (Laws 631B; see also 715B, 743C-D). Immediately after he first makes this latter claim, he draws a distinction between human and divine goods and tells us that the human goods – like wealth and health – are dependent upon the divine goods, of which wisdom is first, then moderation, then justice, and finally courage; he later describes this dependency by saying that the human goods are good for someone who is virtuous but bad for bad men (Laws 661B-C). The dependency thesis helps Plato bring together the two characterizations of the goal of the laws in terms of the citizens’ virtue and happiness, respectively: if virtue is necessary for benefit and thus for happiness, promoting the happiness of the citizens will require making them virtuous. This dependency thesis, as well as the dual characterization of the goal of the laws, raises but leaves unanswered questions about the precise relation between virtue and happiness, however: for example, is virtue actually sufficient for happiness, or is it simply necessary?[5]

The remainder of Book 1 is concerned with ethical psychology and education: that is, with beginning the project of showing how a city could produce citizens who possess complete virtue. This discussion heavily emphasizes the importance of feeling pleasure and pain correctly; the Athenian, in fact, claims that “[For] human beings who inquire into laws almost their entire inquiry concerns pleasures and pains, in cities and in private dispositions. These two springs flow forth by nature, and he who draws from the right one, at the right time, and in the right amount is happy.” (Laws 636D5-E1). This phase of the discussion begins with the Athenian announcing his intention to discuss the institutions which promote courage, which he swiftly notes should cover the ability to resist pleasure in addition to the ability to resist pain. He proposes controlled symposia (drinking parties) as the institution which will train this ability to resist pleasure, to the surprise of his interlocutors. As this sort of training will serve as an important part of ethical education, this suggestion leads the Athenian to discuss education in general. Education involves the direction of a child’s pleasures, desires, and love towards his adult occupation; in the case of the citizens, education must draw their souls to a desire and love of being a perfect citizen who rules and is ruled in accordance with justice (Laws 643C-D). Pleasure is clearly central to the account of ethical psychology and education in the Laws, and one important question to ask of the Laws is why this is so. Is coming to have the correct pleasures simply of instrumental value (insofar as it blocks one route to akratic action and vice or focuses the child on the things which he must come to find valuable), or are at least some of these pleasures good in their own right, e.g. in virtue of their contents?[6]

The discussion of Book 1 closes with a model of the soul which, the Athenian says, will make it clearer what virtue and vice are, and will help us to understand what effects various sorts of educational practices, such as the symposia, should be expected to have on the human soul (Laws 645C).[7] The model is one of a puppet (thauma)[8] made by the gods, possessing three cords, two, hard and iron, representing the expectations of pleasure and pain, and one, soft and gold, representing reason or calculation (Laws 644D). This model differs in noteworthy ways from the image of the soul as composed of a human, a lion, and a hydra-headed beast in the Republic and the charioteer and two horses of the Phaedrus.[9] The three elements in the puppet image are affections rather than possessors of affections; and the most important division here is between the two iron cords and the golden cord, with no fundamental difference (of the sort that we see when spirit is called reason’s natural ally in the Republic) between the two iron cords. How to explain the differences in the model of the soul that we get here from the ones we get in other dialogues is another important question for interpreters of the Laws.[10]', 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'The Laws - Book One', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([ArticleId], [Abstract], [Approved], [Body], [ContributorId], [PublishDate], [Reviewed], [Title], [SubmitDate]) VALUES (20, N'
The material cause: “that out of which”, e.g., the bronze of a statue.
The formal cause: “the form”, “the account of what-it-is-to-be”, e.g., the shape of a statue.
The efficient cause: “the primary source of the change or rest”, e.g., the artisan, the art of bronze-casting the statue, the man who gives advice, the father of the child.
The final cause: “the end, that for the sake of which a thing is done”, e.g., health is the end of walking, losing weight, purging, drugs, and surgical tools.', 0, N'All the four (types of) causes may enter in the explanation of something. Consider the production of an artifact like a bronze statue. The bronze enters in the explanation of the production of the statue as the material cause. Note that the bronze is not only the material out of which the statue is made; it is also the subject of change, that is, the thing that undergoes the change and results in a statue. The bronze is melted and poured in order to acquire a new shape, the shape of the statue. This shape enters in the explanation of the production of the statue as the formal cause. However, an adequate explanation of the production of a statue requires also a reference to the efficient cause or the principle that produces the statue. For Aristotle, this principle is the art of bronze-casting the statue (Phys. 195 a 6-8. Cf. Metaph. 1013 b 6–9). This is mildly surprising and requires a few words of elaboration. There is no doubt that the art of bronze-casting resides in an individual artisan who is responsible for the production of the statue. But, according to Aristotle, all the artisan does in the production of the statue is the manifestation of specific knowledge. This knowledge, not the artisan who has mastered it, is the salient explanatory factor that one should pick as the most accurate specification of the efficient cause (Phys. 195 b 21–25). By picking the art, not the artisan, Aristotle is not just trying to provide an explanation of the production of the statue that is not dependent upon the desires, beliefs and intentions of the individual artisan; he is trying to offer an entirely different type of explanation; an explanation that does not make a reference, implicit or explicit, to these desires, beliefs and intentions. More directly, the art of bronze-casting the statue enters in the explanation as the efficient cause because it helps us to understand what it takes to produce the statue; that is to say, what steps are required to produce the statue. But can an explanation of this type be given without a reference to the final outcome of the production, the statue? The answer is emphatically “no”. A model is made for producing the statue. A mold is prepared for producing the statue. The bronze is melted and poured for producing the statue. Both the prior and the subsequent stage are for the sake of a certain end, the production of the statue. Clearly, the statue enters in the explanation of each step of the artistic production as the final cause or that for the sake of which everything in the production process is done.

In thinking about the four causes, we have come to understand that Aristotle offers a teleological explanation of the production of a bronze statue; that is to say, an explanation that makes a reference to the telos or end of the process. Moreover, a teleological explanation of the type sketched above does not crucially depend upon the application of psychological concepts such as desires, beliefs and intentions. This is important because artistic production provides Aristotle with a teleological model for the study of natural processes, whose explanation does not involve beliefs, desires, intentions or anything of this sort. Some have contended that Aristotle explains natural process on the basis of an inappropriately psychological teleological model; that is to say, a teleological model that involves a purposive agent who is somehow sensitive to the end. This objection can be met if the artistic model is understood in non-psychological terms. In other words, Aristotle does not psychologize nature because his study of the natural world is based on a teleological model that is consciously free from psychological factors. (For further information on the role that artistic production plays in developing an explanatory model for the study of nature, see Broadie 1987, pp. 35–50.)

One final clarification is needed. By insisting on the art of bronze-casting as the most accurate efficient cause of the production of the statue, Aristotle does not mean to preclude an appeal to the beliefs and desires of the individual artisan. On the contrary, there are cases where the individual realization of the art obviously enters in the explanation of the bronze statue. For example, one may be interested in a particular bronze statue because that statue is the great achievement of an artisan who has not only mastered the art but has also applied it with a distinctive style. In this case it is perfectly appropriate to make reference to the beliefs and desires of the artisan. Aristotle seems to make room for this case when he says that we should look “for general causes of general things and for particular causes of particular things” (Phys. 195 a 25–26). Note, however, that the idiosyncrasies that may be important in studying a particular bronze statue as the great achievement of an individual artisan may be extraneous to a more central (and more interesting) case. To understand why let us focus on the study of nature. When the student of nature is concerned with the explanation of a natural phenomenon like the formation of sharp teeth in the front and broad molars in the back of the mouth, the student of nature is concerned with what is typical about that phenomenon. In other words, the student of nature is expected to provide an explanation of why certain animals typically have a certain dental arrangement. We shall return to this example in due course. For the time being, it is important to emphasize this important feature of Aristotle''s explanatory project; a feature that we must keep in mind in trying to understand his theory of causality. This theory has in fact been developed primarily (but not exclusively) for the study of nature.', 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'The Four Causes', CAST(N'2016-05-15T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Articles] OFF
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
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'd29a53fb-8e4c-4903-bc3c-973de0f432cc', 0, N'48931da5-1b33-4b7e-a7b3-d7ebcde5286d', N'dmdiehr@outlook.com', 0, 1, 1, NULL, N'DMDIEHR@OUTLOOK.COM', N'DMDIEHR', N'AQAAAAEAACcQAAAAECUJwHUbmgSFs835BVAh0SmMd1N3yrqhB1mfOwj5PMwhLh8F/Y6mbROvUlRE8Q/Crg==', NULL, 0, N'fb8468c8-427c-4497-ba71-990d333607b3', CAST(N'2016-05-08T00:00:00.0000000' AS DateTime2), 0, N'dmdiehr')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [IsContributor], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [StartDate], [TwoFactorEnabled], [UserName]) VALUES (N'eb091a81-b04e-4fb4-ace3-463c79fafda9', 0, N'7a375b27-6f5f-4158-87bc-adcf791653f7', N'spinoza@spinoza.com', 0, 1, 1, NULL, N'SPINOZA@SPINOZA.COM', N'SPINOZA', N'AQAAAAEAACcQAAAAEONrijYcUvB6bjC4usD1UMCSmx57hgNwucclVo2FHPr+YNh58sbapWH4ARL5APyE3w==', NULL, 0, N'2fc74e9c-9e48-4c62-af84-bf80a70ed3b1', CAST(N'2016-05-12T00:00:00.0000000' AS DateTime2), 0, N'spinoza')
SET IDENTITY_INSERT [dbo].[Contributors] ON 

INSERT [dbo].[Contributors] ([ContributorId], [ApplicationUserId], [Bio], [ImageLink], [Name], [PublicEmail], [Role], [StartDate], [UserName]) VALUES (1, N'd29a53fb-8e4c-4903-bc3c-973de0f432cc', N'The problem with the world is that fools and fanatics are certain of themselves while the wise are full of doubts. There can be no peace until the philosophers rule as king or the kings rule as philosophers. For we stand on the shoulders of giants, to look into the abyss as it looks back into us. But alas, I suffer from the disease of the learned. I can be no king. An intelligent man cannot seriously become anything, it is only the fool who becomes something.
I am hack, I despise myself but at least I know I''m a hack and that''s respectable.', N'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRjMO_geFIxZwVKfRT44hW-Jw3FT0Oe8BW1x2e24ePYwu8XbgIE1g', N'Philosopher Peasant', N'abyss@PhilosopherPeasant.com', N'Editor in chief', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'dmdiehr')
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
/****** Object:  Index [RoleNameIndex]    Script Date: 5/15/2016 9:59:20 PM ******/
CREATE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 5/15/2016 9:59:20 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/15/2016 9:59:20 PM ******/
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
