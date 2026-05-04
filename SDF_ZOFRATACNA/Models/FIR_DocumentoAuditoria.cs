using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_DocumentoAuditoria
    {
        public int IDDocumentoAuditoria { get; set; }
        public int? IDDocumento { get; set; }
        public string IDUsuario { get; set; }
        public string NombreUsuario { get; set; }
        public string IDEquipo { get; set; }
        public string TipoOperacion { get; set; }
        public string TipoAccion { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaCambio { get; set; }
    }
}