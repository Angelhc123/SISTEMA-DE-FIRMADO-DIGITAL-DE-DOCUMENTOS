CREATE DATABASE [administracion];
GO

USE [administracion]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 29/04/2026 11:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IDEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[CodigoPersonal] [varchar](20) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[LoginUsuario] [varchar](15) NOT NULL,
	[Email] [varchar](200) NULL,
	[IDUnidadOrganica] [int] NULL,
	[IDCargo] [int] NULL,
	[IDSede] [int] NULL,
	[IdRol] [varchar](20) NULL,
	[ActivoAsist] [bit] NOT NULL,
 CONSTRAINT [pk_Empleado] PRIMARY KEY CLUSTERED 
(
	[IDEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FIR_UsuarioRol]    Script Date: 29/04/2026 11:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIR_UsuarioRol](
	[IDUsuarioRol] [int] IDENTITY(1,1) NOT NULL,
	[LoginUsuario] [varchar](15) NOT NULL,
	[CodigoRol] [varchar](20) NOT NULL,
	[Activo] [bit] NOT NULL,
	[IDUsuarioCreador] [varchar](15) NOT NULL,
	[FechaCreacion] [smalldatetime] NOT NULL,
	[IDUsuarioModificador] [varchar](15) NULL,
	[FechaModificacion] [smalldatetime] NULL,
 CONSTRAINT [pk_FIR_UsuarioRol] PRIMARY KEY CLUSTERED 
(
	[IDUsuarioRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SesionCorporativa]    Script Date: 29/04/2026 11:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SesionCorporativa](
	[IDSesion] [int] IDENTITY(1,1) NOT NULL,
	[LoginUsuario] [varchar](15) NOT NULL,
	[IPEquipo] [varchar](50) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[Activa] [bit] NOT NULL,
 CONSTRAINT [pk_SesionCorp] PRIMARY KEY CLUSTERED 
(
	[IDSesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IDEmpleado], [CodigoPersonal], [Apellido], [Nombre], [LoginUsuario], [Email], [IDUnidadOrganica], [IDCargo], [IDSede], [IdRol], [ActivoAsist]) VALUES (1, N'001', N'Admin, Principal', N'Administrador', N'admin01', N'admin@zofratacna.com.pe', NULL, NULL, NULL, N'1', 1)
INSERT [dbo].[Empleado] ([IDEmpleado], [CodigoPersonal], [Apellido], [Nombre], [LoginUsuario], [Email], [IDUnidadOrganica], [IDCargo], [IDSede], [IdRol], [ActivoAsist]) VALUES (2, N'002', N'Arce', N'Sebastian', N'reg01', N'sebastianarce2010@gmail.com', NULL, NULL, NULL, N'2', 1)
INSERT [dbo].[Empleado] ([IDEmpleado], [CodigoPersonal], [Apellido], [Nombre], [LoginUsuario], [Email], [IDUnidadOrganica], [IDCargo], [IDSede], [IdRol], [ActivoAsist]) VALUES (6, N'003', N'Bruno', N'Bruno', N'firm01', N'bruno@zofratacna.com.pe', NULL, NULL, NULL, N'3', 1)
INSERT [dbo].[Empleado] ([IDEmpleado], [CodigoPersonal], [Apellido], [Nombre], [LoginUsuario], [Email], [IDUnidadOrganica], [IDCargo], [IDSede], [IdRol], [ActivoAsist]) VALUES (7, N'004', N'Ahmed', N'Ahmed', N'firm04', N'ahmed@zofratacna.com.pe', NULL, NULL, NULL, N'3', 1)
INSERT [dbo].[Empleado] ([IDEmpleado], [CodigoPersonal], [Apellido], [Nombre], [LoginUsuario], [Email], [IDUnidadOrganica], [IDCargo], [IDSede], [IdRol], [ActivoAsist]) VALUES (8, N'005', N'Angel', N'Angel', N'firm03', N'angel@zofratacna.com.pe', NULL, NULL, NULL, N'3', 1)
INSERT [dbo].[Empleado] ([IDEmpleado], [CodigoPersonal], [Apellido], [Nombre], [LoginUsuario], [Email], [IDUnidadOrganica], [IDCargo], [IDSede], [IdRol], [ActivoAsist]) VALUES (9, N'006', N'Paja', N'Piero', N'rev03', N'ppiero@zofratacna.com.pe', NULL, NULL, NULL, N'4', 1)
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[FIR_UsuarioRol] ON 

INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (1, N'admin01', N'ADMIN', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (2, N'reg01', N'REGISTRADOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (3, N'rev01', N'REVISOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (4, N'rev02', N'REVISOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (5, N'firm01', N'FIRMADOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (6, N'firm02', N'FIRMADOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (7, N'firm03', N'FIRMADOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (8, N'firm04', N'FIRMADOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[FIR_UsuarioRol] ([IDUsuarioRol], [LoginUsuario], [CodigoRol], [Activo], [IDUsuarioCreador], [FechaCreacion], [IDUsuarioModificador], [FechaModificacion]) VALUES (9, N'rev03', N'REVISOR', 1, N'SISTEMA', CAST(N'2026-04-24T23:35:00' AS SmallDateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[FIR_UsuarioRol] OFF
GO
SET IDENTITY_INSERT [dbo].[SesionCorporativa] ON 

INSERT [dbo].[SesionCorporativa] ([IDSesion], [LoginUsuario], [IPEquipo], [FechaInicio], [Activa]) VALUES (1, N'admin01', N'127.0.0.1', CAST(N'2026-04-24T23:05:21.800' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[SesionCorporativa] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_Empleado_Login]    Script Date: 29/04/2026 11:32:06 ******/
ALTER TABLE [dbo].[Empleado] ADD  CONSTRAINT [uq_Empleado_Login] UNIQUE NONCLUSTERED 
(
	[LoginUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_FIR_UsuarioRol_Login]    Script Date: 29/04/2026 11:32:06 ******/
ALTER TABLE [dbo].[FIR_UsuarioRol] ADD  CONSTRAINT [uq_FIR_UsuarioRol_Login] UNIQUE NONCLUSTERED 
(
	[LoginUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleado] ADD  DEFAULT ((1)) FOR [ActivoAsist]
GO
ALTER TABLE [dbo].[FIR_UsuarioRol] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[FIR_UsuarioRol] ADD  DEFAULT ('SISTEMA') FOR [IDUsuarioCreador]
GO
ALTER TABLE [dbo].[FIR_UsuarioRol] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[SesionCorporativa] ADD  DEFAULT (getdate()) FOR [FechaInicio]
GO
ALTER TABLE [dbo].[SesionCorporativa] ADD  DEFAULT ((1)) FOR [Activa]
GO
ALTER TABLE [dbo].[FIR_UsuarioRol]  WITH CHECK ADD  CONSTRAINT [ch_FIR_UsuarioRol_Rol] CHECK  (([CodigoRol]='FIRMADOR' OR [CodigoRol]='REVISOR' OR [CodigoRol]='REGISTRADOR' OR [CodigoRol]='ADMIN'))
GO
ALTER TABLE [dbo].[FIR_UsuarioRol] CHECK CONSTRAINT [ch_FIR_UsuarioRol_Rol]
GO
/****** Object:  StoredProcedure [dbo].[FIR_S_ObtenerSesion]    Script Date: 29/04/2026 11:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FIR_S_ObtenerSesion]
    @LoginUsuario VARCHAR(15)
AS
BEGIN
    SET NOCOUNT OFF;
    -- PRODUCCION: usar FIR_VW_UsuarioSesion
    -- DESARROLLO: cambiar a FIR_VW_UsuarioSesionPrueba
    SELECT
        LoginUsuario,
        NombreCompleto,
        Email,
        CodigoRol,
        DescripcionRol,
        UrlDashboard
    FROM dbo.FIR_VW_UsuarioSesion
    WHERE LoginUsuario = @LoginUsuario;
END
GO

