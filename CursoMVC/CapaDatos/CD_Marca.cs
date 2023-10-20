using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;

using System.Data.SqlClient;
using System.Data;



namespace CapaDatos
{
    public class CD_Marca 
    {
       
        public List<Marca> ObtenerTodos()
        {
            List<Marca> lista = new List<Marca>();

            using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
            {
                string query = "SELECT * FROM fn_Marca()";
                SqlCommand cmd = new SqlCommand(query, oconexion);
                cmd.CommandType = CommandType.Text;

                try
                {
                    oconexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            lista.Add(
                                new Marca
                                {
                                    IdMarca = Convert.ToInt32(dr["IdMarca"]),
                                    Descripcion = dr["Descripcion"].ToString(),
                                    Activo = Convert.ToBoolean(dr["Activo"]),
                                    FechaRegistro = Convert.ToString(dr["FechaRegistro"])

                                }
                             );
                        }
                    }

                }
                catch (Exception ex)
                {
                    lista = new List<Marca>();
                    throw ex;
                }
                finally
                {
                    if (oconexion != null && oconexion.State != System.Data.ConnectionState.Closed)
                        oconexion.Close();
                }
                return lista;
            }
        }

        public int Registrar(Marca obj, out string Mensaje)
        {
            int idautogenerado = 0;
            Mensaje = string.Empty;

            using(SqlConnection oconexion = new SqlConnection(Conexion.cn))
            {
                SqlCommand cmd = new SqlCommand("sp_RegistrarMarca", oconexion);
                cmd.Parameters.AddWithValue("Descripcion", obj.Descripcion);
                cmd.Parameters.AddWithValue("Activo", obj.Activo);
                cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oconexion.Open();
                    cmd.ExecuteNonQuery();

                    idautogenerado = Convert.ToInt32(cmd.Parameters["Resultado"].Value);
                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();
                }
                catch (Exception ex)
                {

                    idautogenerado = 0;
                    Mensaje = ex.Message;
                }
                finally
                {
                    if (oconexion != null && oconexion.State != System.Data.ConnectionState.Closed)
                        oconexion.Close();
                }
                return idautogenerado;
            }

          
        }

        public bool Editar(Marca obj, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;

            using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
            {
                SqlCommand cmd = new SqlCommand("sp_EditarMarca", oconexion);
                cmd.Parameters.AddWithValue("IdMarca", obj.IdMarca);
                cmd.Parameters.AddWithValue("Descripcion", obj.Descripcion);
                cmd.Parameters.AddWithValue("Activo", obj.Activo);
                cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oconexion.Open();
                    cmd.ExecuteNonQuery();

                    resultado = Convert.ToBoolean(cmd.Parameters["Resultado"].Value);
                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();
                }
                catch (Exception ex)
                {
                    resultado = false;
                    Mensaje = ex.Message;
                }
                finally
                {
                    if (oconexion != null && oconexion.State != System.Data.ConnectionState.Closed)
                        oconexion.Close();
                }
                return resultado;
            }


        }

        public bool Eliminar(int id, out string Mensaje)
        {
            bool resultado = false;
            Mensaje = string.Empty;

            try
            {
                using (SqlConnection oconexion = new SqlConnection(Conexion.cn))
                {
                    SqlCommand cmd = new SqlCommand("sp_EliminarMarca", oconexion);
                    cmd.Parameters.AddWithValue("IdMarca", id);
                    cmd.Parameters.Add("Resultado", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("Mensaje", SqlDbType.VarChar, 500).Direction = ParameterDirection.Output;
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    oconexion.Open();

                    resultado = cmd.ExecuteNonQuery() > 0 ? true : false;
                    Mensaje = cmd.Parameters["Mensaje"].Value.ToString();
                }
            }
            catch (Exception ex)
            {

                resultado = false;
                Mensaje = ex.Message;
            }
            return resultado;
        }
    }
}
