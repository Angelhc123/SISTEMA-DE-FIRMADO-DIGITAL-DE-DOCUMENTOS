using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SDF_ZOFRATACNA.App_Code.DAL
{
    /// <summary>
    /// Clase centralizada para el acceso a datos mediante ADO.NET usando Stored Procedures.
    /// Cumple con el estándar ET-003 prohibiendo el SQL dinámico en el código fuente.
    /// </summary>
    public class ConexionBD
    {
        // Trae la cadena de conexión de la base de datos de firma desde el Web.config
        private static readonly string rutaConexion = ConfigurationManager.ConnectionStrings["SDF_Conexion"].ConnectionString;

        // Trae la cadena de conexión de la base de datos de Seguridad desde el Web.config
        private static readonly string rutaSeguridad = ConfigurationManager.ConnectionStrings["SDF_Seguridad"].ConnectionString;

        /// <summary>
        /// Ejecuta un Procedimiento Almacenado en la Base de Datos FirmaDigital y retorna un DataTable.
        /// Útil para lecturas (SELECT).
        /// </summary>
        public static DataTable EjecutarConsultaFirma(string nombreProcesoAlmacenado, SqlParameter[] parametros = null)
        {
            return EjecutarConsultaBase(rutaConexion, nombreProcesoAlmacenado, parametros);
        }

        /// <summary>
        /// Ejecuta un Procedimiento Almacenado en la Base de Datos de Seguridad y retorna un DataTable.
        /// Útil para autenticación interactuando con la DB de validaciones de accesos.
        /// </summary>
        public static DataTable EjecutarConsultaSeguridad(string nombreProcesoAlmacenado, SqlParameter[] parametros = null)
        {
            return EjecutarConsultaBase(rutaSeguridad, nombreProcesoAlmacenado, parametros);
        }

        /// <summary>
        /// Ejecuta un Procedimiento Almacenado en la Base de Datos de FirmaDigital sin retorno de filas (INSERT/UPDATE/DELETE).
        /// Requisito ET-003: Debe enviar siempre parámetros de pistas de auditoria donde aplique.
        /// </summary>
        public static int EjecutarAccionFirma(string nombreProcesoAlmacenado, SqlParameter[] parametros = null)
        {
            return EjecutarAccionBase(rutaConexion, nombreProcesoAlmacenado, parametros);
        }

        #region Métodos Privados Internos
        private static DataTable EjecutarConsultaBase(string connString, string spName, SqlParameter[] parametros)
        {
            using (SqlConnection conexion = new SqlConnection(connString))
            {
                using (SqlCommand comando = new SqlCommand(spName, conexion))
                {
                    // Mandatorio por política: Solo Stored Procedures
                    comando.CommandType = CommandType.StoredProcedure;

                    if (parametros != null)
                    {
                        comando.Parameters.AddRange(parametros);
                    }

                    using (SqlDataAdapter adaptador = new SqlDataAdapter(comando))
                    {
                        DataTable dt = new DataTable();
                        adaptador.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        private static int EjecutarAccionBase(string connString, string spName, SqlParameter[] parametros)
        {
            int filasAfectadas = 0;
            using (SqlConnection conexion = new SqlConnection(connString))
            {
                using (SqlCommand comando = new SqlCommand(spName, conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;

                    if (parametros != null)
                    {
                        comando.Parameters.AddRange(parametros);
                    }

                    conexion.Open();
                    filasAfectadas = comando.ExecuteNonQuery();
                    conexion.Close();
                }
            }
            return filasAfectadas;
        }
        #endregion
    }
}
