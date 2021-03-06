USE [master]
GO
/****** Object:  Database [webbansach]    Script Date: 2/18/2021 9:31:16 AM ******/
CREATE DATABASE [webbansach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webbansach', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\webbansach.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webbansach_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\webbansach_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [webbansach] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webbansach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webbansach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webbansach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webbansach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webbansach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webbansach] SET ARITHABORT OFF 
GO
ALTER DATABASE [webbansach] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [webbansach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webbansach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webbansach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webbansach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webbansach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webbansach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webbansach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webbansach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webbansach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [webbansach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webbansach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webbansach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webbansach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webbansach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webbansach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webbansach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webbansach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webbansach] SET  MULTI_USER 
GO
ALTER DATABASE [webbansach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webbansach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webbansach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webbansach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webbansach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [webbansach] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [webbansach] SET QUERY_STORE = OFF
GO
USE [webbansach]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/18/2021 9:31:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2/18/2021 9:31:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] NOT NULL,
	[commentedDate] [datetime] NOT NULL,
	[userId] [nvarchar](50) NOT NULL,
	[contentOfComment] [nvarchar](max) NOT NULL,
	[productId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/18/2021 9:31:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/18/2021 9:31:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Telephone] [int] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/18/2021 9:31:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[Special] [bit] NOT NULL,
	[Author] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/18/2021 9:31:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Telephone] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [webbansach] SET  READ_WRITE 
GO
