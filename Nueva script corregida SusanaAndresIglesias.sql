USE [master]
GO
/****** Object:  Database [SusanaAndresIglesias]    Script Date: 10/11/2022 20:40:16 ******/
CREATE DATABASE [SusanaAndresIglesias]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SusanaAndresIglesias', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SusanaAndresIglesias.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SusanaAndresIglesias_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SusanaAndresIglesias_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SusanaAndresIglesias] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SusanaAndresIglesias].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SusanaAndresIglesias] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET ARITHABORT OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SusanaAndresIglesias] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SusanaAndresIglesias] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SusanaAndresIglesias] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SusanaAndresIglesias] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SusanaAndresIglesias] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SusanaAndresIglesias] SET  MULTI_USER 
GO
ALTER DATABASE [SusanaAndresIglesias] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SusanaAndresIglesias] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SusanaAndresIglesias] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SusanaAndresIglesias] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SusanaAndresIglesias] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SusanaAndresIglesias] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SusanaAndresIglesias] SET QUERY_STORE = OFF
GO
USE [SusanaAndresIglesias]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 10/11/2022 20:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellidos] [varchar](30) NOT NULL,
	[DNI] [varchar](12) NOT NULL,
	[Fecha_Nacimiento] [datetime] NULL,
	[Domicilio] [text] NOT NULL,
	[Codigo_Postal] [varchar](10) NULL,
	[Ciudad] [varchar](20) NULL,
	[Pais] [varchar](20) NULL,
	[Telefono] [int] NOT NULL,
	[Email] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATOS_PAGO]    Script Date: 10/11/2022 20:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATOS_PAGO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRESERVAS] [int] NOT NULL,
	[idFACTURAS] [int] NOT NULL,
	[Fecha_Reserva] [datetime] NULL,
	[Importe] [money] NOT NULL,
	[Modo_Pago] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURAS]    Script Date: 10/11/2022 20:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURAS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idDATOS_PAGO] [int] NOT NULL,
	[Importe] [money] NOT NULL,
	[Concepto] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVAS]    Script Date: 10/11/2022 20:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVAS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCLIENTE] [int] NOT NULL,
	[idDATOS_PAGO] [int] NOT NULL,
	[Fecha_Reserva] [datetime] NOT NULL,
	[Matricula] [varchar](10) NOT NULL,
	[Marca_vehiculo] [varchar](20) NOT NULL,
	[PRUEBA_AGREGAR] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTES] ON 

INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (1, N'Pedro', N'Fernandez', N'12123456', CAST(N'1980-12-12T00:00:00.000' AS DateTime), N'Calle Calvo Sotelo', N'39014', N'Santander', N'España', 11223344, N'pruebacambio@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (2, N'Angel', N'Garcia', N'12121212', CAST(N'1977-12-12T00:00:00.000' AS DateTime), N'Calle General Davila', N'39024', N'Santander', N'España', 942211212, N'agar@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (3, N'Susana', N'Fernandez', N'12123455', CAST(N'1976-12-12T00:00:00.000' AS DateTime), N'Calle Marques de la Hermida', N'39011', N'Santander', N'España', 942121314, N'sfer@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (4, N'David', N'Fuente', N'99883663', CAST(N'1980-12-11T00:00:00.000' AS DateTime), N'Paseo Pereda', N'39041', NULL, NULL, 942323232, N'dafer@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (5, N'Jorge', N'Perez', N'44444444', CAST(N'1970-12-10T00:00:00.000' AS DateTime), N'Calle Pesquera', NULL, N'null', N'null', 942666666, N'jper@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (6, N'Pablo', N'Fernandez', N'12123456', CAST(N'1980-12-12T00:00:00.000' AS DateTime), N'Calle Calvo Sotelo', N'39024', N'Santander', N'España', 942131344, N'pafer@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (7, N'Jorge', N'Gracia', N'13256633', CAST(N'1969-12-12T00:00:00.000' AS DateTime), N'Calle Calvo Sotelo', N'39014', N'null', N'null', 942154612, N'jorgra@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (8, N'Ana', N'Fernandez', N'11556699', CAST(N'1979-12-12T00:00:00.000' AS DateTime), N'Calle Hernan Cortes', N'39014', N'Bezana', N'España', 942157896, N'anafer@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (9, N'Marta', N'Bedia', N'12123456', CAST(N'1980-12-12T00:00:00.000' AS DateTime), N'Rampa Sotileza', NULL, NULL, NULL, 942137899, N'marbed@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (10, N'Sara', N'Iglesias', N'48963321', CAST(N'1977-12-12T00:00:00.000' AS DateTime), N'Barrio San Jose', N'39479', N'Pielagos', N'España', 942997788, N'saigl@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (11, N'Mayte', N'Suarez', N'09456321', CAST(N'1960-12-10T00:00:00.000' AS DateTime), N'Avda del Mar', NULL, N'Santander', N'España', 942298930, N'maysu@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (12, N'Peter', N'Piedra', N'07123456', CAST(N'1980-12-12T00:00:00.000' AS DateTime), N'Rampa Sotileza', N'39026', N'Santander', N'null', 942317899, N'peterpied@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (13, N'Paloma', N'Piedra', N'11123456', CAST(N'1980-08-12T00:00:00.000' AS DateTime), N'Calle Hernan Cortes', N'39026', N'null', N'null', 942138799, N'palopied@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (14, N'Diego', N'Salcedo', N'07123456', CAST(N'1950-12-10T00:00:00.000' AS DateTime), N'Rampa Sotileza', NULL, NULL, NULL, 941237899, N'diesalc@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (15, N'Jorge', N'Piedra', N'01123456', CAST(N'1975-08-12T00:00:00.000' AS DateTime), N'Pasaje Peña', N'39025', N'null', N'null', 942138799, N'jorgpied@gmail.com')
INSERT [dbo].[CLIENTES] ([id], [Nombre], [Apellidos], [DNI], [Fecha_Nacimiento], [Domicilio], [Codigo_Postal], [Ciudad], [Pais], [Telefono], [Email]) VALUES (16, N'Angela', N'Salcedo', N'07133456', CAST(N'1950-12-10T00:00:00.000' AS DateTime), N'Rampa Sotileza', NULL, NULL, NULL, 941237399, N'sansalc@gmail.com')
SET IDENTITY_INSERT [dbo].[CLIENTES] OFF
GO
SET IDENTITY_INSERT [dbo].[DATOS_PAGO] ON 

INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (1, 1, 1, CAST(N'2020-12-10T00:00:00.000' AS DateTime), 40.5500, N'Efectivo')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (2, 2, 3, CAST(N'2019-12-10T00:00:00.000' AS DateTime), 40.5500, N'Tarjeta')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (3, 3, 4, CAST(N'2021-12-10T00:00:00.000' AS DateTime), 92.5500, N'Tarjeta')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (4, 2, 3, CAST(N'2020-12-10T00:00:00.000' AS DateTime), 90.5500, N'Tarjeta')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (5, 4, 3, CAST(N'2017-11-10T00:00:00.000' AS DateTime), 102.5500, N'Transferencia')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (6, 5, 12, CAST(N'2019-12-10T00:00:00.000' AS DateTime), 192.5500, N'Tarjeta')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (7, 6, 11, CAST(N'2022-11-10T00:00:00.000' AS DateTime), 302.5500, N'Bizum')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (8, 7, 10, CAST(N'2018-12-10T00:00:00.000' AS DateTime), 292.5500, N'Tarjeta')
INSERT [dbo].[DATOS_PAGO] ([id], [idRESERVAS], [idFACTURAS], [Fecha_Reserva], [Importe], [Modo_Pago]) VALUES (9, 9, 8, CAST(N'2022-12-10T00:00:00.000' AS DateTime), 292.5500, N'Tarjeta')
SET IDENTITY_INSERT [dbo].[DATOS_PAGO] OFF
GO
SET IDENTITY_INSERT [dbo].[FACTURAS] ON 

INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (1, 1, 40.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (2, 3, 90.5500, N'PARTICULAR')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (3, 5, 40.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (4, 7, 140.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (5, 10, 70.5500, N'PARTICULAR')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (6, 4, 340.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (7, 12, 240.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (8, 12, 100.5500, N'EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (9, 11, 80.6500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (10, 4, 199.1000, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (11, 8, 50.5500, N'PARTICULAR')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (12, 13, 130.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (13, 14, 180.5500, N'PARTICULAR')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (14, 5, 90.5500, N'PARTICULAR')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (15, 12, 40.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (16, 1, 140.5500, N'PARA EMPRESA')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (17, 3, 70.5500, N'PARTICULAR')
INSERT [dbo].[FACTURAS] ([id], [idDATOS_PAGO], [Importe], [Concepto]) VALUES (18, 9, 240.5500, N'PARA EMPRESA')
SET IDENTITY_INSERT [dbo].[FACTURAS] OFF
GO
SET IDENTITY_INSERT [dbo].[RESERVAS] ON 

INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (1, 1, 1, CAST(N'1999-12-12T00:00:00.000' AS DateTime), N'2364BMN', N'Mercedes', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (2, 2, 2, CAST(N'2014-10-10T00:00:00.000' AS DateTime), N'2398ZXY', N'BMW', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (3, 3, 4, CAST(N'2015-11-12T00:00:00.000' AS DateTime), N'5463BMN', N'Audi', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (4, 3, 3, CAST(N'2019-11-12T00:00:00.000' AS DateTime), N'5463BMN', N'Audi', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (5, 10, 11, CAST(N'2020-11-12T00:00:00.000' AS DateTime), N'5463BMN', N'Audi', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (6, 5, 9, CAST(N'2019-11-10T00:00:00.000' AS DateTime), N'1313BXN', N'Audi', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (7, 12, 6, CAST(N'2021-11-12T00:00:00.000' AS DateTime), N'4114CTT', N'BMW', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (8, 1, 7, CAST(N'2018-11-12T00:00:00.000' AS DateTime), N'2398ZXY', N'BMW', NULL)
INSERT [dbo].[RESERVAS] ([id], [idCLIENTE], [idDATOS_PAGO], [Fecha_Reserva], [Matricula], [Marca_vehiculo], [PRUEBA_AGREGAR]) VALUES (9, 10, 4, CAST(N'2021-11-12T00:00:00.000' AS DateTime), N'5463BMN', N'Audi', NULL)
SET IDENTITY_INSERT [dbo].[RESERVAS] OFF
GO
ALTER TABLE [dbo].[DATOS_PAGO]  WITH CHECK ADD  CONSTRAINT [fk_facturas] FOREIGN KEY([idFACTURAS])
REFERENCES [dbo].[FACTURAS] ([id])
GO
ALTER TABLE [dbo].[DATOS_PAGO] CHECK CONSTRAINT [fk_facturas]
GO
ALTER TABLE [dbo].[DATOS_PAGO]  WITH CHECK ADD  CONSTRAINT [fk_reservas] FOREIGN KEY([idRESERVAS])
REFERENCES [dbo].[RESERVAS] ([id])
GO
ALTER TABLE [dbo].[DATOS_PAGO] CHECK CONSTRAINT [fk_reservas]
GO
ALTER TABLE [dbo].[RESERVAS]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([idCLIENTE])
REFERENCES [dbo].[CLIENTES] ([id])
GO
ALTER TABLE [dbo].[RESERVAS] CHECK CONSTRAINT [fk_cliente]
GO
/****** Object:  StoredProcedure [dbo].[Procedimiento_SumaImporteCliente]    Script Date: 10/11/2022 20:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Procedimiento_SumaImporteCliente]
  @pIdCliente int
 as
 Begin
	SELECT CLIENTES.DNI, CLIENTES.Nombre, sum(FACTURAS.Importe)
	FROM CLIENTES
	LEFT JOIN RESERVAS ON CLIENTES.id = RESERVAS.idCLIENTE
	left join DATOS_PAGO on RESERVAS.idDATOS_PAGO = DATOS_PAGO.id
	left join FACTURAS on DATOS_PAGO.idFACTURAS = DATOS_PAGO.idFACTURAS
	where CLIENTES.id = @pIdCliente
	group by CLIENTES.DNI, CLIENTES.Nombre
   END
GO
USE [master]
GO
ALTER DATABASE [SusanaAndresIglesias] SET  READ_WRITE 
GO
