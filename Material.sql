USE [master]
GO
/****** Object:  Database [Material]    Script Date: 2017/7/6 12:58:06 ******/
CREATE DATABASE [Material]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Material', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Material.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Material_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Material_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Material] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Material].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Material] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Material] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Material] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Material] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Material] SET ARITHABORT OFF 
GO
ALTER DATABASE [Material] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Material] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Material] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Material] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Material] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Material] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Material] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Material] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Material] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Material] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Material] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Material] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Material] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Material] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Material] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Material] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Material] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Material] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Material] SET  MULTI_USER 
GO
ALTER DATABASE [Material] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Material] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Material] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Material] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Material] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Material]
GO
/****** Object:  Table [dbo].[Collection]    Script Date: 2017/7/6 12:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collection](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SCID] [int] NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Download]    Script Date: 2017/7/6 12:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Download](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SCID] [int] NOT NULL,
 CONSTRAINT [PK_Download] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SCdetails]    Script Date: 2017/7/6 12:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCdetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](50) NOT NULL,
	[CollectionNumber] [int] NULL,
	[DownloadNumber] [int] NULL,
	[SeeNumber] [int] NULL,
	[PictureURL] [text] NULL,
	[FileURL] [nvarchar](50) NULL,
	[UserID] [int] NOT NULL,
	[UploadTime] [nvarchar](100) NOT NULL,
	[SCState] [bit] NOT NULL CONSTRAINT [DF_SCdetails_SCType]  DEFAULT ((1)),
 CONSTRAINT [PK_SCdetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Userinfo]    Script Date: 2017/7/6 12:58:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Userinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](6) NOT NULL,
	[UserPassword] [nvarchar](10) NOT NULL,
	[Integral] [int] NOT NULL CONSTRAINT [DF_Userinfo_Integral]  DEFAULT ((0)),
	[State] [bit] NOT NULL CONSTRAINT [DF_Userinfo_State]  DEFAULT ((1)),
	[Role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Collection] ON 

INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (1, 2, 1)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (2, 2, 2)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (3, 2, 3)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (4, 2, 4)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (5, 2, 1)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (6, 2, 3)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (7, 2, 1)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (8, 2, 1)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (9, 2, 3)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (10, 2, 5)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (11, 2, 16)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (12, 2, 17)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (13, 2, 18)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (14, 2, 7)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (15, 2, 12)
INSERT [dbo].[Collection] ([ID], [UserID], [SCID]) VALUES (16, 2, 19)
SET IDENTITY_INSERT [dbo].[Collection] OFF
SET IDENTITY_INSERT [dbo].[Download] ON 

INSERT [dbo].[Download] ([ID], [UserID], [SCID]) VALUES (2, 2, 2)
INSERT [dbo].[Download] ([ID], [UserID], [SCID]) VALUES (4, 2, 3)
INSERT [dbo].[Download] ([ID], [UserID], [SCID]) VALUES (5, 2, 3)
INSERT [dbo].[Download] ([ID], [UserID], [SCID]) VALUES (6, 2, 2)
INSERT [dbo].[Download] ([ID], [UserID], [SCID]) VALUES (7, 2, 17)
INSERT [dbo].[Download] ([ID], [UserID], [SCID]) VALUES (8, 2, 19)
INSERT [dbo].[Download] ([ID], [UserID], [SCID]) VALUES (9, 2, 7)
SET IDENTITY_INSERT [dbo].[Download] OFF
SET IDENTITY_INSERT [dbo].[SCdetails] ON 

INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (1, N'图片模板', N'图片模板1', 1, 1, 27, N'/Content/images/Upimages/8163e96b-1521-41f5-860d-ea7867b1464e.jpg', N'', 1, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (2, N'图片模板', N'图片模板2', 2, 1, 7, N'/Content/images/Upimages/bb7ae50c-2b14-4c2b-9763-4bc21c4d878b.jpg', N'', 1, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (3, N'图片模板', N'图片模板3', 3, 4, 13, N'/Content/images/Upimages/643b4141-6c48-47b5-a0e2-6a0be6d455a7.jpg', N'', 1, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (4, N'图片模板', N'图片模板4', 1, 15, 15, N'/Content/images/Upimages/256da783-809f-4f96-a260-52d36ce288de.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (5, N'图片模板', N'图片模板5', 1, 9, 17, N'/Content/images/Upimages/c5752205-b6a6-4a68-b41e-c25df407d6d7.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (6, N'图片模板', N'图片模板6', 2, 1, 1, N'/Content/images/Upimages/203c4a7c-7e8d-4178-96ff-0b0c59544fb4.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (7, N'图片模板', N'图片模板7', 2, 4, 4, N'/Content/images/Upimages/4f94b8e3-8994-4a86-97f4-3bbfecc8a5f5.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (8, N'图片模板', N'图片模板8', 4, 1, 3, N'/Content/images/Upimages/ad4e4695-e56d-49fa-9be9-7ebbd1c5263c.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (9, N'图片模板', N'图片模板9', 1, 3, 2, N'/Content/images/Upimages/5a610530-4d78-414b-82dd-5e3ac8b204bc.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (10, N'图片模板', N'图片模板10', 2, 1, 11, N'/Content/images/Upimages/2f10d155-6636-4541-b0d6-cca69ce2bf1c.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (11, N'图片模板', N'图片模板11', 1, 2, 5, N'/Content/images/Upimages/5e053d19-6d4b-4687-a2ed-09afbe0a1bb2.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (12, N'图片模板', N'图片模板12', 6, 1, 2, N'/Content/images/Upimages/dfd96969-a6e0-432d-bb1a-4d9217268d32.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (13, N'图片模板', N'图片模板13', 1, 1, 6, N'/Content/images/Upimages/365cebaa-6d8d-4d2b-8817-6dafb3aec0ac.jpg', N'', 2, N'2017/7/4', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (16, N'图片模板', N'图片模板14', 4, 19, 109, N'/Content/images/Upimages/230d46f7-5d20-4e71-aa07-9ae945916a1e.jpg', N'', 2, N'2017/7/5', 0)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (17, N'图片模板', N'图片模板15', 2, 3, 12, N'/Content/images/Upimages/d81ae362-8d2a-4c70-a967-bf22bf54eef3.jpg', N'', 2, N'2017/7/5', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (18, N'图片模板', N'图片模板16', 2, 1, 4, N'/Content/images/Upimages/bb303401-12f0-4307-a11e-2b8a3aae9acb.jpg', N'', 2, N'2017/7/5', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (19, N'背景', N'图片模板17', 2, 2, 6, N'/Content/images/Upimages/ef93bc8e-f930-4943-90a2-22ffeaa334f5.jpg', N'', 2, N'2017/7/6', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (20, N'背景2', N'背景2', 1, 1, 1, N'/Content/images/Upimages/3c4a46ef-d9be-43f2-add3-6e9a99d420da.jpg', N'', 1, N'2017/7/6', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (21, N'背景3', N'背景3', 1, 1, 1, N'/Content/images/Upimages/4f673c38-6d1f-4062-98c9-52e3f508f098.jpg', N'', 2, N'2017/7/6', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (22, N'背景4', N'背景4', 1, 1, 1, N'/Content/images/Upimages/cf744c3a-7b4f-4673-b080-adbd9eb0e2e3.jpg', N'', 2, N'2017/7/6', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (23, N'背景5', N'背景5', 1, 1, 1, N'/Content/images/Upimages/cedab79a-d9ed-4b4e-a406-935cf4769022.jpg', N'', 2, N'2017/7/6', 1)
INSERT [dbo].[SCdetails] ([ID], [Title], [Details], [CollectionNumber], [DownloadNumber], [SeeNumber], [PictureURL], [FileURL], [UserID], [UploadTime], [SCState]) VALUES (24, N'图片素材', N'小黄人的图片素材哦', 1, 1, 1, N'/Content/images/Upimages/7bcf5292-8bab-4aa3-8e59-b2068fe92fc4.jpg', N'', 2, N'2017/7/6', 1)
SET IDENTITY_INSERT [dbo].[SCdetails] OFF
SET IDENTITY_INSERT [dbo].[Userinfo] ON 

INSERT [dbo].[Userinfo] ([ID], [UserName], [UserPassword], [Integral], [State], [Role]) VALUES (1, N'admin', N'admin1', 0, 1, N'admin ')
INSERT [dbo].[Userinfo] ([ID], [UserName], [UserPassword], [Integral], [State], [Role]) VALUES (2, N'admin1', N'admin1', 0, 1, N'user  ')
SET IDENTITY_INSERT [dbo].[Userinfo] OFF
ALTER TABLE [dbo].[Download]  WITH NOCHECK ADD  CONSTRAINT [FK_Download_SCdetails] FOREIGN KEY([UserID])
REFERENCES [dbo].[SCdetails] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Download] NOCHECK CONSTRAINT [FK_Download_SCdetails]
GO
USE [master]
GO
ALTER DATABASE [Material] SET  READ_WRITE 
GO
