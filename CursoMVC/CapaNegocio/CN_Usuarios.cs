using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CN_Usuarios
    {
        private CD_Usuarios objCapaDato = new CD_Usuarios();

        public List<Usuario> Listar()
        {
            return objCapaDato.Listar();
        }

        public int Registrar(Usuario obj, out string Mensaje)
        {
            int i = 0;
            string campos = string.Empty;
           
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))   
            { 
                if (i >= 1)
                {
                    i = i + 1;
                    campos = campos + "Nombre,";
                }
                else
                {
                    i = i + 1;
                    Mensaje = "El Nombre del usuario no puede ser vacio";
                    campos = "Nombre, ";
                }

            }            
            if (string.IsNullOrEmpty(obj.Apellidos) || string.IsNullOrWhiteSpace(obj.Apellidos))
            {
                if(i >= 1)
                {
                    i = i + 1;
                    campos = campos + "Apellidos, ";
                }
                else
                {
                    i = i + 1;
                    Mensaje = "El Apellido del usuario no puede ser vacio";
                    campos = campos + "Apellidos, ";
                }

            } 
            if (string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
            {
                if (i >= 1)
                {
                    i = i + 1;
                    campos = campos + " Correo";
                }
               else
                {
                    i = i + 1;
                    Mensaje = "El Correo del usuario no puede ser vacio";
                    campos = campos + " Correo";
                }

            }

            if(i >= 2)
            {
                Mensaje = "Favor de llenar los campos de " + campos;
            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                string clave = "test123";
                obj.Clave = CN_Recursos.ConvertirSha256(clave);

                return objCapaDato.Registrar(obj, out Mensaje);
            }
            else
            {
                return  0;
            }
         
        }

        public bool Editar(Usuario obj, out string Mensaje)
        {
            int i = 0;
            string campos = string.Empty;

            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))

            {
                if (i >= 1)
                {
                    i = i + 1;
                    campos = campos + "Nombre,";
                }
                else
                {
                    i = i + 1;
                    Mensaje = "El Nombre del usuario no puede ser vacio";
                    campos = "Nombre, ";
                }
            }
            if (string.IsNullOrEmpty(obj.Apellidos) || string.IsNullOrWhiteSpace(obj.Apellidos))
            {
                if (i >= 1)
                {
                    i = i + 1;
                    campos = campos + "Apellidos, ";
                }
                else
                {
                    i = i + 1;
                    Mensaje = "El Apellido del usuario no puede ser vacio";
                    campos = campos + "Apellidos, ";
                }
            }
            if (string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
            {
                if (i >= 1)
                {
                    i = i + 1;
                    campos = campos + " Correo";
                }
                else
                {
                    i = i + 1;
                    Mensaje = "El Correo del usuario no puede ser vacio";
                    campos = campos + " Correo";
                }

            }
            if (i >= 2)
            {
                Mensaje = "Favor de llenar los campos de " + campos;
            }

            if (string.IsNullOrEmpty(Mensaje))
            {
                return objCapaDato.Editar(obj, out Mensaje);
            }
            else
            {
                return false;
            }
        }

        public bool Eliminar(int id, out string Mensaje)
        {
            return objCapaDato.Eliminar(id, out Mensaje);
        }
    }
}
