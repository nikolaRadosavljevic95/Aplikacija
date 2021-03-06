USE [master]
GO
/****** Object:  Database [WordCounter]    Script Date: 02-Nov-21 3:01:09 AM ******/
CREATE DATABASE [WordCounter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WordCounter', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WordCounter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WordCounter_log', FILENAME = N'D:\Program Files (x86)\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WordCounter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WordCounter] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WordCounter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WordCounter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WordCounter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WordCounter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WordCounter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WordCounter] SET ARITHABORT OFF 
GO
ALTER DATABASE [WordCounter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WordCounter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WordCounter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WordCounter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WordCounter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WordCounter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WordCounter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WordCounter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WordCounter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WordCounter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WordCounter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WordCounter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WordCounter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WordCounter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WordCounter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WordCounter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WordCounter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WordCounter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WordCounter] SET  MULTI_USER 
GO
ALTER DATABASE [WordCounter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WordCounter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WordCounter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WordCounter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WordCounter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WordCounter] SET QUERY_STORE = OFF
GO
USE [WordCounter]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02-Nov-21 3:01:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RandomTexts]    Script Date: 02-Nov-21 3:01:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RandomTexts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_RandomTexts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211101235435_Initial', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211102002218_MaxLengthApplied', N'5.0.11')
GO
SET IDENTITY_INSERT [dbo].[RandomTexts] ON 

INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (1, N'She suspicion dejection saw instantly. Well deny may real one told yet saw hard dear. Bed chief house rapid right the. Set noisy one state tears which. No girl oh part must fact high my he. Simplicity in excellence melancholy as remarkably discovered. Own partiality motionless was old excellence she inquietude contrasted. Sister giving so wicket cousin of an he rather marked.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (2, N'Imagine was you removal raising gravity. Unsatiable understood or expression dissimilar so sufficient. Its party every heard and event gay. Advice he indeed things adieus in number so uneasy. To many four fact in he fail. My hung it quit next do of. It fifteen charmed by private savings it mr.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (3, N'Unpacked now declared put you confined daughter improved. Celebrated imprudence few interested especially reasonable off one. Wonder bed elinor family secure met. It want gave west into high no in.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (4, N'Alteration literature to or an sympathize mr imprudence. Of is ferrars subject as enjoyed or tedious cottage. Procuring as in resembled by in agreeable. Next long no gave mr eyes. Admiration advantages no he celebrated so pianoforte unreserved.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (5, N'Certainty determine at of arranging perceived situation or. Or wholly pretty county in oppose. Favour met itself wanted settle put garret twenty. In astonished apartments resolution so an it.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (6, N'Parish so enable innate in formed missed. Hand two was eat busy fail. Stand smart grave would in so. Be acceptance at precaution astonished excellence thoroughly is entreaties. Who decisively attachment has dispatched.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (7, N'Full he none no side. Uncommonly surrounded considered for him are its. It we is read good soon. My to considered delightful invitation announcing of no decisively boisterous. Did add dashwoods deficient man concluded additions resources. Or landlord packages overcame distance smallest in recurred.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (8, N'Ferrars all spirits his imagine effects amongst neither. It bachelor cheerful of mistaken. Tore has sons put upon wife use bred seen. Its dissimilar invitation ten has discretion unreserved. Had you him humoured jointure ask expenses learning. Blush on in jokes sense do do.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (9, N'As collected deficient objection by it discovery sincerity curiosity. Quiet decay who round three world whole has mrs man. Built the china there tried jokes which gay why. Assure in adieus wicket it is.')
INSERT [dbo].[RandomTexts] ([Id], [Text]) VALUES (10, N'By in no ecstatic wondered disposal my speaking. Direct wholly valley or uneasy it at really. Sir wish like said dull and need make. Sportsman one bed departure rapturous situation disposing his. Off say yet ample ten ought hence. Depending in newspaper an september do existence strangers.')
SET IDENTITY_INSERT [dbo].[RandomTexts] OFF
GO
ALTER TABLE [dbo].[RandomTexts] ADD  DEFAULT (N'') FOR [Text]
GO
USE [master]
GO
ALTER DATABASE [WordCounter] SET  READ_WRITE 
GO
