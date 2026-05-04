using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_DocumentoRevisor
    {
        public int IDDocumentoRevisor { get; set; }
        public int IDDocumento { get; set; }
        public string LoginUsuario { get; set; }
        public string NombreRevisor { get; set; }
        public string CorreoRevisor { get; set; }
        public int DiasMaxRevision { get; set; }
        public DateTime? FechaLimite { get; set; }
        public bool Completado { get; set; }
        public string CodigoResultado { get; set; }
        public DateTime? FechaRevision { get; set; }
        public int Version { get; set; }
        public string IDUsuarioCreador { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string IDUsuarioModificador { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}