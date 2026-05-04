using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_VersionDocumento
    {
        public int IDVersion { get; set; }
        public int IDDocumento { get; set; }
        public int NumeroVersion { get; set; }
        public string RutaArchivo { get; set; }
        public int? IDArchivoVersion { get; set; }
        public string Motivo { get; set; }
        public string IDUsuarioCreador { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string IDUsuarioModificador { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}