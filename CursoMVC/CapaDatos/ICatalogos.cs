using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;

namespace CapaDatos
{
    public interface ICatalogos <T>
    {
        List<T> ObtenerTodos();
        T Obtener(int id);
        bool Agregar(T entidad);
        bool Modificar(T entidad);
        bool Eliminar(int id);

    }
}
