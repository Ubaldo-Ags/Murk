USE [MURK]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 07/08/2018 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_P] [varchar](50) NOT NULL,
	[Apellido_M] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Direccion] [varchar](50) NULL,
	[Colonia] [varchar](50) NULL,
	[Municipio] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_usuario]    Script Date: 07/08/2018 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tipo_usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/08/2018 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Rfid] [varchar](50) NOT NULL,
	[Id_persona] [int] NOT NULL,
	[Id_tipo_usuario] [int] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Rfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_PERSONAS]    Script Date: 07/08/2018 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PERSONAS]
AS
SELECT        dbo.Personas.Id, dbo.Usuarios.Rfid as RFID, dbo.Personas.Nombre, dbo.Personas.Apellido_P as Apellido, dbo.Personas.FechaNacimiento as Fecha_de_Nacimiento, dbo.Personas.Direccion as Direccion, dbo.Personas.Email, dbo.Personas.Telefono, dbo.Personas.Status, 
                         dbo.Tipo_usuario.Tipo, dbo.Usuarios.Status AS Expr1
FROM            dbo.Personas INNER JOIN
                         dbo.Usuarios ON dbo.Personas.Id = dbo.Usuarios.Id_persona INNER JOIN
                         dbo.Tipo_usuario ON dbo.Usuarios.Id_tipo_usuario = dbo.Tipo_usuario.Id
WHERE (dbo.Personas.Status=1) AND (dbo.Usuarios.Status=1)

GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 07/08/2018 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Id_categoria] [int] NULL,
	[Precio_compra] [money] NULL,
	[Precio_renta] [money] NULL,
	[Id_provedor] [int] NULL,
	[Stock] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 07/08/2018 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compañia]    Script Date: 07/08/2018 10:50:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compañia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Direccion] [varchar](50) NULL,
	[Municipio] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
	[CP] [varchar](10) NULL,
	[Pais] [varchar](50) NULL,
	[RFC] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Compañia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provedor]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provedor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [bigint] NULL,
	[Id_compañia] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Provedor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ARTICULOS]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ARTICULOS]
AS
SELECT        A.Id, A.Nombre, A.Descripcion, dbo.Categoria.Nombre AS Categoria, A.Precio_renta AS [Precio de Renta], A.Stock, P.Nombre AS Proveedor, C.Nombre AS Compañia
FROM            dbo.Articulos AS A INNER JOIN
                         dbo.Provedor AS P ON A.Id_provedor = P.Id INNER JOIN
                         dbo.Compañia AS C ON P.Id_compañia = C.Id INNER JOIN
                         dbo.Categoria ON A.Id_categoria = dbo.Categoria.Id
WHERE        (A.Status = 1)


