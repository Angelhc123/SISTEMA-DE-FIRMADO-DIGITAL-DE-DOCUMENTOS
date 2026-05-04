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
    }
}