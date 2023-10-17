using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class Producto
    {
//        [IdProducto][int] PRIMARY KEY IDENTITY(1,1) NOT NULL,

//[Nombre] [varchar] (500) NULL,
//	[Descripcion][varchar] (500) NULL,
//	[IdMarca][int] NULL,
//	[IdCategoria][int] NULL,
//	[Precio][decimal](10, 2) NULL,
//	[Stock][int] NULL,
//	[RutaImagen][varchar] (100) NULL,
//	[NombreImagen][varchar] (100) NULL,
//	[Activo][bit] DEFAULT 1,
//	[FechaRegistro][datetime] DEFAULT GETDATE(),
        public int IdProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }

        public Marca oMarca { get; set; }
        public Categoria ocategoria { get; set; }
        public decimal Precio {  get; set; }
        public int Stock { get; set; }
        public string RutaImagen { get; set; }
        public string NombreImagen { get; set; }
        public bool Activo { get; set; }
    }
}
