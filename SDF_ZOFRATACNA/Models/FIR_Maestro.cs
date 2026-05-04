using System;
using System.Data;
using System.Data.SqlClient;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_Maestro
    {
        #region Propiedades
        public int IDMaestro { get; set; }
        public string Tipo { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public int Orden { get; set; }
        public bool Activo { get; set; }
        #endregion

        #region Métodos
        public static DataTable ListarPorTipo(string tipo)
        {
            try
            {
                string sql = @"
                    SELECT IDMaestro, Codigo, Descripcion, Orden
                    FROM FIR_Maestro
                    WHERE Tipo = @Tipo AND Activo = 1
                    ORDER BY Orden";

                SqlParameter[] pars = { new SqlParameter("@Tipo", tipo) };
                return ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar maestro: " + ex.Message);
            }
        }

        public static string ObtenerDescripcion(string tipo, string codigo)
        {
            try
            {
                string sql = @"
                    SELECT Descripcion 
                    FROM FIR_Maestro 
                    WHERE Tipo = @Tipo AND Codigo = @Codigo AND Activo = 1";

                SqlParameter[] pars = {
                    new SqlParameter("@Tipo", tipo),
                    new SqlParameter("@Codigo", codigo)
                };

                DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, pars);
                if (dt != null && dt.Rows.Count > 0)
                    return dt.Rows[0]["Descripcion"].ToString();

                return "";
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener descripción: " + ex.Message);
            }
        }
        #endregion
    }
}