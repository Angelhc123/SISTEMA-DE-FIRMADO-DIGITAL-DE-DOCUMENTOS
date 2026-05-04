using System;
using System.Data;
using System.Data.SqlClient;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_UsuarioRol
    {
        #region Propiedades
        public int IDUsuarioRol { get; set; }
        public string LoginUsuario { get; set; }
        public string CodigoRol { get; set; }
        public bool Activo { get; set; }
        #endregion

        #region Métodos
        public static DataTable ObtenerRoles(string loginUsuario)
        {
            try
            {
                string sql = @"
                    SELECT CodigoRol
                    FROM FIR_UsuarioRol
                    WHERE LoginUsuario = @LoginUsuario AND Activo = 1";

                SqlParameter[] pars = { new SqlParameter("@LoginUsuario", loginUsuario) };
                return ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener roles: " + ex.Message);
            }
        }
        #endregion
    }
}