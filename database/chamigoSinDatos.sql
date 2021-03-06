USE [Chamigo]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 19/10/2021 10:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[NombreCliente] [nchar](30) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Password] [nchar](70) NOT NULL,
	[Dni] [int] NULL,
	[Telefono] [int] NULL,
	[TelefonoAlternativo] [int] NULL,
	[CalleDomicilio] [nchar](30) NULL,
	[NumeroCalle] [smallint] NULL,
	[PisoDepartamento] [nchar](20) NULL,
	[IdProvincia] [smallint] NULL,
	[Localidad] [nchar](30) NULL,
	[CodigoPostal] [smallint] NULL,
	[Referencia] [nchar](40) NULL,
	[IdCuenta] [int] NULL,
	[FechaUltimoMovimiento] [datetime] NULL,
	[UrlFoto] [nchar](150) NULL,
	[Pregunta1] [nchar](50) NULL,
	[Respuesta1] [nchar](50) NULL,
	[Pregunta2] [nchar](50) NULL,
	[Respuesta2] [nchar](50) NULL,
	[Pregunta3] [nchar](50) NULL,
	[Respuesta3] [nchar](50) NULL,
	[FechaAlta] [datetime] NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaMonedas]    Script Date: 19/10/2021 10:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaMonedas](
	[IdCuentaMoneda] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[IdMoneda] [smallint] NOT NULL,
	[TotalCuentaMoneda] [decimal](18, 8) NOT NULL,
 CONSTRAINT [PK_CuentaMonedas] PRIMARY KEY CLUSTERED 
(
	[IdCuentaMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 19/10/2021 10:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[Cvu] [nchar](22) NOT NULL,
	[Alias] [nchar](20) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[Estado] [nchar](20) NOT NULL,
 CONSTRAINT [PK_cuentas] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleTransacciones]    Script Date: 19/10/2021 10:17:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleTransacciones](
	[IdDetalleTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[IdTransaccion] [smallint] NOT NULL,
	[FechaTransaccion] [datetime] NOT NULL,
	[DescripcionTransaccion] [nchar](70) NULL,
	[IdCuentaIngreso] [int] NOT NULL,
	[IdMonedaIngreso] [int] NOT NULL,
	[MontoIngreso] [decimal](18, 8) NOT NULL,
	[IdCuentaEgreso] [int] NULL,
	[IdMonedaEgreso] [int] NULL,
	[MontoEgreso] [decimal](18, 8) NULL,
 CONSTRAINT [PK_DetalleTransacciones] PRIMARY KEY CLUSTERED 
(
	[IdDetalleTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[CuentaMonedas] ADD  CONSTRAINT [DF_CuentaMonedas_TotalCuentaMoneda]  DEFAULT ((0)) FOR [TotalCuentaMoneda]
GO
ALTER TABLE [dbo].[Cuentas] ADD  CONSTRAINT [DF_Cuentas_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[DetalleTransacciones] ADD  CONSTRAINT [DF_DetalleTransacciones_FechaTransaccion]  DEFAULT (getdate()) FOR [FechaTransaccion]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_clientes_provincias] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincias] ([IdProvincia])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_clientes_provincias]
GO
ALTER TABLE [dbo].[CuentaMonedas]  WITH CHECK ADD  CONSTRAINT [FK_CuentaMonedas_CuentaMonedas] FOREIGN KEY([IdCuentaMoneda])
REFERENCES [dbo].[CuentaMonedas] ([IdCuentaMoneda])
GO
ALTER TABLE [dbo].[CuentaMonedas] CHECK CONSTRAINT [FK_CuentaMonedas_CuentaMonedas]
GO
ALTER TABLE [dbo].[CuentaMonedas]  WITH CHECK ADD  CONSTRAINT [FK_CuentaMonedas_Monedas] FOREIGN KEY([IdMoneda])
REFERENCES [dbo].[Monedas] ([IdMoneda])
GO
ALTER TABLE [dbo].[CuentaMonedas] CHECK CONSTRAINT [FK_CuentaMonedas_Monedas]
GO
