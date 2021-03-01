USE [master]
GO
/****** Object:  Database [odevcsharp]    Script Date: 1.03.2021 10:22:31 ******/
CREATE DATABASE [odevcsharp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'odevcsharp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\odevcsharp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'odevcsharp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\odevcsharp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [odevcsharp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [odevcsharp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [odevcsharp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [odevcsharp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [odevcsharp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [odevcsharp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [odevcsharp] SET ARITHABORT OFF 
GO
ALTER DATABASE [odevcsharp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [odevcsharp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [odevcsharp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [odevcsharp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [odevcsharp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [odevcsharp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [odevcsharp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [odevcsharp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [odevcsharp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [odevcsharp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [odevcsharp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [odevcsharp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [odevcsharp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [odevcsharp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [odevcsharp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [odevcsharp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [odevcsharp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [odevcsharp] SET RECOVERY FULL 
GO
ALTER DATABASE [odevcsharp] SET  MULTI_USER 
GO
ALTER DATABASE [odevcsharp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [odevcsharp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [odevcsharp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [odevcsharp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [odevcsharp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [odevcsharp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'odevcsharp', N'ON'
GO
ALTER DATABASE [odevcsharp] SET QUERY_STORE = OFF
GO
USE [odevcsharp]
GO
/****** Object:  Table [dbo].[Indirimler]    Script Date: 1.03.2021 10:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indirimler](
	[UrunID] [int] NULL,
	[Iskonto] [int] NULL,
	[Tarih] [date] NULL,
	[IndirimID] [int] NOT NULL,
 CONSTRAINT [PK_Indirimler] PRIMARY KEY CLUSTERED 
(
	[IndirimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 1.03.2021 10:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[Ad] [varchar](50) NULL,
	[Pozisyon] [varchar](50) NULL,
	[Maas] [int] NULL,
	[MarketID] [int] NULL,
	[Adres] [varchar](250) NULL,
	[HaftalikIzin] [int] NULL,
	[YillikIzin] [int] NULL,
	[KullaniciID] [int] NOT NULL,
	[BaslangicTarihi] [date] NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
	[MarketAd] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Market]    Script Date: 1.03.2021 10:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Market](
	[Adres] [varchar](250) NULL,
	[Ad] [varchar](50) NULL,
	[MarketID] [int] NOT NULL,
 CONSTRAINT [PK_Market] PRIMARY KEY CLUSTERED 
(
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tedarikciler]    Script Date: 1.03.2021 10:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedarikciler](
	[Grup] [varchar](50) NULL,
	[Adres] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 1.03.2021 10:22:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunID] [int] NOT NULL,
	[UrunGrubu] [varchar](50) NULL,
	[Stok] [int] NULL,
	[Fiyat] [int] NULL,
	[IndirimliFiyat] [varchar](50) NULL,
	[MarketID] [int] NULL,
	[SonIndirimTarihi] [datetime] NULL,
	[UrunAd] [varchar](50) NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Indirimler]  WITH CHECK ADD  CONSTRAINT [FK_Indirimler_Urunler] FOREIGN KEY([UrunID])
REFERENCES [dbo].[Urunler] ([UrunID])
GO
ALTER TABLE [dbo].[Indirimler] CHECK CONSTRAINT [FK_Indirimler_Urunler]
GO
ALTER TABLE [dbo].[Kullanicilar]  WITH CHECK ADD  CONSTRAINT [FK_Kullanicilar_Market] FOREIGN KEY([MarketID])
REFERENCES [dbo].[Market] ([MarketID])
GO
ALTER TABLE [dbo].[Kullanicilar] CHECK CONSTRAINT [FK_Kullanicilar_Market]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Market] FOREIGN KEY([MarketID])
REFERENCES [dbo].[Market] ([MarketID])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Market]
GO
USE [master]
GO
ALTER DATABASE [odevcsharp] SET  READ_WRITE 
GO
