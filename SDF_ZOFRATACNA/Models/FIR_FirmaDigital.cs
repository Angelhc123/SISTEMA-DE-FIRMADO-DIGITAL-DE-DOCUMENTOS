using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SDF_ZOFRATACNA.Models
{
    public class FIR_FirmaDigital
    {
        public int IDFirmaDigital { get; set; }
        public int IDDocumento { get; set; }
        public int IDDocumentoFirmante { get; set; }
        public string HashFirma { get; set; }
        public string CertificadoSN { get; set; }
        public string CertificadoDNI { get; set; }
        public string MotivoFirma { get; set; }
        public bool FirmaValida { get; set; }
        public string RespuestaMotorFirma { get; set; }
        public string RutaPDFFirmado { get; set; }
        public string IDUsuarioCreador { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string IDUsuarioModificador { get; set; }
        public DateTime? FechaModificacion { get; set; }
    }
}