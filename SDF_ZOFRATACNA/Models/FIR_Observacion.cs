using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_Observacion
    {
        public int IDObservacion { get; set; }
        public int IDDocumento { get; set; }
        public string LoginUsuario { get; set; }
        public string NombreRevisor { get; set; }
        public string Descripcion { get; set; }
        public int Version { get; set; }
        public string IDUsuarioCreador { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string IDUsuarioModificador { get; set; }
        public DateTime? FechaModificacion { get; set; }

        public static System.Data.DataTable ListarPorDocumento(int idDocumento)
        {
            string sqlObs = "SELECT NombreRevisor, Descripcion, FechaCreacion FROM FIR_Observacion WHERE IDDocumento = @ID ORDER BY FechaCreacion DESC";
            return SDF_ZOFRATACNA.App_Code.DAL.ConexionBD.EjecutarConsultaFirmaSQL(sqlObs, new System.Data.SqlClient.SqlParameter[] { new System.Data.SqlClient.SqlParameter("@ID", idDocumento) });
        }
    }
}