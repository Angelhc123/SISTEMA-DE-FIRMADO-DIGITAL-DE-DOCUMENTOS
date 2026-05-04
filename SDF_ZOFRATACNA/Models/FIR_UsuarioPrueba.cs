using System;
using System.Data;
using System.Data.SqlClient;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_UsuarioPrueba
    {
        #region Propiedades
        public int IDUsuarioPrueba { get; set; }
        public string LoginUsuario { get; set; }
        public string NombreCompleto { get; set; }
        public string Email { get; set; }
        public string CodigoRol { get; set; }
        public bool Activo { get; set; }
        #endregion

        #region Métodos
        public static DataTable ListarFirmantes()
        {
            try
            {
                // Ahora apuntando a la base de datos real de Empleados mediante Cross-DB Join
                string sql = @"
                    SELECT E.LoginUsuario, (E.Nombre + ' ' + E.Apellido) AS NombreCompleto, E.Email, UR.CodigoRol
                    FROM administracion.dbo.Empleado E
                    INNER JOIN Firmador.dbo.FIR_UsuarioRol UR ON E.LoginUsuario = UR.LoginUsuario
                    WHERE UR.Activo = 1 AND UR.CodigoRol IN ('FIRMADOR', 'REVISOR')
                    ORDER BY NombreCompleto";

                return ConexionBD.EjecutarConsultaFirmaSQL(sql, null);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar firmantes: " + ex.Message);
            }
        }

        public static DataTable ObtenerUsuario(string loginUsuario)
        {
            try
            {
                string sql = @"
                    SELECT LoginUsuario, NombreCompleto, Email, CodigoRol
                    FROM FIR_UsuarioPrueba
                    WHERE LoginUsuario = @LoginUsuario AND Activo = 1";

                SqlParameter[] pars = { new SqlParameter("@LoginUsuario", loginUsuario) };
                return ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener usuario: " + ex.Message);
            }
        }
        #endregion
    }
}