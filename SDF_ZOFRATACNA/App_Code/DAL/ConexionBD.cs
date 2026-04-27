using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

// ============================================================
// Nombre del programa  : clsConexionBD
// Descripción          : Clase centralizada para el acceso a datos
//                        mediante ADO.NET usando Stored Procedures.
//                        Cumple con el estándar ET-003 prohibiendo
//                        el SQL dinámico en el código fuente.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.App_Code.DAL
{
    /// <summary>
    /// Clase centralizada (cls) para el acceso a datos mediante ADO.NET usando Stored Procedures.
    /// Cumple con el estándar ET-003 prohibiendo el SQL dinámico en el código fuente.
    /// </summary>
    public class ConexionBD
    {
        // Cadena de conexión a la BD principal de firma (string → prefijo str)
        private static readonly string strRutaConexion = ConfigurationManager.ConnectionStrings["SDF_Conexion"].ConnectionString;

        // Cadena de conexión a la BD de seguridad (string → prefijo str)
        private static readonly string strRutaSeguridad = ConfigurationManager.ConnectionStrings["SDF_Seguridad"].ConnectionString;

        /// <summary>
        /// Ejecuta un SP en la BD FirmaDigital y retorna un DataTable.
        /// Útil para lecturas (SELECT).
        /// </summary>
        public static DataTable EjecutarConsultaFirma(string strNombreSP, SqlParameter[] parametros = null)
        {
            return EjecutarConsultaBase(strRutaConexion, strNombreSP, parametros);
        }

        /// <summary>
        /// Ejecuta un SP en la BD de Seguridad y retorna un DataTable.
        /// Útil para autenticación interactuando con la DB de validaciones de accesos.
        /// </summary>
        public static DataTable EjecutarConsultaSeguridad(string strNombreSP, SqlParameter[] parametros = null)
        {
            return EjecutarConsultaBase(strRutaSeguridad, strNombreSP, parametros);
        }

        /// <summary>
        /// Ejecuta un SP en la BD FirmaDigital sin retorno de filas (INSERT/UPDATE/DELETE).
        /// Requisito ET-003: Debe enviar parámetros de auditoría donde aplique.
        /// </summary>
        public static int EjecutarAccionFirma(string strNombreSP, SqlParameter[] parametros = null)
        {
            return EjecutarAccionBase(strRutaConexion, strNombreSP, parametros);
        }

        #region Métodos Privados Internos

        /// <summary>
        /// Método base para ejecutar un SP y retornar datos como DataTable.
        /// </summary>
        private static DataTable EjecutarConsultaBase(string strConnString, string strSpName, SqlParameter[] parametros)
        {
            // Objeto conexión ADO (cn)
            using (SqlConnection cnConexion = new SqlConnection(strConnString))
            {
                // Objeto comando ADO (com)
                using (SqlCommand comComando = new SqlCommand(strSpName, cnConexion))
                {
                    // Mandatorio por política ET-003: Solo Stored Procedures
                    comComando.CommandType = CommandType.StoredProcedure;

                    // Agregar parámetros si los hay
                    if (parametros != null)
                    {
                        comComando.Parameters.AddRange(parametros);
                    }

                    // Objeto adaptador de datos (da)
                    using (SqlDataAdapter daAdaptador = new SqlDataAdapter(comComando))
                    {
                        // Tabla de resultado (dt)
                        DataTable dtResultado = new DataTable();
                        daAdaptador.Fill(dtResultado);
                        return dtResultado;
                    }
                }
            }
        }

        /// <summary>
        /// Método base para ejecutar un SP sin retorno de filas.
        /// Retorna el número de filas afectadas (int).
        /// </summary>
        private static int EjecutarAccionBase(string strConnString, string strSpName, SqlParameter[] parametros)
        {
            // Contador de filas afectadas (int → prefijo int)
            int intFilasAfectadas = 0;

            // Objeto conexión ADO (cn)
            using (SqlConnection cnConexion = new SqlConnection(strConnString))
            {
                // Objeto comando ADO (com)
                using (SqlCommand comComando = new SqlCommand(strSpName, cnConexion))
                {
                    comComando.CommandType = CommandType.StoredProcedure;

                    // Agregar parámetros si los hay
                    if (parametros != null)
                    {
                        comComando.Parameters.AddRange(parametros);
                    }

                    cnConexion.Open();
                    intFilasAfectadas = comComando.ExecuteNonQuery();
                    cnConexion.Close();
                }
            }

            return intFilasAfectadas;
        }
        public static DataTable EjecutarConsultaFirmaSQL(string sql, SqlParameter[] pars)
        {
            using (SqlConnection cn = new SqlConnection(strRutaConexion))
            using (SqlCommand cmd = new SqlCommand(sql, cn))
            {
                cmd.CommandType = CommandType.Text;
                if (pars != null) cmd.Parameters.AddRange(pars);
                cn.Open();
                DataTable dt = new DataTable();
                new SqlDataAdapter(cmd).Fill(dt);
                return dt;
            }
        }

        public static void EjecutarAccionFirmaSQL(string sql, SqlParameter[] pars)
        {
            using (SqlConnection cn = new SqlConnection(strRutaConexion))
            using (SqlCommand cmd = new SqlCommand(sql, cn))
            {
                cmd.CommandType = CommandType.Text;
                if (pars != null) cmd.Parameters.AddRange(pars);
                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        #endregion
    }
}
