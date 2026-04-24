using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// ============================================================
// Nombre del programa  : frmPortalFirma
// Descripción          : Portal de firma digital del Firmante.
//                        Muestra el visor de PDF (con firmas
//                        anteriores si las hay) y los botones
//                        de acción para invocar el software de
//                        firma (ReFirma / Firma Perú), observar
//                        o descargar el documento.
// Fecha desarrollo     : 24/04/2026
// Desarrollador        : Equipo TI ZOFRATACNA
// Fecha mantenimiento  :
// Persona que lo realizó:
// Nro. solicitud mant. :
// Descripción mant.    :
// ============================================================

namespace SDF_ZOFRATACNA.Formularios.Firma
{
    public partial class frmPortalFirma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Validación de sesión: redirige al login si no está autenticado
            if (Session["IdUsuario"] == null)
            {
                Response.Redirect("~/frmLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosUsuario();
            }
        }

        /// <summary>
        /// Carga los datos del usuario autenticado en los controles de perfil.
        /// </summary>
        private void CargarDatosUsuario()
        {
            Label lblNombreUsuario = (Label)FindControl("lblNombreUsuario");
            Image imgPerfil        = (Image)FindControl("imgPerfil");

            // Asignar nombre del usuario desde sesión
            if (Session["Nombres"] != null && lblNombreUsuario != null)
            {
                lblNombreUsuario.Text = Session["Nombres"].ToString();
            }

            // Asignar foto de perfil si está disponible en sesión
            if (Session["UrlFoto"] != null && !string.IsNullOrEmpty(Session["UrlFoto"].ToString()) && imgPerfil != null)
            {
                imgPerfil.ImageUrl = Session["UrlFoto"].ToString();
            }
        }

        protected void btnFirmar_Click(object sender, EventArgs e)
        {
            // Simulación de firma exitosa
            // TODO: Invocar integración con ReFirma / Firma Perú y llamar SP de actualización
            Response.Write("<script>alert('Documento firmado exitosamente (simulación).'); window.location='frmMisDocumentosFirmante.aspx';</script>");
        }

        protected void btnDescargarPDF_Click(object sender, EventArgs e)
        {
            // TODO: Implementar descarga real del PDF desde la ruta almacenada en BD
            Response.Write("<script>alert('Descargando PDF (simulación).');</script>");
        }

        protected void btnObservar_Click(object sender, EventArgs e)
        {
            // TODO: Registrar observación en BD mediante SP y actualizar estado del documento
            Response.Write("<script>alert('Observación registrada (simulación).'); window.location='frmMisDocumentosFirmante.aspx';</script>");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Limpiar sesión y redirigir al login
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/frmLogin.aspx");
        }
    }
}
