USE [master]
GO
/****** Object:  Database [RentACarDb]    Script Date: 3.01.2022 01:51:57 ******/
CREATE DATABASE [RentACarDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentACarDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RentACarDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentACarDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RentACarDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RentACarDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentACarDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentACarDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentACarDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentACarDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentACarDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentACarDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentACarDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentACarDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentACarDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentACarDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentACarDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentACarDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentACarDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentACarDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentACarDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentACarDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentACarDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentACarDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentACarDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentACarDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentACarDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentACarDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentACarDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentACarDb] SET RECOVERY FULL 
GO
ALTER DATABASE [RentACarDb] SET  MULTI_USER 
GO
ALTER DATABASE [RentACarDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentACarDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentACarDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentACarDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentACarDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RentACarDb', N'ON'
GO
ALTER DATABASE [RentACarDb] SET QUERY_STORE = OFF
GO
USE [RentACarDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RentACarDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3.01.2022 01:51:57 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[Id] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CardNumber] [varchar](50) NOT NULL,
	[CardPassword] [varchar](50) NOT NULL,
	[Money] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NULL,
	[ImagePath] [varchar](200) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_CarImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[ModelYear] [int] NOT NULL,
	[DailyPrice] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[GearboxType] [nvarchar](20) NULL,
	[MotorType] [nvarchar](15) NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RentDate] [datetime2](7) NOT NULL,
	[ReturnDate] [datetime2](7) NULL,
	[CarId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3.01.2022 01:51:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name]) VALUES (1, N'BMW')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'Mercedes-BENZ')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Peugeot')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'Renault')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Ford')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (6, N'Hyundai')
SET IDENTITY_INSERT [dbo].[Brands] OFF
INSERT [dbo].[Cards] ([Id], [CustomerId], [CardNumber], [CardPassword], [Money]) VALUES (1, 10, N'353453451626273', N'2666', CAST(5000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cards] ([Id], [CustomerId], [CardNumber], [CardPassword], [Money]) VALUES (2, 11, N'353456452364650', N'1231', CAST(35000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cards] ([Id], [CustomerId], [CardNumber], [CardPassword], [Money]) VALUES (3, 12, N'546454741203434', N'4656', CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cards] ([Id], [CustomerId], [CardNumber], [CardPassword], [Money]) VALUES (4, 13, N'7697895794745741', N'6574', CAST(2778.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (1, 20, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master\maxresdefault.jpg', CAST(N'2021-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (2, 21, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master\makyajli-2020-bmw-7-serisi-3.jpg', CAST(N'2021-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (3, 22, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master\images.jfif', CAST(N'2021-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (4, 23, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2021-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (5, 24, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2021-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (6, 25, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2021-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (7, 26, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2021-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (9, 28, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2021-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (10, 29, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2022-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (11, 30, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2022-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [CreatedDate]) VALUES (12, 31, N'F:\Ne alırsan 1 lira\Üniversite Dersler\Dersler\5.Dönem 3.sınıf\database systems\ReCapProject-master\Rent-A-Car-Project-master\Rent-A-Car-Project-master', CAST(N'2022-01-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (20, 1, 1, 2018, 750, N'540d', N'Automatic', N'Diesel')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (21, 1, 1, 2020, 850, N'740Li', N'Automatic', N'Patrol')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (22, 2, 1, 2017, 650, N'E200', N'Automatic', N'Patrol')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (23, 2, 2, 2020, 4500, N'S400', N'Automatic', N'Patrol')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (24, 3, 3, 2016, 200, N'301', N'Manual', N'Diesel')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (25, 4, 4, 2019, 300, N'Talisman', N'Automatic', N'Patrol')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (26, 5, 3, 2017, 175, N'Focus Sedan', N'Manual', N'Diesel')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (28, 6, 3, 2018, 2000, N'760Li', N'Automatic', N'Patrol')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (29, 1, 1, 2018, 650, N'530d', N'Automatic', N'Diesel')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (30, 1, 1, 2020, 1975, N'740Li', N'Automatic', N'Patrol')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DailyPrice], [Description], [GearboxType], [MotorType]) VALUES (31, 2, 1, 2017, 550, N'E180', N'Automatic', N'Diesel')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Black')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Smoked')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'White')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Red')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Blue')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Yellow')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Brown')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (8, N'Dark Green')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [Name], [UserId]) VALUES (10, N'Arslan Şirketi', 1)
INSERT [dbo].[Customers] ([Id], [Name], [UserId]) VALUES (11, N'Yıldırım Holding', 2)
INSERT [dbo].[Customers] ([Id], [Name], [UserId]) VALUES (12, N'Garanti BBVA', 3)
INSERT [dbo].[Customers] ([Id], [Name], [UserId]) VALUES (13, N'Ziraat Bankası', 4)
INSERT [dbo].[Customers] ([Id], [Name], [UserId]) VALUES (31, N'Akbank', 5)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [RentDate], [ReturnDate], [CarId], [CustomerId]) VALUES (27, CAST(N'2021-12-25T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-13T00:00:00.0000000' AS DateTime2), 20, 10)
INSERT [dbo].[Rentals] ([Id], [RentDate], [ReturnDate], [CarId], [CustomerId]) VALUES (28, CAST(N'2021-12-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-02-19T00:00:00.0000000' AS DateTime2), 25, 11)
INSERT [dbo].[Rentals] ([Id], [RentDate], [ReturnDate], [CarId], [CustomerId]) VALUES (29, CAST(N'2021-12-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-03-25T00:00:00.0000000' AS DateTime2), 28, 12)
INSERT [dbo].[Rentals] ([Id], [RentDate], [ReturnDate], [CarId], [CustomerId]) VALUES (30, CAST(N'2021-12-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-01-23T00:00:00.0000000' AS DateTime2), 29, 13)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status]) VALUES (1, N'Ayşe', N'Kor', N'aysekor@gmail.com', N'Ayse_12345', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status]) VALUES (2, N'Cahit', N'Tarancı', N'cahittarancı@gmail.com', N'Cahit_2132423', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status]) VALUES (3, N'Robert D.', N'Gonzalez', N'djrobert@gmail.com', N'Robert@213142', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status]) VALUES (4, N'Aslı', N'Kaya', N'aslikaya@gmail.com', N'Kaya@Asli123', 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [Password], [Status]) VALUES (5, N'Ferhat', N'Şengül', N'ferhatsengul@gmail.com', N'FerhatSengul-334_@', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Customers]
GO
ALTER TABLE [dbo].[CarImages]  WITH CHECK ADD  CONSTRAINT [FK_CarImages_Cars] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
GO
ALTER TABLE [dbo].[CarImages] CHECK CONSTRAINT [FK_CarImages_Cars]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Brands_BrandId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Colors_ColorId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users_UserId]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Cars_CarId]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Customers_CustomerId]
GO
USE [master]
GO
ALTER DATABASE [RentACarDb] SET  READ_WRITE 
GO
