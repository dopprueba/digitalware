USE [master]
GO
/****** Object:  Database [dop_prueba_dcom]    Script Date: 9/12/2021 9:49:20 a. m. ******/
CREATE DATABASE [dop_prueba_dcom] ON  PRIMARY 
( NAME = N'dop_prueba_dcom', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\dop_prueba_dcom.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dop_prueba_dcom_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\dop_prueba_dcom_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dop_prueba_dcom] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dop_prueba_dcom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dop_prueba_dcom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET ARITHABORT OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dop_prueba_dcom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dop_prueba_dcom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dop_prueba_dcom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dop_prueba_dcom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dop_prueba_dcom] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dop_prueba_dcom] SET  MULTI_USER 
GO
ALTER DATABASE [dop_prueba_dcom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dop_prueba_dcom] SET DB_CHAINING OFF 
GO
USE [dop_prueba_dcom]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 9/12/2021 9:49:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identif] [varchar](20) NOT NULL,
	[tipo_identif] [varchar](5) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[nombre_repres_legal] [varchar](100) NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[nombre_contacto] [varchar](100) NULL,
	[vr_activo] [money] NOT NULL,
	[vr_pasivo] [money] NOT NULL,
	[vr_patrim] [money] NOT NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT ('') FOR [nombre_repres_legal]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT ('') FOR [telefono]
GO
ALTER TABLE [dbo].[cliente] ADD  DEFAULT ('') FOR [email]
GO
ALTER TABLE [dbo].[cliente] ADD  CONSTRAINT [DF_cliente_nombre_contacto]  DEFAULT ('') FOR [nombre_contacto]
GO
/****** Object:  StoredProcedure [dbo].[cliente_crear]    Script Date: 9/12/2021 9:49:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cliente_crear](
	@identif varchar(20),
	@tipo_identif varchar(5),
	@nombre varchar(100),
	@nombre_repres_legal varchar(100),
	@telefono varchar(50),
	@email varchar(100),
	@nombre_contacto varchar(100),
	@vr_activo money,
	@vr_pasivo money,
	@vr_patrim money)
as
	INSERT INTO cliente 
		(identif,
		tipo_identif,
		nombre,
		nombre_repres_legal, 
		telefono,
        email,
        nombre_contacto,
        vr_activo,
        vr_pasivo,
        vr_patrim)
     VALUES
		(@identif, 
        @tipo_identif, 
        @nombre, 
        @nombre_repres_legal, 
        @telefono, 
        @email, 
        @nombre_contacto, 
        @vr_activo,
        @vr_pasivo,
        @vr_patrim);



GO
USE [master]
GO
ALTER DATABASE [dop_prueba_dcom] SET  READ_WRITE 
GO
