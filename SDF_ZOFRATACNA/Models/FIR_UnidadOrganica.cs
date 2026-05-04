using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using SDF_ZOFRATACNA.App_Code.DAL;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_UnidadOrganica
    {
        public int IDUnidadOrganica { get; set; }
        public string Descripcion { get; set; }
        public string Abreviatura { get; set; }
        public string CodigoUnidadOrganica { get; set; }

        public static List<FIR_UnidadOrganica> Listar()
        {
            List<FIR_UnidadOrganica> lista = new List<FIR_UnidadOrganica>();
            string sql = "SELECT IDUnidadOrganica, Descripcion, Abreviatura, CodigoUnidadOrganica FROM FIR_UnidadOrganica ORDER BY Descripcion ASC";
            
            DataTable dt = ConexionBD.EjecutarConsultaFirmaSQL(sql, null);
            foreach (DataRow row in dt.Rows)
            {
                lista.Add(new FIR_UnidadOrganica
                {
                    IDUnidadOrganica = Convert.ToInt32(row["IDUnidadOrganica"]),
                    Descripcion = row["Descripcion"].ToString(),
                    Abreviatura = row["Abreviatura"].ToString(),
                    CodigoUnidadOrganica = row["CodigoUnidadOrganica"].ToString()
                });
            }
            return lista;
        }
    }
}
