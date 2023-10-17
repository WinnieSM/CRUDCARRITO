CREATE DATABASE DBCARRITO

GO

USE DBCARRITO

GO

CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] DEFAULT 1,
	[FechaRegistro] [datetime] DEFAULT GETDATE(),
)

GO

CREATE TABLE [dbo].[MARCA](
	[IdMarca] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Activo] [bit] DEFAULT 1,
	[FechaRegistro] [datetime] DEFAULT GETDATE(),
)

GO

CREATE TABLE [dbo].[DEPARTAMENTO](
	[IdDepartamento] [varchar](2) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL
)

GO

CREATE TABLE [dbo].[PROVINCIA](
	[IdProvincia] [varchar](4) NOT NULL,
	[Descripcion] [varchar](45) NOT NULL,
	[IdDepartamento] [varchar](4)
)

GO

CREATE TABLE [dbo].[DISTRITO](
	[IdDistrito] [varchar](6),
	[Descripcion] [varchar](45) NOT NULL,
	[IdProvincia] [varchar](4) NULL,
	[IdDepartamento] [int] NULL
)

GO

CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](500) NULL,
	[Descripcion] [varchar](500) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[RutaImagen] [varchar](100) NULL,
	[NombreImagen] [varchar](100) NULL,
	[Activo] [bit] DEFAULT 1,
	[FechaRegistro] [datetime] DEFAULT GETDATE(),

	CONSTRAINT FK_Marca_Producto
	FOREIGN KEY(IdMarca) REFERENCES MARCA(IdMarca)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT FK_Categoria_Producto
	FOREIGN KEY(IdCategoria) REFERENCES CATEGORIA(IdCategoria)
	ON UPDATE CASCADE
	ON DELETE CASCADE

)

GO

CREATE TABLE [dbo].[CLIENTE](
	[IdCliente] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Restablecer] [bit] DEFAULT 0,
	[Fecharegistro] [datetime] DEFAULT GETDATE(),
)

GO

CREATE TABLE [dbo].[CARRITO](
	[IdCarrito] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int]  NOT NULL,

	CONSTRAINT FK_Cliente_Carrito
	FOREIGN KEY(IdCliente) REFERENCES CLIENTE(IdCliente)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT FK_Producto_Carrito
	FOREIGN KEY(IdProducto) REFERENCES PRODUCTO(IdProducto)
	ON UPDATE CASCADE
	ON DELETE CASCADE

)

GO

CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[TotalProducto] [int] NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[Contacto] [varchar](50) NULL,
	[IdDistrito] [int] NULL,
	[Telefono] [varchar](10) NULL,
	[Direccion] [varchar](500) NULL,
	[IdTransaccion] [varchar](50) NULL, --OJO
	[FechaVenta] [datetime] DEFAULT GETDATE(),

	CONSTRAINT FK_Cliente_Venta
	FOREIGN KEY(IdCliente) REFERENCES CLIENTE(IdCliente)
	ON UPDATE CASCADE
	ON DELETE CASCADE,


)

GO

CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellidos] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](150) NULL,
	[Restablecer] [bit] DEFAULT 1,
	[Activo] [bit] DEFAULT 1,
	[Fecharegistro] [datetime] DEFAULT GETDATE()

)

GO

CREATE TABLE [dbo].[DETALLE_VENTA](
	[IdDetalleVenta] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[Total] [decimal](10, 2) NULL,

	CONSTRAINT FK_Venta_DetalleVenta
	FOREIGN KEY(IdVenta) REFERENCES Venta(IdVenta)
	ON UPDATE CASCADE
	ON DELETE CASCADE,

	CONSTRAINT FK_Producto_DetalleVenta
	FOREIGN KEY(IdProducto) REFERENCES PRODUCTO(IdProducto)
	ON UPDATE CASCADE
	ON DELETE CASCADE

)