GO
/****** Object:  Table [dbo].[Articulo_rfid]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo_rfid](
	[Rfid] [varchar](50) NOT NULL,
	[Id_articulo] [int] NULL,
	[Disponible] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Articulo_rfid] PRIMARY KEY CLUSTERED 
(
	[Rfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_INVENTARIO]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_INVENTARIO]
AS
SELECT        AR.Rfid, A.Nombre, A.Descripcion, C.Nombre AS Categoria, AR.Disponible
FROM            dbo.Articulo_rfid AS AR INNER JOIN
                         dbo.Articulos AS A ON AR.Id_articulo = A.Id INNER JOIN
                         dbo.Categoria AS C ON A.Id_categoria = C.Id
WHERE        (AR.Status = 1) AND (A.Status = 1)


GO
/****** Object:  View [dbo].[V_PROVEEDORES]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PROVEEDORES]
AS
SELECT        P.Id, P.Nombre, P.Apellido, P.Correo, P.Telefono, C.Nombre AS Compañia, C.Direccion, C.Estado, C.Pais
FROM            dbo.Provedor AS P INNER JOIN
                         dbo.Compañia AS C ON P.Id_compañia = C.Id
WHERE        (C.Status = 1) AND (P.Status = 1)


GO
/****** Object:  View [dbo].[V_USUARIOS]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_USUARIOS]
AS
SELECT        dbo.Usuarios.Id_persona, dbo.Usuarios.Rfid, dbo.Personas.Nombre, dbo.Personas.Apellido_P, dbo.Personas.Direccion, dbo.Personas.Municipio, dbo.Personas.Email, dbo.Personas.Telefono, dbo.Tipo_usuario.Tipo
FROM            dbo.Usuarios INNER JOIN
                         dbo.Personas ON dbo.Usuarios.Id_persona = dbo.Personas.Id INNER JOIN
                         dbo.Tipo_usuario ON dbo.Usuarios.Id_tipo_usuario = dbo.Tipo_usuario.Id
WHERE        (dbo.Personas.Status = 1) AND (dbo.Usuarios.Status = 1)
GO
/****** Object:  Table [dbo].[Conf_Modulos]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conf_Modulos](
	[id] [int] NOT NULL,
	[modulo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Conf_Modulos] PRIMARY KEY CLUSTERED 
(
	[modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conf_modulos_acciones]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conf_modulos_acciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [varchar](50) NULL,
	[Accion] [varchar](50) NULL,
	[Rfid_usuario] [varchar](50) NULL,
 CONSTRAINT [PK_Conf_modulos_acciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[Id] [int] NOT NULL,
	[Accion] [varchar](50) NULL,
	[Valor] [varchar](50) NULL,
 CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_entrada]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_entrada](
	[Id_entrada] [int] NULL,
	[Id_articulo] [int] NULL,
	[Cantidad] [int] NULL,
	[Costo_unidad] [money] NULL,
	[Costo_total] [money] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_prestamo_art]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_prestamo_art](
	[Id] [int] NOT NULL,
	[Id_prestamo] [int] NULL,
	[Rfid_articulo] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Detalle_prestamo_art] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_prestamo_libro]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_prestamo_libro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_prestamo] [int] NULL,
	[Rfid_libro] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Detalle_prestamo_libro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entradas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Rfid_empleado] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[No_articulos] [int] NULL,
	[Importe] [money] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Entradas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [varchar](50) NULL,
	[Titulo] [varchar](50) NULL,
	[Editorial] [varchar](50) NULL,
	[Autor] [varchar](50) NULL,
	[Id_genero] [int] NULL,
	[No_paginas] [int] NULL,
	[Edicion] [int] NULL,
	[Idioma] [varchar](50) NULL,
	[Precio_compra] [money] NULL,
	[Stock] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro_rfid]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro_rfid](
	[Rfid] [varchar](50) NOT NULL,
	[Id_libro] [int] NULL,
	[Disponible] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Libro_rfid] PRIMARY KEY CLUSTERED 
(
	[Rfid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prestamo_art]    Script Date: 07/08/2018 10:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo_art](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rfid_persona] [varchar](50) NULL,
	[Rfid_empleado] [varchar](50) NULL,
	[Fecha] [date] NULL,
	[Fecha_devolucion] [date] NULL,
	[Dias] [int] NULL,
	[Importe] [money] NULL,
	[Tipo_prestamo] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Prestamo_art] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recargos]    Script Date: 07/08/2018 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recargos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_prestamo] [int] NULL,
	[Dias_retraso] [int] NULL,
	[Recargo] [money] NULL,
	[Estado] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Recargos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo_rfid] ADD  CONSTRAINT [DF_Articulo_rfid_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Articulos] ADD  CONSTRAINT [DF_Articulos_status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Categoria] ADD  CONSTRAINT [DF_Categoria_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Detalle_entrada] ADD  CONSTRAINT [DF_Detalle_entrada_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro] ADD  CONSTRAINT [DF_Detalle_prestamo_libro_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Entradas] ADD  CONSTRAINT [DF_Entradas_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Genero] ADD  CONSTRAINT [DF_Genero_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Libro] ADD  CONSTRAINT [DF_Libro_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Libro_rfid] ADD  CONSTRAINT [DF_Libro_rfid_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Personas] ADD  CONSTRAINT [DF_Personas_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Prestamo_art] ADD  CONSTRAINT [DF_Prestamo_art_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Provedor] ADD  CONSTRAINT [DF_Provedor_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Recargos] ADD  CONSTRAINT [DF_Recargos_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Tipo_usuario] ADD  CONSTRAINT [DF_Tipo_usuario_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Articulo_rfid]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_rfid_Articulos] FOREIGN KEY([Id_articulo])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[Articulo_rfid] CHECK CONSTRAINT [FK_Articulo_rfid_Articulos]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Categoria] FOREIGN KEY([Id_categoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Categoria]
GO
ALTER TABLE [dbo].[Articulos]  WITH CHECK ADD  CONSTRAINT [FK_Articulos_Provedor] FOREIGN KEY([Id_provedor])
REFERENCES [dbo].[Provedor] ([Id])
GO
ALTER TABLE [dbo].[Articulos] CHECK CONSTRAINT [FK_Articulos_Provedor]
GO
ALTER TABLE [dbo].[Conf_modulos_acciones]  WITH CHECK ADD  CONSTRAINT [FK_Conf_modulos_acciones_Conf_Modulos] FOREIGN KEY([Modulo])
REFERENCES [dbo].[Conf_Modulos] ([modulo])
GO
ALTER TABLE [dbo].[Conf_modulos_acciones] CHECK CONSTRAINT [FK_Conf_modulos_acciones_Conf_Modulos]
GO
ALTER TABLE [dbo].[Conf_modulos_acciones]  WITH CHECK ADD  CONSTRAINT [FK_Conf_modulos_acciones_Usuarios] FOREIGN KEY([Rfid_usuario])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Conf_modulos_acciones] CHECK CONSTRAINT [FK_Conf_modulos_acciones_Usuarios]
GO
ALTER TABLE [dbo].[Detalle_entrada]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_entrada_Articulos] FOREIGN KEY([Id_articulo])
REFERENCES [dbo].[Articulos] ([Id])
GO
ALTER TABLE [dbo].[Detalle_entrada] CHECK CONSTRAINT [FK_Detalle_entrada_Articulos]
GO
ALTER TABLE [dbo].[Detalle_entrada]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_entrada_Entradas] FOREIGN KEY([Id_entrada])
REFERENCES [dbo].[Entradas] ([Id])
GO
ALTER TABLE [dbo].[Detalle_entrada] CHECK CONSTRAINT [FK_Detalle_entrada_Entradas]
GO
ALTER TABLE [dbo].[Detalle_prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_art_Articulo_rfid] FOREIGN KEY([Rfid_articulo])
REFERENCES [dbo].[Articulo_rfid] ([Rfid])
GO
ALTER TABLE [dbo].[Detalle_prestamo_art] CHECK CONSTRAINT [FK_Detalle_prestamo_art_Articulo_rfid]
GO
ALTER TABLE [dbo].[Detalle_prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_art_Prestamo_art] FOREIGN KEY([Id_prestamo])
REFERENCES [dbo].[Prestamo_art] ([Id])
GO
ALTER TABLE [dbo].[Detalle_prestamo_art] CHECK CONSTRAINT [FK_Detalle_prestamo_art_Prestamo_art]
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_libro_Libro_rfid] FOREIGN KEY([Rfid_libro])
REFERENCES [dbo].[Libro_rfid] ([Rfid])
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro] CHECK CONSTRAINT [FK_Detalle_prestamo_libro_Libro_rfid]
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_prestamo_libro_Prestamo_art] FOREIGN KEY([Id_prestamo])
REFERENCES [dbo].[Prestamo_art] ([Id])
GO
ALTER TABLE [dbo].[Detalle_prestamo_libro] CHECK CONSTRAINT [FK_Detalle_prestamo_libro_Prestamo_art]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [FK_Entradas_Usuarios] FOREIGN KEY([Rfid_empleado])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [FK_Entradas_Usuarios]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Genero] FOREIGN KEY([Id_genero])
REFERENCES [dbo].[Genero] ([Id])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Genero]
GO
ALTER TABLE [dbo].[Libro_rfid]  WITH CHECK ADD  CONSTRAINT [FK_Libro_rfid_Libro] FOREIGN KEY([Id_libro])
REFERENCES [dbo].[Libro] ([Id])
GO
ALTER TABLE [dbo].[Libro_rfid] CHECK CONSTRAINT [FK_Libro_rfid_Libro]
GO
ALTER TABLE [dbo].[Prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_art_Usuarios] FOREIGN KEY([Rfid_empleado])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Prestamo_art] CHECK CONSTRAINT [FK_Prestamo_art_Usuarios]
GO
ALTER TABLE [dbo].[Prestamo_art]  WITH CHECK ADD  CONSTRAINT [FK_Prestamo_art_Usuarios1] FOREIGN KEY([Rfid_persona])
REFERENCES [dbo].[Usuarios] ([Rfid])
GO
ALTER TABLE [dbo].[Prestamo_art] CHECK CONSTRAINT [FK_Prestamo_art_Usuarios1]
GO
ALTER TABLE [dbo].[Provedor]  WITH CHECK ADD  CONSTRAINT [FK_Provedor_Compañia] FOREIGN KEY([Id_compañia])
REFERENCES [dbo].[Compañia] ([Id])
GO
ALTER TABLE [dbo].[Provedor] CHECK CONSTRAINT [FK_Provedor_Compañia]
GO
ALTER TABLE [dbo].[Recargos]  WITH CHECK ADD  CONSTRAINT [FK_Recargos_Prestamo_art] FOREIGN KEY([Id_prestamo])
REFERENCES [dbo].[Prestamo_art] ([Id])
GO
ALTER TABLE [dbo].[Recargos] CHECK CONSTRAINT [FK_Recargos_Prestamo_art]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Personas] FOREIGN KEY([Id_persona])
REFERENCES [dbo].[Personas] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Personas]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Tipo_usuario] FOREIGN KEY([Id_tipo_usuario])
REFERENCES [dbo].[Tipo_usuario] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Tipo_usuario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[41] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Categoria"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ARTICULOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ARTICULOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_INVENTARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_INVENTARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 13
               Left = 334
               Bottom = 143
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PROVEEDORES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PROVEEDORES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Usuarios"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personas"
            Begin Extent = 
               Top = 48
               Left = 268
               Bottom = 178
               Right = 477
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "Tipo_usuario"
            Begin Extent = 
               Top = 204
               Left = 262
               Bottom = 317
               Right = 471
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_USUARIOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_USUARIOS'
GO
